/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sample;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rahul
 */
public class TestSimpleDateFormat {
    
    public static void main(String[] args) {
//        strToDate();
        todayString();
        
    }
    
    public static void strToDate() {
        try {
            String date = "22/04/2014";
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date udate = sdf.parse(date);
            java.sql.Date sdate = new java.sql.Date(udate.getTime());
            System.out.println("Original: " + date + "\nSQL Date: " + sdate);
            udate = new java.util.Date(sdate.getTime());
            System.out.println("Original: " + date + "\nUtil Date: " + udate);
        } catch (ParseException ex) {
            ex.printStackTrace();
            Logger.getLogger(TestSimpleDateFormat.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void todayString() {
        Date today = Calendar.getInstance().getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String date = sdf.format(today);
        System.out.println("Todays Date: " + date);
    }
}
