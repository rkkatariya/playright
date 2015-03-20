/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rahul
 */
public class UserDao {

    private Connection dbConnection;
    private PreparedStatement pStmt;

    private String SQL_LOGIN = "SELECT user_id FROM users WHERE user_id = ? AND password = ?";
    private String SQL_INSERT = "INSERT INTO users (first_name,last_name,email,password,user_id) VALUES (?,?,?,?,?)";

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
            pStmt = dbConnection.prepareStatement(SQL_LOGIN);
            pStmt.setString(1, userid);
            pStmt.setString(2, password);
            ResultSet rs = pStmt.executeQuery();
            while (rs.next()) {
                userName = rs.getString("user_id");
            }
            System.out.println(userName);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return userName;
    }

    public int createUser(String fname, String lname, String email, String password,
            String userId) {
        int result = 0;
        try {
            pStmt = dbConnection.prepareStatement(SQL_INSERT);
            pStmt.setString(1, fname);
            pStmt.setString(2, lname);
            pStmt.setString(3, email);
            pStmt.setString(4, password);
            pStmt.setString(5, userId);
            result = pStmt.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return result;
    }
}
