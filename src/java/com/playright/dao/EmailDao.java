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
    
    private void populateEmailProperties() throws Exception{
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("select distinct name, value from pr_settings where name like 'EMAIL_%' and status = 'A'");
        Map<String, String> emailProps = new HashMap<String, String>();
        while(rs.next()){
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
            Logger.getLogger(EmailDao.class.getName()).log(Level.INFO, null, "Email Sent");
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

        // message info
        //String subject = "HTML Report for " + getTodaysDate();
        try {
            EmbeddedImageEmailUtil.send(host, port, mailFrom, password, recipientEmailAddress,
                    emailSubject, htmlText, inlineImages);
            Logger.getLogger(EmailDao.class.getName()).log(Level.INFO, null, "Email Sent");
        } catch (Exception ex) {
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, "Could not send Email");
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private String formHtmlTemplate(String fromDate, String toDate, String imageLink) throws Exception {
        StringBuffer sb = new StringBuffer();
        sb.append("<html>");
        sb.append("<head>");
        sb.append("  <title></title>");
        sb.append("  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/>");
        sb.append("  <style type=\"text/css\">");
        sb.append("    a {text-decoration: none}");
        sb.append("  </style>");
        sb.append("</head>");
        sb.append("<body text=\"#000000\" link=\"#000000\" alink=\"#000000\" vlink=\"#000000\">");
        sb.append("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">");
        sb.append("<tr><td width=\"50%\">&nbsp;</td><td align=\"center\">");
        sb.append("<a name=\"JR_PAGE_ANCHOR_0_1\"></a>");
        sb.append("<table class=\"jrPage\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"empty-cells: show; width: 842px; border-collapse: collapse; background-color: white;\">");
        sb.append("<tr valign=\"top\" style=\"height:0\">");
        sb.append("<td style=\"width:20px\"></td>");
        sb.append("<td style=\"width:2px\"></td>");
        sb.append("<td style=\"width:3px\"></td>");
        sb.append("<td style=\"width:110px\"></td>");
        sb.append("<td style=\"width:17px\"></td>");
        sb.append("<td style=\"width:90px\"></td>");
        sb.append("<td style=\"width:42px\"></td>");
        sb.append("<td style=\"width:37px\"></td>");
        sb.append("<td style=\"width:65px\"></td>");
        sb.append("<td style=\"width:30px\"></td>");
        sb.append("<td style=\"width:81px\"></td>");
        sb.append("<td style=\"width:36px\"></td>");
        sb.append("<td style=\"width:42px\"></td>");
        sb.append("<td style=\"width:31px\"></td>");
        sb.append("<td style=\"width:74px\"></td>");
        sb.append("<td style=\"width:76px\"></td>");
        sb.append("<td style=\"width:56px\"></td>");
        sb.append("<td style=\"width:5px\"></td>");
        sb.append("<td style=\"width:5px\"></td>");
        sb.append("<td style=\"width:20px\"></td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:20px\">");
        sb.append("<td colspan=\"20\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:20px\">");
        sb.append("<td colspan=\"8\">");
        sb.append("</td>");
        sb.append("<td colspan=\"4\" rowspan=\"2\" style=\"text-indent: 0px; text-align: center;\">");
        sb.append("<span style=\"font-family: Arial; color: #000000; font-size: 16px; line-height: 1; *line-height: normal; font-weight: bold;\">Playright<br/>Data Center</span></td>");
        sb.append("<td colspan=\"8\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:18px\">");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("<td colspan=\"4\" rowspan=\"3\">");
        sb.append("<img src=\"cid:img_0_0_1\" style=\"height: 50px\" alt=\"\"/></td>");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("<td colspan=\"4\">");
        sb.append("</td>");
        sb.append("<td colspan=\"5\" rowspan=\"2\">");
        sb.append("<img src=\"cid:img_0_0_2\" style=\"height: 36px\" alt=\"\"/></td>");
        sb.append("<td>");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:18px\">");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("<td colspan=\"3\">");
        sb.append("</td>");
        sb.append("<td colspan=\"2\" style=\"text-indent: 0px; text-align: left;\">");
        sb.append("<span style=\"font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; color: #000000; font-size: 12px; line-height: 1.2578125; white-space: nowrap; font-weight: bold;\">");
        sb.append(fromDate);
        sb.append(" - ");
        sb.append(toDate);
        sb.append("</span></td>");
        sb.append("<td colspan=\"3\">");
        sb.append("</td>");
        sb.append("<td>");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:14px\">");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("<td colspan=\"14\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:32px\">");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td colspan=\"3\" style=\"background-color: #ecf0f1; text-indent: 0px;  vertical-align: middle;text-align: left;\">");
        sb.append("<span style=\"font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; color: black; white-space: nowrap; font-size: 14px; line-height: 1.2578125;\">Royal Challengers Bangalore</span></td>");
        sb.append("<td style=\"background-color: #ecf0f1; \">");
        sb.append("</td>");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:16px\">");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #c0392b; \">");
        sb.append("</td>");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:25px\">");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("<td colspan=\"3\" style=\"border: 1px solid #CCCCCC; padding-right: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
        sb.append("<span style=\"font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; color: #000000; font-size: 11px; line-height: 1.2578125; font-weight: bold;\">Date</span></td>");
        sb.append("<td colspan=\"2\" style=\"border: 1px solid #CCCCCC; padding-left: 1px; padding-right: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
        sb.append("<span style=\"font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; color: #000000; font-size: 11px; line-height: 1.2578125; font-weight: bold;\">Headline</span></td>");
        sb.append("<td colspan=\"3\" style=\"border: 1px solid #CCCCCC; padding-left: 1px; padding-right: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
        sb.append("<span style=\"font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; color: #000000; font-size: 11px; line-height: 1.2578125; font-weight: bold;\">Publication</span></td>");
        sb.append("<td colspan=\"3\" style=\"border: 1px solid #CCCCCC; padding-left: 1px; padding-right: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
        sb.append("<span style=\"font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; color: #000000; font-size: 11px; line-height: 1.2578125; font-weight: bold;\">Edition</span></td>");
        sb.append("<td colspan=\"2\" style=\"border: 1px solid #CCCCCC; padding-left: 1px; padding-right: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
        sb.append("<span style=\"font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; color: #000000; font-size: 11px; line-height: 1.2578125; font-weight: bold;\">&nbsp; Page No.</span></td>");
        sb.append("<td colspan=\"3\" style=\"border: 1px solid #CCCCCC; padding-left: 1px; padding-right: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
        sb.append("<span style=\"font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; color: #000000; font-size: 11px; line-height: 1.2578125; font-weight: bold;\">Source</span></td>");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:2px\">");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; border-left: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-top: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:20px\">");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-left: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle;text-align: left;\">");
        sb.append("<span style=\"font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; color: #333333; font-size: 11px; line-height: 1.2578125; white-space: nowrap; font-weight: bold;\"></span></td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td style=\"background-color: #EBE8E8; border-bottom: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC; \">");
        sb.append("</td>");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append(fetchPopulateData(fromDate, toDate, imageLink));
        sb.append("<tr valign=\"top\" style=\"height:18px\">");
        sb.append("<td>");
        sb.append("</td>");
        sb.append("<tr valign=\"top\" style=\"height:25px\">");
        sb.append("<td>");
        sb.append("</td>");
        sb.append("<td colspan=\"17\">");
        sb.append("<div style=\"width: 100%; height: 100%; position: relative;\">");
        sb.append("<div style=\"position: absolute; overflow: hidden; width: 100%; height: 100%; \">");
        sb.append("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"empty-cells: show; width: 100%; border-collapse: collapse;\">");
        sb.append("<tr valign=\"top\" style=\"height:0\">");
        sb.append("<td style=\"width:555px\"></td>");
        sb.append("<td style=\"width:242px\"></td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:3px\">");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:1px\">");
        sb.append("<td style=\"pointer-events: auto; background-color: #FFFFFF; border-top: 1px solid #999999; \">");
        sb.append("</td>");
        sb.append("<td>");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("</table>");
        sb.append("</div>");
        sb.append("<div style=\"position: relative; width: 100%; height: 100%; pointer-events: none; \">");
        sb.append("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"empty-cells: show; width: 100%; border-collapse: collapse;\">");
        sb.append("<tr valign=\"top\" style=\"height:0\">");
        sb.append("<td style=\"width:2px\"></td>");
        sb.append("<td style=\"width:584px\"></td>");
        sb.append("<td style=\"width:150px\"></td>");
        sb.append("<td style=\"width:61px\"></td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:25px\">");
        sb.append("<td>");
        sb.append("</td>");
        sb.append("<td style=\"pointer-events: auto; background-color: #c0392b; border-top: 1px solid #c0392b; border-left: 1px solid #c0392b; border-bottom: 1px solid #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"pointer-events: auto; background-color: #c0392b; border-top: 1px solid #c0392b; border-bottom: 1px solid #c0392b; \">");
        sb.append("</td>");
        sb.append("<td style=\"pointer-events: auto; background-color: #c0392b; border-top: 1px solid #c0392b; border-bottom: 1px solid #c0392b; border-right: 1px solid #c0392b; \">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("</table>");
        sb.append("</div>");
        sb.append("</div>");
        sb.append("</td>");
        sb.append("<td colspan=\"2\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:17px\">");
        sb.append("<td colspan=\"20\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:25px\">");
        sb.append("<td colspan=\"15\">");
        sb.append("</td>");
        sb.append("<td colspan=\"2\">");
        sb.append("<a href=\"http://revvster.in\">");
        sb.append("<img src=\"cid:img_0_0_3\" style=\"width: 150px\" alt=\"\"/></td>");
        sb.append("</a>");
        sb.append("<td colspan=\"4\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("<tr valign=\"top\" style=\"height:72px\">");
        sb.append("<td colspan=\"20\">");
        sb.append("</td>");
        sb.append("</tr>");
        sb.append("</table>");
        sb.append("<![if IE]>");
        sb.append("<script>");
        sb.append("var links = document.querySelectorAll('link.jrWebFont');");
        sb.append("setTimeout(function(){ if (links) { for (var i = 0; i < links.length; i++) { links.item(i).href = links.item(i).href; } } }, 0);");
        sb.append("</script>");
        sb.append("<![endif]>");
        sb.append("</td><td width=\"50%\">&nbsp;</td></tr>");
        sb.append("</table>");
        sb.append("</body>");
        sb.append("</html>");
        return sb.toString();
    }

    private Object fetchPopulateData(String fromDate, String toDate, String imageLink) throws Exception {
        String query = "select id as cvgDataId, date_format(news_date,'%d/%m/%Y') as news_date,headline,newspaper,edition,page_no,source, image_exists from pr_cvg_data where news_date >= str_to_date(?,'%d/%m/%Y') and news_date <= str_to_date(?,'%d/%m/%Y')";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, fromDate);
        pstmt.setString(2, toDate);
        ResultSet rs = pstmt.executeQuery();
        StringBuffer finalSb = new StringBuffer();

        while (rs.next()) {
            StringBuffer sb = new StringBuffer();
            String headline = "";
            if ("Y".equalsIgnoreCase(rs.getString("image_exists"))) {
                headline = "<span style=\"font-family: Arial; color: #000000; font-size: 11px; line-height: 1.1499023; font-weight: bold;\"><a href=\"" 
                        + imageLink + rs.getString("cvgDataId") + "\">" + rs.getString("headline") + "</a></span></td>";                
            } else {
                headline = "<span style=\"font-family: Arial; color: #000000; font-size: 11px; line-height: 1.1499023; font-weight: bold;\">"
                        + rs.getString("headline") + "</span></td>";
            }
            sb.append("<tr valign=\"top\" style=\"height:18px\"><td></td><td></td>");
            sb.append("<td colspan=\"3\" style=\"border: 1px solid #CCCCCC; padding-bottom: 1px; padding-right: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
            sb.append("<span style=\"font-family: Arial; color: #000000; font-size: 11px; line-height: 1.1499023;\">");
            sb.append(rs.getString("news_date"));
            sb.append("</span></td>");
            sb.append("<td colspan=\"2\" style=\"border: 1px solid #CCCCCC; padding-bottom: 1px; padding-right: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
            sb.append(headline);
            sb.append("<td colspan=\"3\" style=\"border: 1px solid #CCCCCC; padding-bottom: 1px; padding-right: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
            sb.append("<span style=\"font-family: Arial; color: #000000; font-size: 11px; line-height: 1.1499023;\">");
            sb.append(rs.getString("newspaper"));
            sb.append("</span></td>");
            sb.append("<td colspan=\"3\" style=\"border: 1px solid #CCCCCC; padding-bottom: 1px; padding-right: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
            sb.append("<span style=\"font-family: Arial; color: #000000; font-size: 11px; line-height: 1.1499023;\">");
            sb.append(rs.getString("edition"));
            sb.append("</span></td>");
            sb.append("<td colspan=\"2\" style=\"border: 1px solid #CCCCCC; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
            sb.append("<span style=\"font-family: Arial; color: #000000; font-size: 11px; line-height: 1.1499023;\">");
            sb.append(rs.getString("page_no"));
            sb.append("</span></td>");
            sb.append("<td colspan=\"3\" style=\"border: 1px solid #CCCCCC; padding-bottom: 1px; text-indent: 0px;  vertical-align: middle;text-align: center;\">");
            sb.append("<span style=\"font-family: Arial; color: #000000; font-size: 11px; line-height: 1.1499023;\">");
            sb.append(rs.getString("source"));
            sb.append("</span></td><td colspan=\"2\"></td></tr>");
            finalSb.append(sb);
        }

        rs.close();
        pstmt.close();
        return finalSb.toString();
    }
}
