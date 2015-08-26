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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rahul
 */
public class JsonServlet extends HttpServlet {
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
            out.println("<title>Servlet JsonServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JsonServlet at " + request.getContextPath() + "</h1>");
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
        String sportsName = request.getParameter("sportsName");
                List<String> list = new ArrayList<String>();
                String json = null;

                if (sportsName.equals("Football")) {
                        list.add("Lionel Messi");
                        list.add("Cristiano Ronaldo");
                        list.add("David Beckham");
                        list.add("Diego Maradona");
                } else if (sportsName.equals("Cricket")) {
                        list.add("Sourav Ganguly");
                        list.add("Sachin Tendulkar");
                        list.add("Lance Klusener");
                        list.add("Michael Bevan");
                } else if (sportsName.equals("Select Sports")) {
                        list.add("Select Player");
                }

                json = new Gson().toJson(list);
                response.setContentType("application/json");
                response.getWriter().write(json);
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

            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            response.setContentType("application/json");

            if (action.equals("getCityDistribution")) {
                List<CoverageData> data = new ArrayList<CoverageData>();
                try {
                    DataDao dataDao = new DataDao();
                    data = dataDao.getAllCoverageData();
                    int dataCount = dataDao.getTableSize("pr_cvg_data");

                    // Convert Java Object to Json
                    String jsonArray = gson.toJson(data);

                    //Return Json in the format required by jTable plugin
                    jsonArray = "{\"Result\":\"OK\",\"Records\":" + jsonArray + ",\"TotalRecordCount\":" + dataCount + "}";
//                    System.out.println(jsonArray);
                    response.getWriter().print(jsonArray);
                } catch (Exception ex) {
                    String error = "{\"Result\":\"ERROR\",\"Message\":" + ex.getMessage() + "}";
                    response.getWriter().print(error);
                }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
