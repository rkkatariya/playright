<%-- 
    Document   : header.html
    Created on : Mar 13, 2015, 11:06:02 PM
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>PlayRight Analytics</title>
        <link rel="stylesheet" type="text/css" href="../css/prstyle.css" />
        <link rel="stylesheet" type="text/css" href="../js/easyui/themes/gray/easyui.css">
        <link rel="stylesheet" type="text/css" href="../js/easyui/themes/icon.css">
        <script type="text/javascript" src="../js/easyui/jquery.min.js"></script>
        <script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
    </head>
    <body>
        <div id="header_container">
            <div id="header">
                <a href="../index.jsp" style="text-align: left; float: left;"><img id="imgl" src="../images/logo.png" alt="PlayRight Analytics" title="PlayRight Analytics" border="0" /></a>
                <a href="../index.jsp" style="text-align: right; float: right;"><img id="imgr" src="../images/rcb.png" alt="Royal Challengers Bangalore" title="Royal Challengers Bangalore" border="0" /></a>
            </div>
            <div id="line"></div>
            <div id="navigator">
                <table width="60%" align="center">
                    <tbody>
                        <tr>
                            <td><h2><a href="data.jsp">Data</a></h2></td>
                            <td><h2><a href="keywords.jsp">Keywords</a></h2></td>
                            <td><h2><a href="chartfilter.jsp">Charts</a></h2></td>
                            <td><h2><a href="login?action=logout">Logout</a></h2></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
