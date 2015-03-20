/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.model;

/**
 *
 * @author Rahul
 */
public class SimpleIdValue {
    
    public SimpleIdValue(){
    }
    
    private Integer id;
    private String value;

    public SimpleIdValue(Integer id, String value) {
        this.id = id;
        this.value = value;
    }
    
    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the value
     */
    public String getValue() {
        return value;
    }

    /**
     * @param value the value to set
     */
    public void setValue(String value) {
        this.value = value;
    }
    
    
}
