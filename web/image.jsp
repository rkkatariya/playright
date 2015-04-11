<%-- 
    Document   : image
    Created on : Apr 10, 2015, 5:09:15 PM
    Author     : Rahul
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.playright.dao.SettingsDao"%>
<%@page import="com.playright.dao.DataDao"%>
<%@page import="com.playright.model.CoverageData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>PlayRight Analytics</title>
        <link href="css/prchart.css" rel="stylesheet" type="text/css" />
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
        <script type="text/javascript">
            function printableVersion() {
                document.getElementById('printbtn').href = 'image_print.jsp?cvgDataId=' + <%=request.getParameter("cvgDataId")%>;
            }
            ;
        </script>
        <div id="header_container">
            <div id="header">
                <div style="float: left; width: 15%">
                    <a href="index.jsp" style="text-align: left; float: left;"><img src="images/logo.png" alt="PlayRight Analytics" title="PlayRight Analytics" border="0" /></a>
                </div>
                <div style="float: left; height: 86px; margin: 0 auto; width: 70%;">
                    <ul style="text-align: center; padding: 25px 0 0 0;">
                        <li style="padding: 0 0 5px 0; font-size: 20px;">PlayRight Media Analysis</li>
                        <li id="imgHeadingStr" style="padding: 5px 0 5px 0; font-size: 12px;"><%=heading%></li>
                    </ul>
                </div>
                <div style="float: right; width: 15%">
                    <a href="index.jsp" style="text-align: right; float: right;"><img src="<%=customerLogo%>" alt="<%=customer%>" title="<%=customer%>" border="0" /></a>
                </div>                
            </div>
        </div>            
        <div id="body_container">
            <div class="printbutton">
                <div class="innerdivf" >
                    <h style="font-size: 19px"><%=cvgData.getHeadline()%></h>
                </div>        
            </div>            
            <div class="innerdivf" style="padding: 8px 0 0 0">
                <img style="max-width: 95%;" 
                     src="DataController/<%=cvgData.getImageFileName()%>?action=displayImage&cvgDataId=<%=request.getParameter("cvgDataId")%>"/>
            </div>        
            <div class="rowdivtitle" style="height: 40px">
                <div class="innerdivf" style="padding: 10px 0 0 0">
                    <ul>
                        <li style="padding: 0 0 0;"><a id="printbtn" href="javascript:void(0)" onclick="printableVersion()">Click here to view Printable Version</a></li>
                    </ul>
                </div>        
            </div>            
        </div>
        <div id="footer_container">
            <div id="footer">
                <div style="float: left; width: 85%; padding: 0 0 0 10px">
                    <ul>
                        <li style="font-size: 10px">Copyright © 2015 All rights reserved.</li>
                        <li style="font-size: 8px ">This page or any portion thereof may not be reproduced or used in any manner whatsoever without the express written permission of PlayRight Consulting Private Limited.</li>
                    </ul>
                </div>   
                <div style="float: right; width: 10%">
                    <img src="images/powered-by.png" alt="Revvster Inc." title="Revvster Inc." border="0" />
                </div>
            </div>
        </div>                        
    </body>
</html>