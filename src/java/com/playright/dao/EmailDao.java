/*  
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kadles
 */
public class EmailDao {

    private Connection connection;

    // SMTP info
    private String host;
    private String port;
    private String mailFrom;
    private String password;

    public EmailDao() {
        try {
            connection = DBUtility.getConnection();
            populateEmailProperties();
        } catch (Exception ex) {
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String fetchDataForCSV(String fromDate, String toDate) throws Exception {
        if (fromDate == null || fromDate.length() == 0) {
            fromDate = getTodaysDate();
        }

        if (toDate == null || toDate.length() == 0) {
            toDate = getTodaysDate();
        }

        StringBuilder csvData = new StringBuilder();
        csvData.append("News Date, Newspaper, Language, Headline, Edition, Supplement, Source, Page No, Height, Width, Total Article Size, Circulation Figure, Quantitative AVE, Journalist Factor, Image Exists, Image");
        csvData.append("\n");
        PreparedStatement stmt = connection.prepareStatement("select date_format(news_date,'%d/%m/%Y') as news_date,"
                + "concat('\"',IFNULL(newspaper,''),'\",\"', IFNULL(language,''),'\",\"',IFNULL(headline,''),'\",\"',"
                + "IFNULL(edition,''),'\",\"',IFNULL(supplement,''),'\",\"',IFNULL(source,''),'\",\"',"
                + "IFNULL(page_no,''),'\",\"',IFNULL(height,''),'\",\"',IFNULL(width,''),'\",\"',"
                + "IFNULL(total_article_size,''),'\",\"',IFNULL(circulation_figure,''),'\",\"',"
                + "IFNULL(quantitative_ave,''),'\",\"',IFNULL(journalist_factor,''),'\",\"',"
                + "IFNULL(image_exists,''),'\",\"',IFNULL(image_filename,''),'\"') as data "
                + "from pr_cvg_data where news_date >= str_to_date(?,'%d/%m/%Y') "
                + "and news_date <= str_to_date(?,'%d/%m/%Y')");
        stmt.setString(1, fromDate);
        stmt.setString(2, toDate);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            csvData.append("\"");
            csvData.append(rs.getString("news_date"));
            csvData.append("\",");
            csvData.append(rs.getString("data"));
            csvData.append("\n");
        }
        return csvData.toString();
    }

    private void populateEmailProperties() throws Exception {
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("select distinct name, value from pr_settings where name like 'EMAIL_%' and status = 'A'");
        Map<String, String> emailProps = new HashMap<String, String>();
        while (rs.next()) {
            emailProps.put(rs.getString("name"), rs.getString("value"));
        }

        host = emailProps.get("EMAIL_HOST");
        port = emailProps.get("EMAIL_PORT");
        mailFrom = emailProps.get("EMAIL_FROM");
        password = emailProps.get("EMAIL_PASSWORD");
    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void sendChartsEmail(String fromDate, String toDate, String recipientEmailAddress, String emailSubject, String emailContent, String chartsLink) throws Exception {
        String htmlText = "<html><body>"
                + "<br><div>" + emailContent.replaceAll("\n", "<br/>") + "</div><br><br>"
                + "<div> Click <a href=\"" + chartsLink + "\">here</a> to view the charts.</div></body></html>";
        //String subject = "Chart Report for " + getTodaysDate();
        try {
            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, recipientEmailAddress,
                    emailSubject, htmlText, null);
            Logger.getLogger(EmailDao.class.getName()).log(Level.INFO, recipientEmailAddress, "Charts Email Sent To: ");
        } catch (Exception ex) {
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, "Could not send Email");
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private String getTodaysDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(new Date());
    }

    public void sendHTMLMail(String fromDate, String toDate, String recipientEmailAddress, String emailSubject, String imageLink, Map<String, String> inlineImages) throws Exception {
        if (fromDate == null || fromDate.length() == 0) {
            fromDate = getTodaysDate();
        }

        if (toDate == null || toDate.length() == 0) {
            toDate = getTodaysDate();
        }

        String htmlText = formHtmlTemplate(fromDate, toDate, imageLink);
//        String htmlText = getTestEmail();
//        System.out.println(htmlText);
        // message info
        //String subject = "HTML Report for " + getTodaysDate();
        try {
            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, recipientEmailAddress,
                    emailSubject, htmlText, inlineImages);
            Logger.getLogger(EmailDao.class.getName()).log(Level.INFO, recipientEmailAddress, "HTML Data Email Sent To: ");
        } catch (Exception ex) {
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, "Could not send Email: ");
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Refer email_css.html in jsp folder for css version sample of this email
     * Refer email_nocss.html in jsp folder for non-css version sample of this email
     **/
    private String formHtmlTemplate(String fromDate, String toDate, String imageLink) throws Exception {
        SettingsDao settingsDao = new SettingsDao();
        String customer = "";
        try {
            customer = settingsDao.getPropValue(SettingsDao.CUSTOMER);
        } finally {
            settingsDao.close();
        }
        StringBuilder sb = new StringBuilder("<html>\n");
        sb.append("    <head>  \n");
        sb.append("        <title></title>  \n");
        sb.append("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>  \n");
        sb.append("    </head>\n");
        sb.append("    <body text=\"#000000\" link=\"#000000\" alink=\"#000000\" vlink=\"#000000\" style=\"width:11in;\">\n");
        sb.append("        <table width=\"100%\">\n");
        sb.append("            <tr>\n");
        sb.append("                <td width=\"5%\"></td>\n");
        sb.append("                <td align=\"center\" width=\"90%\">\n");
        sb.append("                    <table style=\"empty-cells: show; width: 100%; border-collapse: collapse; background-color: white;\">\n");
        sb.append("                        <tr style=\"height:20px\">\n");
        sb.append("                            <td style=\"width:10%\"></td>\n");
        sb.append("                            <td style=\"width:45%\"></td>\n");
        sb.append("                            <td style=\"width:15%\"></td>\n");
        sb.append("                            <td style=\"width:10%\"></td>\n");
        sb.append("                            <td style=\"width:10%\"></td>\n");
        sb.append("                            <td style=\"width:5%\"></td>\n");
        sb.append("                            <td style=\"width:5%\"></td>\n");
        sb.append("                        </tr>\n");
        sb.append("                        <tr style=\"height:20px\">\n");
        sb.append("                            <td colspan=\"7\"></td>\n");
        sb.append("                        </tr>\n");
        sb.append("                        <tr>\n");
        sb.append("                            <td colspan=\"7\">\n");
        sb.append("                                <div style=\"float: left; width: 15%; margin: 0 auto; padding: 20px 0 0 0\">\n");
        sb.append("                                    <img width=\"114\" src=\"cid:img_0_0_1\" alt=\"PlayRight Analytics\" title=\"PlayRight Analytics\"/>\n");
        sb.append("                                </div>\n");
        sb.append("                                <div style=\"float: left; margin: 0 auto; width: 70%;\">\n");
        sb.append("                                    <table id=\"title_tbl\" style=\"width: 100%; border-collapse: collapse; background-color: white;\">\n");
        sb.append("                                        <tr>\n");
        sb.append("                                            <td style=\"width:100%; text-align: center; padding: 5px\">\n");
        sb.append("                                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif; color: #000000; font-size: 22px; line-height: 1; *line-height: normal; white-space: nowrap; font-weight: bold;\">PlayRight Media Analysis</span>\n");
        sb.append("                                            </td>\n");
        sb.append("                                        </tr>\n");
        sb.append("                                        <tr>\n");
        sb.append("                                            <td style=\"width:100%; text-align: center; padding: 5px\">\n");
        sb.append("                                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif; color: #000000; font-size: 12px; line-height: 1; *line-height: normal; white-space: nowrap; font-weight: bold;\">");
        sb.append(customer);
        sb.append("</span>\n");
        sb.append("                                            </td>\n");
        sb.append("                                        </tr>\n");
        sb.append("                                        <tr>\n");
        sb.append("                                            <td style=\"width:100%; text-align: center; padding: 5px\">\n");
        sb.append("                                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif; color: #000000; font-size: 12px; line-height: 1; *line-height: normal; white-space: nowrap; font-weight: bold;\">");
        sb.append(fromDate);
        sb.append(" - ");
        sb.append(toDate);
        sb.append("</span>\n");
        sb.append("                                            </td>\n");
        sb.append("                                        </tr>\n");
        sb.append("                                    </table>\n");
        sb.append("                                </div>\n");
        sb.append("                                <div style=\"float: right; width: 15%; margin: 0 auto;\">\n");
        sb.append("                                    <img width=\"74\" src=\"cid:img_0_0_2\" alt=\"");
        sb.append(customer);
        sb.append("\" title=\"");
        sb.append(customer);
        sb.append("\"/>\n");
        sb.append("                                </div>\n");
        sb.append("                            </td>\n");
        sb.append("                        </tr>\n");
        sb.append("                        <tr style=\"height:20px\">\n");
        sb.append("                            <td colspan=\"7\"></td>\n");
        sb.append("                        </tr>\n");
        sb.append("                        <tr style=\"height:32px; border: 1px solid #CCCCCC; \">\n");
        sb.append("                            <td colspan=\"4\" style=\"background-color: #ecf0f1; \"></td>\n");
        sb.append("                            <td colspan=\"3\" style=\"background-color: #ecf0f1; text-indent: 0px;  vertical-align: middle;text-align: left;\">\n");
        sb.append("                                <span style=\"font-family: Verdana, Arial, Helvetica, sans-serif; color: #c0392b; white-space: nowrap; font-size: 14px; font-weight: bold\">");
        sb.append(customer);
        sb.append("</span>\n");
        sb.append("                            </td>\n");
        sb.append("                        </tr>\n");
        sb.append("                        <tr style=\"height:16px\">\n");
        sb.append("                            <td colspan=\"7\" style=\"border: 1px solid #CCCCCC; background-color: #c0392b; \"></td>\n");
        sb.append("                        </tr>\n");
        sb.append("                        <tr style=\"height:25px\">\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; background-color: #FBFCFC;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 12px; line-height: 2.4; font-weight: bold;\">Date</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; background-color: #FBFCFC;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 12px; line-height: 2.4; font-weight: bold;\">Headline</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; background-color: #FBFCFC;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 12px; line-height: 2.4; font-weight: bold;\">Publication</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; background-color: #FBFCFC;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 12px; line-height: 2.4; font-weight: bold;\">Edition</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; background-color: #FBFCFC;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 12px; line-height: 2.4; font-weight: bold;\">Source</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; background-color: #FBFCFC;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 12px; line-height: 2.4; font-weight: bold;\">Page #</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; background-color: #FBFCFC;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 12px; line-height: 2.4; font-weight: bold;\">Image</span>\n");
        sb.append("                            </td>\n");
        sb.append("                        </tr>\n");
        sb.append("                        <tr style=\"height:20px\">\n");
        sb.append("                            <td colspan=\"7\" style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; padding: 3px; background-color: #EBE8E8;\"></td>\n");
        sb.append("                        </tr>\n");
        sb.append(fetchPopulateData(fromDate, toDate, imageLink));
        sb.append("                        <tr style=\"height:15px\">\n");
        sb.append("                            <td colspan=\"7\" style=\"\"></td>\n");
        sb.append("                        </tr>                            \n");
        sb.append("                        <tr style=\"height:20px\">\n");
        sb.append("                            <td colspan=\"7\" style=\"border: 1px solid #CCCCCC; background-color: #c0392b; \"></td>\n");
        sb.append("                        </tr>                        \n");
        sb.append("                        <tr style=\"height:10px\">\n");
        sb.append("                            <td colspan=\"7\" style=\"\"></td>\n");
        sb.append("                        </tr>                            \n");
        sb.append("                        <tr>\n");
        sb.append("                            <td colspan=\"7\">\n");
        sb.append("                                <div style=\"float: left; width: 15%; margin: 0 auto; padding: 20px 0 0 0\">\n");
        sb.append("                                </div>\n");
        sb.append("                                <div style=\"float: left; margin: 0 auto; width: 70%;\">\n");
        sb.append("                                </div>\n");
        sb.append("                                <div style=\"float: right; width: 15%; margin: 0 auto;\">\n");
        sb.append("                                    <a href=\"www.revvster.in\">\n");
        sb.append("                                        <img width=\"114\" src=\"cid:img_0_0_3\" alt=\"Revvster Inc.\" title=\"Revvster Inc.\"/>\n");
        sb.append("                                    </a>\n");
        sb.append("                                </div>\n");
        sb.append("                            </td>\n");
        sb.append("                        </tr>\n");
        sb.append("                    </table>\n");
        sb.append("                </td>\n");
        sb.append("                <td width=\"5%\"></td>\n");
        sb.append("            </tr>\n");
        sb.append("        </table>\n");
        sb.append("    </body>\n");
        sb.append("</html>");
        return sb.toString();
    }

    private Object fetchPopulateData(String fromDate, String toDate, String imageLink) throws Exception {
        String queryEnglish = "select id as cvgDataId, date_format(news_date,'%d/%m/%Y') as news_date,"
                + "headline, newspaper, edition, page_no, source, image_exists, image_filename "
                + "from pr_cvg_data where lower(language) = 'english' "
                + "and news_date >= str_to_date(?,'%d/%m/%Y') "
                + "and news_date <= str_to_date(?,'%d/%m/%Y') "
                + "order by date(news_date) desc";
        PreparedStatement pstmt = connection.prepareStatement(queryEnglish);
        pstmt.setString(1, fromDate);
        pstmt.setString(2, toDate);
        ResultSet rs = pstmt.executeQuery();
        StringBuilder finalSb = new StringBuilder();
        while (rs.next()) {
            finalSb.append(getHtmlRow(rs, imageLink));
        }
        pstmt.close();
        rs.close();
        String queryVernacular = "select id as cvgDataId, date_format(news_date,'%d/%m/%Y') as news_date,"
                + "headline, newspaper, edition, page_no, source, image_exists, image_filename "
                + "from pr_cvg_data where lower(language) != 'english' "
                + "and news_date >= str_to_date(?,'%d/%m/%Y') "
                + "and news_date <= str_to_date(?,'%d/%m/%Y') "
                + "order by date(news_date) desc";
        pstmt = connection.prepareStatement(queryVernacular);
        pstmt.setString(1, fromDate);
        pstmt.setString(2, toDate);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            finalSb.append(getHtmlRow(rs, imageLink));
        }
        return finalSb.toString();
    }

