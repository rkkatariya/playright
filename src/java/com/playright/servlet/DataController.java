/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.playright.dao.DataDao;
import com.playright.model.CoverageData;
import com.playright.model.EntityMatrix;
import com.playright.model.Keyword;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Rahul
 */
@MultipartConfig(fileSizeThreshold=1024*1024*1, // 2MB
                 maxFileSize=1024*1024*1,      // 10MB
                 maxRequestSize=1024*1024*2)
public class DataController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controller at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
//        response.setContentType("application/json");
//        try {
//            String term = request.getParameter("term");
//            System.out.println("Data from ajax call " + term);
//
//            DataDao dataDao = new DataDao();
//            ArrayList<String> list = dataDao.getLanguagesStartWith(term);
//
//            String searchList = new Gson().toJson(list);
//            response.getWriter().write(searchList);
//        } catch (Exception e) {
//            System.err.println(e.getMessage());
//        }
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String action = request.getParameter("action");
        if (action != null) {
            DataDao dataDao = new DataDao();
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            response.setContentType("application/json");
            String successResponse = "{\"success\":\"true\"}";
            try {
                if (action.equals("listCvgData")) {
                    List<CoverageData> data = new ArrayList<CoverageData>();
                    int stPgIdx = Integer.parseInt(request.getParameter("page"));
                    int recPerPg = Integer.parseInt(request.getParameter("rows"));
                    data = dataDao.getPaginatedCoverageData(stPgIdx, recPerPg);
                    int dataCount = dataDao.getTableSize("PR_CVG_DATA");

                    // Convert Java Object to Json
                    String jsonArray = gson.toJson(data);
                    jsonArray = "{\"total\":" + dataCount + ",\"rows\":" + jsonArray + "}";
                    response.getWriter().print(jsonArray);
                } else if (action.equals("listEntityMatrix")) {
                    List<EntityMatrix> data = new ArrayList<EntityMatrix>();
                    Integer cvgDataId = Integer.parseInt(request.getParameter("cvgDataId"));
                    data = dataDao.getEntityMatrixByCvgDataId(cvgDataId);
                    String jsonArray = gson.toJson(data);
                    response.getWriter().print(jsonArray);
                } else if (action.equals("saveCvgData")) {
                    CoverageData cd = getCoverageDateFromRequest(request);
                    if (cd.getId() == null || cd.getId() == 0) {
                        dataDao.addCoverageData(cd);
                    } else {
                        dataDao.updateCoverageData(cd);
                    }
                    response.getWriter().print(successResponse);
                } else if (action.equals("updateCvgData")) {
                    CoverageData cd = getCoverageDateFromRequest(request);
                    dataDao.updateCoverageData(cd);
                    response.getWriter().print(successResponse);
                } else if (action.equals("deleteCvgData")) {
                    Integer cvgDataId = Integer.parseInt(request.getParameter("cvgDataId"));
                    response.setContentType("application/json");
                    dataDao.deleteCvgData(cvgDataId);
                    response.getWriter().print(successResponse);
                } else if (action.equals("getLanguages")) {
                    String jsonArray = gson.toJson(dataDao.getLanguages());
                    response.getWriter().print(jsonArray);
                } else if (action.equals("displayImage")) {
                    Integer cvgDataId = Integer.parseInt(request.getParameter("cvgDataId"));
                    Blob img = dataDao.getCoverageDataById(cvgDataId).getImageBlob();
                    byte[] imgData;
                    try {
                        imgData = img.getBytes(1,(int)img.length());
                        response.setHeader("expires", "0"); 
                        response.setContentType("image/jpg");
                        response.getOutputStream().write(imgData);
                        response.setContentLength(imgData.length);
                    } catch (SQLException ex) {
                        Logger.getLogger(DataController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else if (action.equals("saveEntityMatrix")) {
                    BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
                    EntityMatrix em = gson.fromJson(br, EntityMatrix.class);
                    if (em.getId() == 0) {
                        dataDao.addEntityMatrix(em);
                    } else {
                        dataDao.updateEntityMatrix(em);
                    }
                    response.getWriter().print(successResponse);
                } else if (action.equals("addKeyword")) {
                    Keyword kw = getKeywordFromRequest(request);
                    dataDao.addKeyword(kw);
                    response.getWriter().print(successResponse);
                } else if (action.equals("updateKeyword")) {
                    Keyword kw = getKeywordFromRequest(request);
                    dataDao.updateKeyword(kw);
                    response.getWriter().print(successResponse);
                } else if (action.equals("listKeywords")) {
                    List<Keyword> data = new ArrayList<Keyword>();
                    data = dataDao.getAllKeywords();
                    String jsonArray = gson.toJson(data);
                    jsonArray = "{\"rows\":" + jsonArray + "}";
                    response.getWriter().print(jsonArray);
                } 
                dataDao.close();
            } catch (Exception ex) {
                String error = "{\"result\":\"error\",\"errorMsg\":\"" + ex.getMessage() + "\"}";
                response.getWriter().print(error);
            }
        }
    }

    private CoverageData getCoverageDateFromRequest(HttpServletRequest request) throws ServletException {
        CoverageData cd = new CoverageData();
        try {
            if (!"".equalsIgnoreCase(request.getParameter("id")) && 
                    request.getParameter("id") != null) {
                cd.setId(Integer.parseInt(request.getParameter("id")));
            }
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date ud = sdf.parse(request.getParameter("newsDate"));
            cd.setNewsDate(new java.sql.Date(ud.getTime()));
            cd.setNewspaper(request.getParameter("newspaper"));
            cd.setHeadline(request.getParameter("headline"));
            cd.setLanguage(request.getParameter("language"));
            cd.setEdition(request.getParameter("edition"));
            cd.setSupplement(request.getParameter("supplement"));
            cd.setSource(request.getParameter("source"));
            if (!"".equalsIgnoreCase(request.getParameter("pageNo")) && 
                    request.getParameter("pageNo") != null) {
                cd.setPageNo(Integer.parseInt(request.getParameter("pageNo")));
            }
            if (!"".equalsIgnoreCase(request.getParameter("height")) && 
                    request.getParameter("height") != null) {
                cd.setHeight(Integer.parseInt(request.getParameter("height")));
            }
            if (!"".equalsIgnoreCase(request.getParameter("width")) && 
                    request.getParameter("width") != null) {
                cd.setWidth(Integer.parseInt(request.getParameter("width")));
            }
            if (!"".equalsIgnoreCase(request.getParameter("totalArticleSize")) && 
                    request.getParameter("totalArticleSize") != null) {
                cd.setTotalArticleSize(Integer.parseInt(request.getParameter("totalArticleSize")));
            }
            if (!"".equalsIgnoreCase(request.getParameter("circulationFigure")) && 
                    request.getParameter("circulationFigure") != null) {
                cd.setCirculationFigure(Integer.parseInt(request.getParameter("circulationFigure")));
            }
            if (!"".equalsIgnoreCase(request.getParameter("journalistFactor")) && 
                    request.getParameter("journalistFactor") != null) {
                cd.setJournalistFactor(Integer.parseInt(request.getParameter("journalistFactor")));
            }
            if (!"".equalsIgnoreCase(request.getParameter("quantitativeAve")) && 
                    request.getParameter("quantitativeAve") != null) {
                cd.setQuantitativeAve(new BigDecimal(request.getParameter("quantitativeAve")));
            }
            Blob b = null;
            try {
                Part filePart = request.getPart("image");
                InputStream fileContent = filePart.getInputStream();
                byte[] bytes = IOUtils.toByteArray(fileContent);
                b = new SerialBlob(bytes);
            } catch (IOException ex) {
                Logger.getLogger(DataController.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (b != null && b.length() != 0) {
                cd.setImageExists("Y");
                cd.setImageBlob(b);
            } else {
                cd.setImageExists("N");
            }
        } catch (ParseException ex) {
            Logger.getLogger(DataController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DataController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cd;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "You have reached the Data Controller";
    }

    private Keyword getKeywordFromRequest(HttpServletRequest request) {
        Keyword kw = new Keyword();
        if (!"".equalsIgnoreCase(request.getParameter("id")) && 
                request.getParameter("id") != null) {
            kw.setId(Integer.parseInt(request.getParameter("id")));
        }
        kw.setKeyword(request.getParameter("keyword"));
        kw.setIsDeleted(request.getParameter("isDeleted"));
        return kw;
    }

}
