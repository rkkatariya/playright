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
public class EntityMatrix {
    public EntityMatrix() {
    }
    
    private Integer id;
    private String commodity;
    private Integer headline;
    private Integer image;
    private Integer article;
//    private Integer journalistFactor;
    private Integer cvgDataId;
    
    public EntityMatrix(Integer id,
            String commodity,
            Integer headline,
            Integer image,
            Integer article,
//            Integer journalistFactor,
            Integer coverageDataId) {
        this.id = id;
        this.commodity = commodity;
        this.headline = headline;
        this.image = image;
        this.article = article;
//        this.journalistFactor = journalistFactor;
        this.cvgDataId = coverageDataId;
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
     * @return the commodity
     */
    public String getCommodity() {
        return commodity;
    }

    /**
     * @param commodity the commodity to set
     */
    public void setCommodity(String commodity) {
        this.commodity = commodity;
    }

    /**
     * @return the headline
     */
    public Integer getHeadline() {
        return headline;
    }

    /**
     * @param headline the headline to set
     */
    public void setHeadline(Integer headline) {
        this.headline = headline;
    }

    /**
     * @return the image
     */
    public Integer getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(Integer image) {
        this.image = image;
    }

    /**
     * @return the article
     */
    public Integer getArticle() {
        return article;
    }

    /**
     * @param article the article to set
     */
    public void setArticle(Integer article) {
        this.article = article;
    }

//    /**
//     * @return the journalistFactor
//     */
//    public Integer getJournalistFactor() {
//        return journalistFactor;
//    }
//
//    /**
//     * @param journalistFactor the journalistFactor to set
//     */
//    public void setJournalistFactor(Integer journalistFactor) {
//        this.journalistFactor = journalistFactor;
//    }

    /**
     * @return the cvgDataId
     */
    public Integer getCvgDataId() {
        return cvgDataId;
    }

    /**
     * @param cvgDataId the cvgDataId to set
     */
    public void setCvgDataId(Integer cvgDataId) {
        this.cvgDataId = cvgDataId;
    }
    
    public String toString() {
        return "id:" + id +
                "\ncommodity:" + commodity +
                "\nheadline:" + headline +
                "\nimage:" + image +
                "\narticle:" + article +
                "\ncvgDataId:" + cvgDataId;
    }
    
}