    private StringBuilder getHtmlRow(ResultSet rs, String imageLink) throws SQLException {
        StringBuilder sb = new StringBuilder();
        String headline = "";
        String imageFilename = rs.getString("image_filename");
        if (imageFilename != null && !"".equals(imageFilename)) {
            headline = "<a style=\"text-decoration: none; color: #c0392b;\" target=\"_blank\" href=\""
                    + imageLink.replace("<FILENAME>", imageFilename)
                    + rs.getString("cvgDataId") + "\">" + rs.getString("headline") + "</a>";
        } else {
            headline = rs.getString("headline");
        }
        sb.append("                        <tr style=\"height:40px\">\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; padding: 3px;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 11px; line-height: 1.4;\">");
        sb.append(rs.getString("news_date"));
        sb.append("</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: left; padding: 3px;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 11px; line-height: 1.4;\">\n");
        sb.append(headline);
        sb.append("                                </span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; padding: 3px;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 11px; line-height: 1.4;\">");
        sb.append(rs.getString("newspaper"));
        sb.append("</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; padding: 3px;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 11px; line-height: 1.4;\">");
        sb.append(rs.getString("edition"));
        sb.append("</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; padding: 3px;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 11px; line-height: 1.4;\">");
        sb.append(rs.getString("source"));
        sb.append("</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; padding: 3px;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 11px; line-height: 1.4;\">");
        sb.append(rs.getInt("page_no"));
        sb.append("</span>\n");
        sb.append("                            </td>\n");
        sb.append("                            <td style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle; text-align: center; padding: 3px;\">\n");
        sb.append("                                <span style=\"font-family: 'Trebuchet MS', Helvetica, sans-serif, Monaco, monospace; color: #000000; font-size: 11px; line-height: 1.4;\">");
        sb.append(rs.getString("image_exists"));
        sb.append("</span>\n");
        sb.append("                            </td>\n");
        sb.append("                        </tr>\n");
        return sb;
    }
}