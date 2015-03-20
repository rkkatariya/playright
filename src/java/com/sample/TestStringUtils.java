/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sample;

/**
 *
 * @author Rahul
 */
public class TestStringUtils {
    
    public static void main(String[] args) {
        String q = "select * from pr_cvg_data order by id";
        String rq = q.replace("pr_cvg_data", "pr_cvg_data where id = 1");
        System.out.println(rq);
    }
    
}
