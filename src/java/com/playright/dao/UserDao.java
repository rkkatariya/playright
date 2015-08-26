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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rahul
 */
public class UserDao {

    private Connection dbConnection;

    private String SQL_LOGIN = "select user_id from users where user_id = ? and password = ?";
    private String SQL_INSERT = "insert into users (first_name,last_name,email,password,user_id) values (?,?,?,?,?)";

    public UserDao() {
        try {
            dbConnection = DBUtility.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String verifyUser(String userid, String password) {
        String userName = null;
        try {
            PreparedStatement ps;            
            ps = dbConnection.prepareStatement(SQL_LOGIN);
            ps.setString(1, userid);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                userName = rs.getString("user_id");
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userName;
    }

    public int createUser(String fname, String lname, String email, String password,
            String userId) {
        int result = 0;
        try {
            PreparedStatement ps;
            ps = dbConnection.prepareStatement(SQL_INSERT);
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, userId);
            result = ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public void close() {
        try {
            dbConnection.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    
}
