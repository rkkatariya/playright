/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Rahul
 */
public class DBUtility {

    private static Connection connection = null;

    /*    public static Connection getConnection() throws Exception {
     if (connection != null) {
     return connection;
     } else {
     // Store the database URL in a string
     //            String serverName = "127.0.0.1";
     //            String portNumber = "1521";
     //            String sid = "XE";
     String dbUrl = "jdbc:mysql://localhost:3306/playright?zeroDateTimeBehavior=convertToNull";
     //                    + serverName + ":" + portNumber
     //                    + ":" + sid;
     Class.forName("com.mysql.jdbc.Driver");

     // set the url, username and password for the databse
     connection = DriverManager.getConnection(dbUrl, "root", "secret");
     return connection;
     }
     } */
    public static Connection getConnection() throws Exception {
        Context initContext = new InitialContext();
        //this is needed for tomcat
//        Context envContext = (Context) initContext.lookup("java:/comp/env");
//        DataSource ds = (DataSource) envContext.lookup("playRightAnalyticsPool");
        
        //this is for glass fish
        DataSource ds = (DataSource) initContext.lookup("jdbc/playRightAnalyticsDS");        
        
        Connection conn = ds.getConnection();
        return conn;
    }

/*
    private DataSource getDataSource(String dataSourceLocation) throws NamingException {
        // Get a context for the JNDI look up
        Context ctx = new InitialContext();
        Context envContext = (Context) ctx.lookup("java:/comp/env");

        // Look up a data source
        javax.sql.DataSource ds
                = (javax.sql.DataSource) envContext.lookup(dataSourceLocation);

        return ds;
    }

    private Connection getConnection(DataSource ds) throws SQLException {
        Connection conn = null;
        // Get a connection object
        conn = ds.getConnection();

        return conn;
    }   */
}
