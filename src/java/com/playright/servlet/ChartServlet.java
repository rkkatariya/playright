/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.playright.servlet;

import com.google.visualization.datasource.Capabilities;
import com.google.visualization.datasource.DataSourceHelper;
import com.google.visualization.datasource.DataTableGenerator;
import com.google.visualization.datasource.base.DataSourceException;
import com.google.visualization.datasource.datatable.DataTable;
import com.google.visualization.datasource.query.Query;
import com.playright.dao.ChartDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author Rahul
 */
public class ChartServlet extends HttpServlet implements DataTableGenerator {
    
    private static final long serialVersionUID = 1L;

    private static final Log log = LogFactory.getLog(ChartServlet.class.getName());

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
        String chart = request.getParameter("chart");
        if (chart != null) { 
            DataSourceHelper.executeDataSourceServletFlow(request, response, this, true);
        }
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
        doGet(request, response);
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
    
    /**
     * The SQL predefined capabilities set is a special custom set for SQL
     * databases. This implements most of the data source capabilities more
     * efficiently.
     */
    @Override
    public Capabilities getCapabilities() {
        return Capabilities.NONE;
    }

    @Override
    public DataTable generateDataTable(Query query, HttpServletRequest request)
            throws DataSourceException {
        
        ChartDao chartDao = new ChartDao();
        Date today = Calendar.getInstance().getTime();
        SimpleDateFormat sdfIn = new SimpleDateFormat("dd/MM/yyyy");
        //Needed for mySQL
        SimpleDateFormat sdfSql = new SimpleDateFormat("yyyy-MM-dd");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String allData = request.getParameter("allData");
        String fromDateSql = "";
        String toDateSql = "";
        try {
            if (fromDate == null || "".equals(fromDate)) {
                fromDateSql = sdfSql.format(today);
            } else {
                fromDateSql = sdfSql.format(sdfIn.parse(fromDate));
            }
            if (toDate == null || "".equals(toDate)) {
                toDateSql = sdfSql.format(today);
            } else {
                toDateSql = sdfSql.format(sdfIn.parse(toDate));
            }
        } catch (ParseException ex) {
                Logger.getLogger(ChartServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        return chartDao.getDataTable(request.getParameter("chart"), fromDateSql, toDateSql, allData);
    }
    
    private void forwardToPage(final HttpServletRequest request, 
                               final HttpServletResponse response,
                               String url) 
    throws IOException, ServletException {
      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
      dispatcher.forward(request,response);
    }    

}
