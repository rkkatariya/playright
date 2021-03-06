<%-- 
    Document   : header.html
    Created on : Mar 13, 2015, 11:06:02 PM
    Author     : Rahul
--%>

<%@page import="com.playright.dao.SettingsDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>PlayRight Analytics</title>
        <link href="css/prstyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
<%
    String customerLogo = "images/" + request.getContextPath().replace("/", "") + ".png";
    String customer = (String) request.getServletContext().getAttribute(SettingsDao.CUSTOMER);
%>        
        <div id="header_container">
            <div id="header">
                <a href="index.jsp" style="text-align: left; float: left;"><img id="imgl" src="images/logo.png" alt="PlayRight Analytics" title="PlayRight Analytics" border="0" /></a>
                <!--<a href="index.jsp" style="text-align: right; float: right;"><img id="imgr" src="<%=customerLogo%>" alt="<%=customer%>" title="<%=customer%>" border="0" /></a>-->
            </div>
            <div id="line"></div>
            <div id="navigator">
                <table width="60%" align="center">
                    <tbody>
                        <tr>
                            <td><h2><a href="secured/data.jsp">Data</a></h2></td>
                            <td><h2><a href="keywords.jsp">Keywords</a></h2></td>
                            <td><h2><a href="chartfilter.jsp">Charts</a></h2></td>
                            <td><h2><a href="../login?action=logout">Logout</a></h2></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
