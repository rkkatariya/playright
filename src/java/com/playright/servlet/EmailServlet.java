/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.servlet;

import com.playright.dao.EmailDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kadles
 */
public class EmailServlet extends HttpServlet {

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
            out.println("<title>Servlet EmailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmailServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        //processRequest(request, response);
        EmailDao emailDao = new EmailDao();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String recipientMailAddress = request.getParameter("emailAddress");
        String action = request.getParameter("action");
        String emailSubject = request.getParameter("emailSubject");
        String emailContent = request.getParameter("emailContent");
        String chartsLink = formURL(request).concat("/charts.jsp?fromDate=").concat(fromDate).concat("&toDate=").concat(toDate).concat("&allData=N");
        String imageLink = formURL(request).concat("/DataController/<FILENAME>?action=displayImage&cvgDataId=");

        if ("HTML".equalsIgnoreCase(action)) {
            try {
                // inline images
                Map<String, String> inlineImages = new HashMap<String, String>();
                String img_0_0_2 = getClass().getResource("rcb.png").getFile();
                inlineImages.put("img_0_0_2",
                        img_0_0_2);
                String img_0_0_1 = getClass().getResource("playright.png").getFile();
                inlineImages.put("img_0_0_1",
                        img_0_0_1);
                String img_0_0_3 = getClass().getResource("revvster.png").getFile();
                inlineImages.put("img_0_0_3",
                        img_0_0_3);
                emailDao.sendHTMLMail(fromDate, toDate, recipientMailAddress, emailSubject, imageLink, inlineImages);
            } catch (Exception ex) {
                 Logger.getLogger(DataController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                emailDao.close();
            }
        } else if ("CHARTS".equalsIgnoreCase(action)) {
            try {
                emailDao.sendChartsEmail(fromDate, toDate, recipientMailAddress, emailSubject, emailContent, chartsLink);
            } catch (Exception ex) {
                 Logger.getLogger(DataController.class.getName()).log(Level.SEVERE, null, ex);
            }
            finally{
                emailDao.close();
            }
        }
    }
    
    private String formURL(HttpServletRequest request){
        return request.getScheme().concat("://").concat(request.getServerName()).concat(":").concat(Integer.toString(request.getServerPort())).concat(request.getContextPath());
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
