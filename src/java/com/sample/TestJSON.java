/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sample;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.playright.model.EntityMatrix;

/**
 *
 * @author Rahul
 */
public class TestJSON {
    
    public static void main(String[] args) {
        String json = new String ("{\"id\":0,\"commodity\":\"Jaipur Pink Panthers\",\"headline\":0,\"image\":0,\"article\":0,\"cvgDataId\":47,\"editing\":true}");
        Gson gson = new GsonBuilder().create();
        EntityMatrix em = gson.fromJson(json, EntityMatrix.class);
        System.out.println("EM::\n" +em.toString());
    }
    
}
