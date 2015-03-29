/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.model;

import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.Date;

/**
 *
 * @author Rahul
 */
public class CoverageData {

    public CoverageData() {
    }
    
    private Integer id;
    private Date newsDate;
    private String newspaper;
    private String headline;
    private String edition;
    private String supplement;
    private String source;
    private Integer pageNo;
    private Integer height;
    private Integer width;
    private Integer totalArticleSize;
    private Integer circulationFigure;
    private BigDecimal quantitativeAve;
    private String imageExists;
    private Integer journalistFactor;
    private String language;
    private Blob imageBlob;
    private String imageFileName;
    private String imageType;
    private String imageUrl;
    
    public CoverageData(Integer id, 
            Date newsDate,
            String newspaper, 
            String headline,
            String edition,
            String supplement,
            String source, 
            Integer pageNo,
            Integer height,
            Integer width,
            Integer totalArticleSize,
            Integer circulationFigure,
            BigDecimal quantativeAve,
            String imageExists,
            Integer journalistFactor,
            String language,
            String imageFileName,
            String imageType,
            Blob image) {
        this.id = id;
        this.newsDate = newsDate;
        this.newspaper = newspaper;
        this.headline = headline;
        this.edition = edition;
        this.supplement = supplement;
        this.source = source;
        this.pageNo = pageNo;
        this.height = height;
        this.width = width;
        this.totalArticleSize = totalArticleSize;
        this.circulationFigure = circulationFigure;
        this.quantitativeAve = quantativeAve;
        this.imageExists = imageExists;
        this.journalistFactor = journalistFactor;
        this.language = language;
        this.imageFileName = imageFileName;
        this.imageType = imageType;
        this.imageBlob = image;
    }

    /**
     * @return the newspaper
     */
    public String getNewspaper() {
        return newspaper;
    }

    /**
     * @param newspaper the newspaper to set
     */
    public void setNewspaper(String newspaper) {
        this.newspaper = newspaper;
    }

    /**
     * @return the source
     */
    public String getSource() {
        return source;
    }

    /**
     * @param source the source to set
     */
    public void setSource(String source) {
        this.source = source;
    }

    /**
     * @return the edition
     */
    public String getEdition() {
        return edition;
    }

    /**
     * @param edition the edition to set
     */
    public void setEdition(String edition) {
        this.edition = edition;
    }

    /**
     * @return the language
     */
    public String getLanguage() {
        return language;
    }

    /**
     * @param language the language to set
     */
    public void setLanguage(String language) {
        this.language = language;
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
     * @return the imageBlob
     */
    public Blob getImageBlob() {
        return imageBlob;
    }

    /**
     * @param imageBlob the imageBlob to set
     */
    public void setImageBlob(Blob imageBlob) {
        this.imageBlob = imageBlob;
    }

    /**
     * @return the newsDate
     */
    public Date getNewsDate() {
        return newsDate;
    }

    /**
     * @param newsDate the newsDate to set
     */
    public void setNewsDate(Date newsDate) {
        this.newsDate = newsDate;
    }

    /**
     * @return the headline
     */
    public String getHeadline() {
        return headline;
    }

    /**
     * @param headline the headline to set
     */
    public void setHeadline(String headline) {
        this.headline = headline;
    }

    /**
     * @return the supplement
     */
    public String getSupplement() {
        return supplement;
    }

    /**
     * @param supplement the supplement to set
     */
    public void setSupplement(String supplement) {
        this.supplement = supplement;
    }

    /**
     * @return the pageNo
     */
    public Integer getPageNo() {
        return pageNo;
    }

    /**
     * @param pageNo the pageNo to set
     */
    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    /**
     * @return the height
     */
    public Integer getHeight() {
        return height;
    }

    /**
     * @param height the height to set
     */
    public void setHeight(Integer height) {
        this.height = height;
    }

    /**
     * @return the width
     */
    public Integer getWidth() {
        return width;
    }

    /**
     * @param width the width to set
     */
    public void setWidth(Integer width) {
        this.width = width;
    }

    /**
     * @return the totalArticleSize
     */
    public Integer getTotalArticleSize() {
        return totalArticleSize;
    }

    /**
     * @param totalArticleSize the totalArticleSize to set
     */
    public void setTotalArticleSize(Integer totalArticleSize) {
        this.totalArticleSize = totalArticleSize;
    }

    /**
     * @return the circulationFigure
     */
    public Integer getCirculationFigure() {
        return circulationFigure;
    }

    /**
     * @param circulationFigure the circulationFigure to set
     */
    public void setCirculationFigure(Integer circulationFigure) {
        this.circulationFigure = circulationFigure;
    }

    /**
     * @return the quantitativeAve
     */
    public BigDecimal getQuantitativeAve() {
        return quantitativeAve;
    }

    /**
     * @param quantitativeAve the quantitativeAve to set
     */
    public void setQuantitativeAve(BigDecimal quantitativeAve) {
        this.quantitativeAve = quantitativeAve;
    }

    /**
     * @return the imageExists
     */
    public String getImageExists() {
        return imageExists;
    }

    /**
     * @param imageExists the imageExists to set
     */
    public void setImageExists(String imageExists) {
        this.imageExists = imageExists;
    }

    /**
     * @return the journalistFactor
     */
    public Integer getJournalistFactor() {
        return journalistFactor;
    }

    /**
     * @param journalistFactor the journalistFactor to set
     */
    public void setJournalistFactor(Integer journalistFactor) {
        this.journalistFactor = journalistFactor;
    }

    /**
     * @return the imageFileName
     */
    public String getImageFileName() {
        return imageFileName;
    }

    /**
     * @param imageFileName the imageFileName to set
     */
    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    /**
     * @return the imageUrl
     */
    public String getImageUrl() {
        return imageUrl;
    }

    /**
     * @param imageUrl the imageUrl to set
     */
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    /**
     * @return the imageType
     */
    public String getImageType() {
        return imageType;
    }

    /**
     * @param imageType the imageType to set
     */
    public void setImageType(String imageType) {
        this.imageType = imageType;
    }
}
