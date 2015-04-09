/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rahul
 */
public class SettingsDao {
    
    public static final String CUSTOMER = "SYS_CUSTOMER";
    public static final String CHART_COLORS = "CHART_COLORS";
    
    private Connection connection;

    public SettingsDao() {
        try {
            connection = DBUtility.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public HashMap<String, String> getSystemSettings() {
        HashMap<String, String> settings = new HashMap<String, String>();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select name, value from pr_settings where name like 'SYS_%' and status = 'A'");
            while (rs.next()) {
                settings.put(rs.getString("name"), rs.getString("value"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return settings;
    }
    
    public String getPropValue(String prop) {
        String value = "";
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select name, value from pr_settings where name = '" + prop + "' and status = 'A'");
            while (rs.next()) {
                value = rs.getString("value");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingsDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return value;
    }
    
}
