<%-- 
    Document   : image
    Created on : Apr 10, 2015, 5:09:15 PM
    Author     : Rahul
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.playright.model.CoverageData"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.playright.dao.DataDao"%>
<%@page import="com.playright.dao.SettingsDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>PlayRight Analytics</title>
        <link href="css/prchart_print.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
            String customerLogo = "images/" + request.getContextPath().replace("/", "") + ".png";
            String customer = (String) request.getServletContext().getAttribute(SettingsDao.CUSTOMER);
            DataDao dataDao = new DataDao();
            DateFormat df = new SimpleDateFormat("dd MMM yyyy");
            CoverageData cvgData = dataDao.getCoverageDataById(Integer.parseInt(request.getParameter("cvgDataId")), false);
            String heading = df.format(cvgData.getNewsDate()) + ", " + cvgData.getNewspaper() + ", Page No. " + cvgData.getPageNo();
            dataDao.close();
        %>        
        <div id="header_container">
            <div id="header">
                <div style="float: left; width: 15%">
                    <img src="images/logo.png" alt="PlayRight Analytics" title="PlayRight Analytics" border="0" />
                </div>
                <div style="float: left; height: 70px; margin: 0 auto; width: 70%;">
                    <ul style="text-align: center; padding: 15px 0 0 0;">
                        <li style="padding: 0 0 5px 0; font-size: 20px;">PlayRight Media Analysis</li>
                        <li style="padding: 5px 0 5px 0; font-size: 12px;"><%=heading%></li>
                    </ul>
                </div>
                <div style="float: right; width: 15%">
                    <a href="index.jsp" style="text-align: right; float: right;"><img src="<%=customerLogo%>" alt="<%=customer%>" title="<%=customer%>" border="0" /></a>
                </div>                
            </div>
        </div>            
        <div id="body_container">
            <div class="rowdivtitle" style="height: 50px">
                <div id="printdiv" style="padding: 5px 0 0 0; text-align: center;">
                    <h style="font-size: 19px"><%=cvgData.getHeadline()%></h>
                    <p style="padding: 5px 0 0 0"><button id="print" name="print" onclick="window.print();" style="margin-right: 50">Print</button></p>                
                </div>        
            </div>            
            <div style="text-align: center; height: 865px; display: flex; justify-content: center; align-items: center;">
                <img style="max-width: 795px; max-height: 845px; padding: 5px 10px 5px 10px;" 
                     src="DataController/<%=cvgData.getImageFileName()%>?action=displayImage&cvgDataId=<%=request.getParameter("cvgDataId")%>"/>
            </div>        
        </div>
        <div id="footer_container">
            <div id="footer">
                <div style="float: left; width: 420px; padding: 0 0 0 10px">
                    <ul>
                        <li style="font-size: 10px">Copyright © 2015 All rights reserved.</li>
                        <li style="font-size: 8px ">This page or any portion thereof may not be reproduced or used in any manner whatsoever without the express written permission of PlayRight Consulting Private Limited.</li>
                    </ul>
                </div>   
                <div style="float: right; width: 150px">
                    <img src="images/powered-by.png" alt="Revvster Inc." title="Revvster Inc." border="0" />
                </div>
            </div>
        </div>                        
    </body>
</html>