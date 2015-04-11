/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.dao;

import com.playright.model.CoverageData;
import com.playright.model.EntityMatrix;
import com.playright.model.Keyword;
import com.playright.model.SimpleIdValue;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rahul
 */
public class DataDao {

    private Connection connection;

    public DataDao() {
        try {
            connection = DBUtility.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public CoverageData getCoverageDataById(Integer id, Boolean loadImage) {
        CoverageData cd = new CoverageData();
        try {
            PreparedStatement ps = connection.prepareStatement("select * from pr_cvg_data  where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cd = getCoverageDataObj(rs, loadImage);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cd;
    }

    public EntityMatrix getEntityMatrixById(Integer id) {
        EntityMatrix em = new EntityMatrix();
        try {
            PreparedStatement ps = connection.prepareStatement("select * from pr_entity_matrix where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                em = getEntityMatrixObj(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return em;
    }

    public ArrayList<EntityMatrix> getEntityMatrixByCvgDataId(Integer cvgDataId) {
        ArrayList<EntityMatrix> list = new ArrayList<EntityMatrix>();
        String query = "select em.id, k.keyword, em.headline, em.image, " + 
                "em.article, " + cvgDataId + " as pr_cvg_data_id " +
                "from pr_keyword k left join (select * from " +
                "pr_entity_matrix where pr_cvg_data_id = ?) em " +
                "on k.keyword = em.commodity " +
                "where k.is_deleted = 'N'";
        try {
            PreparedStatement ps = connection.prepareCall(query);
            ps.setInt(1, cvgDataId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(getEntityMatrixObj(rs));
            }
        } catch (SQLException ex) {
           Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<String> getLanguagesStartWith(String language) {
        ArrayList<String> list = new ArrayList<String>();
        PreparedStatement ps = null;
        String data;
        try {
            ps = connection.prepareStatement("select distinct language from pr_cvg_data where language like ?");
            ps.setString(1, language + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                data = rs.getString("language");
                list.add(data);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<SimpleIdValue> getLanguages() {
        ArrayList<SimpleIdValue> list = new ArrayList<SimpleIdValue>();
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            int id = 1;
            boolean others = false;
            String lang = null;
            ResultSet rs = stmt.executeQuery("select distinct language from pr_cvg_data");
            while (rs.next()) {
                lang = rs.getString("language");
                list.add(new SimpleIdValue(new Integer(id), lang));
                if ("others".equalsIgnoreCase(lang)) {
                    others = true;
                }
                id++;
            }
            if (!others) {
                list.add(new SimpleIdValue(id, "Others"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<CoverageData> getAllCoverageData() {
        ArrayList<CoverageData> list = new ArrayList<CoverageData>();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from pr_cvg_data order by id desc");
            while (rs.next()) {
                list.add(getCoverageDataObj(rs, false));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<CoverageData> getPaginatedCoverageData(int stPgIdx, int recPerPg) {
        ArrayList<CoverageData> list = new ArrayList<CoverageData>();
        int offset = (stPgIdx - 1) * recPerPg;
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from pr_cvg_data order by id desc limit " + offset + "," + recPerPg);
            while (rs.next()) {
                list.add(getCoverageDataObj(rs, false));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTableSize(String table) {
        int count = 0;
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select count(*) as count from " + table);
            while (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    private static CoverageData getCoverageDataObj(ResultSet rs, Boolean loadImage) throws SQLException {
        CoverageData cd = new CoverageData();
        cd.setId(rs.getInt("id"));
        cd.setNewsDate(rs.getDate("news_date"));
        cd.setNewspaper(rs.getString("newspaper"));
        cd.setHeadline(rs.getString("headline"));
        cd.setEdition(rs.getString("edition"));
        cd.setSupplement(rs.getString("supplement"));
        cd.setSource(rs.getString("source"));
        cd.setPageNo(rs.getInt("page_no"));
        cd.setHeight(rs.getInt("height"));
        cd.setWidth(rs.getInt("width"));
        cd.setTotalArticleSize(rs.getInt("total_article_size"));
        cd.setCirculationFigure(rs.getInt("circulation_figure"));
        cd.setQuantitativeAve(rs.getBigDecimal("quantitative_ave"));
        cd.setImageExists(rs.getString("image_exists"));
        cd.setJournalistFactor(rs.getInt("journalist_factor"));
        cd.setLanguage(rs.getString("language"));
        //Get blob only when needed
        if (loadImage) {
            cd.setImageBlob(rs.getBlob("image"));
        }
        cd.setImageType(rs.getString("image_type"));
        String filename = rs.getString("image_filename"); 
        cd.setImageFileName(filename);
        if (filename != null && !"".equals(filename)) {
            cd.setImageUrl("<a target=\"_blank\" href=\"../image.jsp?cvgDataId="+rs.getInt("id")+"\">img</a>");
        }
        return cd;
    }

    private static EntityMatrix getEntityMatrixObj(ResultSet rs) throws SQLException {
        EntityMatrix em = new EntityMatrix();
        em.setId(rs.getInt("id"));
        em.setCommodity(rs.getString("keyword"));
        em.setHeadline(rs.getInt("headline"));
        em.setArticle(rs.getInt("article"));
        em.setImage(rs.getInt("image"));
        em.setCvgDataId(rs.getInt("pr_cvg_data_id"));
        return em;
    }

    public void addCoverageData(CoverageData cd) {
        try {
            PreparedStatement ps = connection.prepareStatement("insert into pr_cvg_data "
                    + "(news_date, newspaper, headline, edition, supplement, source, page_no, "
                    + "height, width, total_article_size, circulation_figure, quantitative_ave, "
                    + "image_exists, journalist_factor, language, image, image_filename, image_type) "
                    + "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setDate(1, cd.getNewsDate());
            ps.setString(2, cd.getNewspaper());
            ps.setString(3, cd.getHeadline());
            ps.setString(4, cd.getEdition());
            ps.setString(5, cd.getSupplement());
            ps.setString(6, cd.getSource());
            if (cd.getPageNo() == null) {
                ps.setNull(7, java.sql.Types.INTEGER);
            } else {
                ps.setInt(7, cd.getPageNo());
            }
            if (cd.getHeight() == null) {
                ps.setNull(8, java.sql.Types.INTEGER);
            } else {
                ps.setInt(8, cd.getHeight());
            }
            if (cd.getWidth() == null) {
                ps.setNull(9, java.sql.Types.INTEGER);
            } else {
                ps.setInt(9, cd.getWidth());
            }
            if (cd.getTotalArticleSize() == null) {
                ps.setNull(10, java.sql.Types.INTEGER);
            } else {
                ps.setInt(10, cd.getTotalArticleSize());
            }
            if (cd.getCirculationFigure() == null) {
                ps.setNull(11, java.sql.Types.INTEGER);
            } else {
                ps.setInt(11, cd.getCirculationFigure());
            }
            if (cd.getQuantitativeAve() == null) {
                ps.setNull(12, java.sql.Types.DECIMAL);
            } else {
                ps.setBigDecimal(12, cd.getQuantitativeAve());
            }
            
            if (cd.getImageExists() == null) {
                ps.setString(13, "N");
            } else {
                ps.setString(13, cd.getImageExists());
            }
            
            if (cd.getJournalistFactor() == null) {
                ps.setInt(14, 1);
            } else {
                ps.setInt(14, cd.getJournalistFactor());
            }
            ps.setString(15, cd.getLanguage());
            if (cd.getImageBlob() != null) {
                ps.setBinaryStream(16, cd.getImageBlob().getBinaryStream());
                ps.setString(17, cd.getImageFileName());
                ps.setString(18, cd.getImageType());
            } else {
                ps.setBinaryStream(16, null);
                ps.setString(17, null);
                ps.setString(18, null);
            }
            
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCoverageData(CoverageData cd) {
        String query = "update pr_cvg_data set news_date=?, "
                    + "newspaper=?, headline=?, edition=?, supplement=?, "
                    + "source=?, page_no=?, height=?, width=?, total_article_size=?, "
                    + "circulation_figure=?, quantitative_ave=?, image_exists=?, "
                    + "journalist_factor=?, language=? where id = ?";
        if (cd.getImageBlob() != null) {
            query = query.replace(" where", ", image_type=?, image_filename=?, image=? where");
        }
        try {
            PreparedStatement ps
                    = connection.prepareStatement(query);
            ps.setDate(1, cd.getNewsDate());
            ps.setString(2, cd.getNewspaper());
            ps.setString(3, cd.getHeadline());
            ps.setString(4, cd.getEdition());
            ps.setString(5, cd.getSupplement());
            ps.setString(6, cd.getSource());
            if (cd.getPageNo() == null) {
                ps.setNull(7, java.sql.Types.INTEGER);
            } else {
                ps.setInt(7, cd.getPageNo());
            }
            if (cd.getHeight() == null) {
                ps.setNull(8, java.sql.Types.INTEGER);
            } else {
                ps.setInt(8, cd.getHeight());
            }
            if (cd.getWidth() == null) {
                ps.setNull(9, java.sql.Types.INTEGER);
            } else {
                ps.setInt(9, cd.getWidth());
            }
            if (cd.getTotalArticleSize() == null) {
                ps.setNull(10, java.sql.Types.INTEGER);
            } else {
                ps.setInt(10, cd.getTotalArticleSize());
            }
            if (cd.getCirculationFigure() == null) {
                ps.setNull(11, java.sql.Types.INTEGER);
            } else {
                ps.setInt(11, cd.getCirculationFigure());
            }
            if (cd.getQuantitativeAve() == null) {
                ps.setNull(12, java.sql.Types.DECIMAL);
            } else {
                ps.setBigDecimal(12, cd.getQuantitativeAve());
            }
            
            if (cd.getImageExists() == null) {
                ps.setString(13, "N");
            } else {
                ps.setString(13, cd.getImageExists());
            }            
            if (cd.getJournalistFactor() == null) {
                ps.setInt(14, 1);
            } else {
                ps.setInt(14, cd.getJournalistFactor());
            }
            ps.setString(15, cd.getLanguage());
            if (cd.getImageBlob() != null) {
                ps.setString(16, cd.getImageType());
                ps.setString(17, cd.getImageFileName());
                ps.setBinaryStream(18, cd.getImageBlob().getBinaryStream());
                ps.setInt(19, cd.getId());
            } else {
                ps.setInt(16, cd.getId());
            }
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteCvgData(Integer cvgDataId) {
        try {
            PreparedStatement ps = connection.prepareStatement("delete from pr_cvg_data where id = ?");
            ps.setInt(1, cvgDataId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addEntityMatrix(EntityMatrix em) {
        try {
            PreparedStatement ps = connection.prepareStatement("insert into pr_entity_matrix "
                    + "(commodity, headline, image, article, pr_cvg_data_id) "
                    + "values (?,?,?,?,?)");
            ps.setString(1, em.getCommodity());
            if (em.getHeadline() == null) {
                ps.setNull(2, java.sql.Types.INTEGER);
            } else {
                ps.setInt(2, em.getHeadline());
            }
            if (em.getImage() == null) {
                ps.setNull(3, java.sql.Types.INTEGER);
            } else {
                ps.setInt(3, em.getImage());
            }
            if (em.getArticle() == null) {
                ps.setNull(4, java.sql.Types.INTEGER);
            } else {
                ps.setInt(4, em.getArticle());
            }
            if (em.getCvgDataId() == null) {
                ps.setNull(5, java.sql.Types.INTEGER);
            } else {
                ps.setInt(5, em.getCvgDataId());
            }
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }

    public void updateEntityMatrix(EntityMatrix em) {
        try {
            PreparedStatement ps
                    = connection.prepareStatement("update pr_entity_matrix set headline=?, "
                            + "image=?, article=? where id = ?");
            if (em.getHeadline() == null) {
                ps.setNull(1, java.sql.Types.INTEGER);
            } else {
                ps.setInt(1, em.getHeadline());
            }
            if (em.getImage() == null) {
                ps.setNull(2, java.sql.Types.INTEGER);
            } else {
                ps.setInt(2, em.getImage());
            }
            if (em.getArticle() == null) {
                ps.setNull(3, java.sql.Types.INTEGER);
            } else {
                ps.setInt(3, em.getArticle());
            }            
            ps.setInt(4, em.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
    public void addKeyword(Keyword keyword) {
        try {
            PreparedStatement ps = connection.prepareStatement("insert into pr_keyword "
                                                            + "(keyword, is_deleted) "
                                                            + "values (?,'N')");
            ps.setString(1, keyword.getKeyword());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }    

    public void updateKeyword(Keyword keyword) {
        try {
            PreparedStatement ps = connection.prepareStatement("update pr_keyword "
                                                            + "set keyword = ?, is_deleted = ? "
                                                            + "where id = ?");
            ps.setString(1, keyword.getKeyword());
            ps.setString(2, keyword.getIsDeleted());
            ps.setInt(3, keyword.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }    
    
    public ArrayList<Keyword> getAllKeywords() {
        ArrayList<Keyword> list = new ArrayList<Keyword>();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from pr_keyword where is_deleted = 'N' order by id desc");
            while (rs.next()) {
                list.add(getKeywordObj(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }    
    
    private static Keyword getKeywordObj(ResultSet rs) throws SQLException {
        Keyword kw = new Keyword();
        kw.setId(rs.getInt("id"));
        kw.setKeyword(rs.getString("keyword"));
        kw.setIsDeleted(rs.getString("is_deleted"));
        return kw;
    }    

}
