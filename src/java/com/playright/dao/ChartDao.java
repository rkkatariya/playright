/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.dao;

import com.google.visualization.datasource.base.TypeMismatchException;
import com.google.visualization.datasource.datatable.ColumnDescription;
import com.google.visualization.datasource.datatable.DataTable;
import com.google.visualization.datasource.datatable.TableCell;
import com.google.visualization.datasource.datatable.TableRow;
import com.google.visualization.datasource.datatable.value.BooleanValue;
import com.google.visualization.datasource.datatable.value.DateTimeValue;
import com.google.visualization.datasource.datatable.value.DateValue;
import com.google.visualization.datasource.datatable.value.NumberValue;
import com.google.visualization.datasource.datatable.value.TextValue;
import com.google.visualization.datasource.datatable.value.TimeOfDayValue;
import com.google.visualization.datasource.datatable.value.Value;
import com.google.visualization.datasource.datatable.value.ValueType;
import com.ibm.icu.util.Calendar;
import com.ibm.icu.util.GregorianCalendar;
import com.ibm.icu.util.TimeZone;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rahul
 */
public class ChartDao {

    private Connection connection;

    public ChartDao() {
        try {
            connection = DBUtility.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(ChartDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getChartColors() {
        SettingsDao settingsDao = new SettingsDao();
        String colors = "";
        try {
            colors = settingsDao.getPropValue(SettingsDao.CHART_COLORS);
        } finally {
            settingsDao.close();
        }
        return colors;
    }

    public String getMixMaxDateStr() throws SQLException {
        String query = "select min(news_date) as min_date, max(news_date) as max_date from pr_cvg_data";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        Date minDate = new Date(0);
        Date maxDate = new Date(0);
        while (rs.next()) {
            minDate = rs.getDate("min_date");
            maxDate = rs.getDate("max_date");            
        }
        return minDate.toString() + " - " + maxDate.toString();
    }

    public String getTotalPRValue(String fromDate, String toDate, String allData) throws SQLException {
        String query = addDateFilter("select sum(quantitative_ave) as totPRVal from pr_cvg_data", 
                fromDate, toDate, allData);        
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        BigDecimal totPRVal = new BigDecimal(0);
        while (rs.next()) {
            totPRVal = rs.getBigDecimal("totPRVal");
        }
        DecimalFormat formatter = new DecimalFormat("##,##,##,##,###.00");
        return formatter.format(totPRVal);
    }
    
    public DataTable getDataTable(String chart, String fromDate, String toDate, String allData) {
        String query = null;
        ArrayList<ColumnDescription> cd = new ArrayList<ColumnDescription>();
        if ("citywisesplit".equalsIgnoreCase(chart)) {
            query = "select edition, count(*) as articles " +
                    "from pr_cvg_data where edition not like 'http:%'";
            if (!"Y".equalsIgnoreCase(allData)) {
                query = query + " and news_date >= '"+fromDate+"' and news_date <= '"+toDate+"'\n";
            }
            query = query + " group by edition";
            cd.add(new ColumnDescription("edition", ValueType.TEXT, "City"));
            cd.add(new ColumnDescription("articles", ValueType.NUMBER, "Articles"));
        } else if ("languagewisesplit".equals(chart)) {
            query = addDateFilter("select language, count(*) as articles "
                    + "from pr_cvg_data group by language", 
                    fromDate, toDate, allData);
            cd.add(new ColumnDescription("language", ValueType.TEXT, "Language"));
            cd.add(new ColumnDescription("articles", ValueType.NUMBER, "Articles"));
        } else if ("newspaperwisesplit".equals(chart)) {
            query = addDateFilter("select newspaper, count(*) as articles "
                    + "from pr_cvg_data group by newspaper", 
                    fromDate, toDate, allData);
            cd.add(new ColumnDescription("newspaper", ValueType.TEXT, "Newspaper"));
            cd.add(new ColumnDescription("articles", ValueType.NUMBER, "Articles"));
        } else if ("journalfactorsplit".equals(chart)) {
            query = "select lov.list_value as journalist_factor, count(*) as articles \n" +
                    "from pr_cvg_data cd, list_of_values lov\n" +
                    "where cd.journalist_factor = lov.list_name\n" +
                    "and lov.is_deleted != 'Y'\n" +
                    "and lov.list_type = 'JOURNALIST_FACTOR'\n";
            if (!"Y".equalsIgnoreCase(allData)) {
                query = query + "and cd.news_date >= '"+fromDate+"' and cd.news_date <= '"+toDate+"'\n";
            }
            query = query + " group by journalist_factor";
            cd.add(new ColumnDescription("journalfact", ValueType.TEXT, "Journalist Factor"));
            cd.add(new ColumnDescription("articles", ValueType.NUMBER, "Articles"));
        } else if ("cfvaluebar".equals(chart)) {
            query = "select em.commodity as keyword, round(sum(\n" +
                    "(em.headline * (select value from pr_settings where name = 'FACTOR_HEADLINE' and status = 'A') +\n" +
                    "em.image * (select value from pr_settings where name = 'FACTOR_IMAGE' and status = 'A') +\n" +
                    "em.article * (select value from pr_settings where name = 'FACTOR_ARTICLE' and status = 'A') ) " + 
                    "* cd.quantitative_ave * 0.01)) as cfval\n" +
                    "from pr_entity_matrix em\n" +
                    "join pr_cvg_data cd on em.pr_cvg_data_id = cd.id\n" +
                    "join pr_keyword k on em.commodity = k.keyword\n" +
                    "where k.is_deleted != 'Y'";
            if (!"Y".equalsIgnoreCase(allData)) {
                query = query + " and cd.news_date >= '"+fromDate+"' and cd.news_date <= '"+toDate+"'";
            }
            query = query + " group by em.commodity";
            
            cd.add(new ColumnDescription("circfigval", ValueType.TEXT, "Circulation Figure"));
            cd.add(new ColumnDescription("value", ValueType.NUMBER, "INR"));
        } else if ("topenglish".equals(chart)) {
            query = "select newspaper, count(*) as count from pr_cvg_data \n" +
                    "where language = 'English'";
            if (!"Y".equalsIgnoreCase(allData)) {
                query = query + " and news_date >= '"+fromDate+"' and news_date <= '"+toDate+"'";
            }
            query = query + " group by newspaper\n" +
                    "order by count(*) desc limit 5";
            
            cd.add(new ColumnDescription("newspaper", ValueType.TEXT, "Newspaper"));
            cd.add(new ColumnDescription("articles", ValueType.NUMBER, "Articles"));
        } else if ("topvernacular".equals(chart)) {
            query = "select newspaper, count(*) as count from pr_cvg_data \n" +
                    "where language != 'English'";
            if (!"Y".equalsIgnoreCase(allData)) {
                query = query + " and news_date >= '"+fromDate+"' and news_date <= '"+toDate+"'";
            }
            query = query + " group by newspaper\n" +
                    "order by count(*) desc limit 5";
            cd.add(new ColumnDescription("newspaper", ValueType.TEXT, "Newspaper"));
            cd.add(new ColumnDescription("articles", ValueType.NUMBER, "Articles"));
        } 
        DataTable dt = new DataTable();
        try {
            dt = createDataTable(cd, getResultSet(query));
        } catch (SQLException ex) {
            Logger.getLogger(ChartDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.close();
        }
        return dt;
    }

    private ResultSet getResultSet(String query)
            throws SQLException {
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        return rs;
    }

    private static DataTable createDataTable(ArrayList<ColumnDescription> cd, ResultSet rs)
            throws SQLException {
        ArrayList<TableRow> tr = null;
        tr = buildRows(cd, rs);
        DataTable dt = new DataTable();
        dt.addColumns(cd);
        try {
            dt.addRows(tr);
        } catch (TypeMismatchException ex) {
            Logger.getLogger(ChartDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dt;
    }

    private static ArrayList<TableRow> buildRows(List<ColumnDescription> columnsDescriptions, ResultSet rs) 
            throws SQLException {
        ArrayList<TableRow> tableRows = new ArrayList<TableRow>();
        int numOfCols = columnsDescriptions.size();

        // Get the value types of the columns.
        ValueType[] columnsTypeArray = new ValueType[numOfCols];
        for (int c = 0; c < numOfCols; c++) {
            columnsTypeArray[c] = columnsDescriptions.get(c).getType();
        }

        // Build the data table rows, and in each row create the table cells with
        // the information in the result set.
        while (rs.next()) {
            TableRow tableRow = new TableRow();
            for (int c = 0; c < numOfCols; c++) {
                tableRow.addCell(buildTableCell(rs, columnsTypeArray[c], c));
            }
            tableRows.add(tableRow);
        }
        return tableRows;
    }

    /**
     * Creates a table cell from the value in the current row of the given
     * result set and the given column index. The type of the value is
     * determined by the given value type.
     *
     * @param rs The result set holding the data from the sql table. The result
     * points to the current row.
     * @param valueType The value type of the column that the cell belongs to.
     * @param column The column index. Indexes are 0-based.
     *
     * @return The table cell.
     *
     * @throws SQLException Thrown when the connection to the database failed.
     */
    private static TableCell buildTableCell(ResultSet rs, ValueType valueType,
            int column) throws SQLException {
        Value value = null;

        // SQL indexes are 1- based.
        column = column + 1;

        switch (valueType) {
            case BOOLEAN:
                value = BooleanValue.getInstance(rs.getBoolean(column));
                break;
            case NUMBER:
                value = new NumberValue(rs.getDouble(column));
                break;
            case DATE:
                Date date = rs.getDate(column);
                // If date is null it is handled later.
                if (date != null) {
                    GregorianCalendar gc
                            = new GregorianCalendar(TimeZone.getTimeZone("GMT"));
                    // Set the year, month and date in the gregorian calendar.
                    // Use the 'set' method with those parameters, and not the 'setTime'
                    // method with the date parameter, since the Date object contains the
                    // current time zone and it's impossible to change it to 'GMT'.
                    gc.set(date.getYear() + 1900, date.getMonth(), date.getDate());
                    value = new DateValue(gc);
                }
                break;
            case DATETIME:
                Timestamp timestamp = rs.getTimestamp(column);
                // If timestamp is null it is handled later.
                if (timestamp != null) {
                    GregorianCalendar gc
                            = new GregorianCalendar(TimeZone.getTimeZone("GMT"));
                    // Set the year, month, date, hours, minutes and seconds in the
                    // gregorian calendar. Use the 'set' method with those parameters,
                    // and not the 'setTime' method with the timestamp parameter, since
                    // the Timestamp object contains the current time zone and it's
                    // impossible to change it to 'GMT'.
                    gc.set(timestamp.getYear() + 1900, timestamp.getMonth(),
                            timestamp.getDate(), timestamp.getHours(), timestamp.getMinutes(),
                            timestamp.getSeconds());
                    // Set the milliseconds explicitly, as they are not saved in the
                    // underlying date.
                    gc.set(Calendar.MILLISECOND, timestamp.getNanos() / 1000000);
                    value = new DateTimeValue(gc);
                }
                break;
            case TIMEOFDAY:
                Time time = rs.getTime(column);
                // If time is null it is handled later.
                if (time != null) {
                    GregorianCalendar gc
                            = new GregorianCalendar(TimeZone.getTimeZone("GMT"));
                    // Set the hours, minutes and seconds of the time in the gregorian
                    // calendar. Set the year, month and date to be January 1 1970 like
                    // in the Time object.
                    // Use the 'set' method with those parameters,
                    // and not the 'setTime' method with the time parameter, since
                    // the Time object contains the current time zone and it's
                    // impossible to change it to 'GMT'.
                    gc.set(1970, Calendar.JANUARY, 1, time.getHours(), time.getMinutes(),
                            time.getSeconds());
                    // Set the milliseconds explicitly, otherwise the milliseconds from
                    // the time the gc was initialized are used.
                    gc.set(GregorianCalendar.MILLISECOND, 0);
                    value = new TimeOfDayValue(gc);
                }
                break;
            default:
                String colValue = rs.getString(column);
                if (colValue == null) {
                    value = TextValue.getNullValue();
                } else {
                    value = new TextValue(rs.getString(column));
                }
                break;
        }
        // Handle null values.
        if (rs.wasNull()) {
            return new TableCell(Value.getNullValueFromValueType(valueType));
        } else {
            return new TableCell(value);
        }
    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ChartDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private static String addDateFilter(String query, String fromDate, String toDate, String allData) {
        if ("Y".equalsIgnoreCase(allData)) {
            return query;
        } else {
            return query.replaceAll("pr_cvg_data", "pr_cvg_data where news_date >= '"+fromDate+"' and news_date <= '"+toDate+"'");
        }
    }
}
