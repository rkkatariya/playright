<%-- 
    Document   : ajaxSample
    Created on : Mar 12, 2015, 12:27:18 PM
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>AJAX in java web application using jQuery</title>
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
<!--<script type="text/javascript" src="js/ajax.js"></script>-->
<script>
    $(document).ready(function() {
        $('#userName').blur(function(event) {
                var name = $('#userName').val();
                $.get('JqueryServlet', {
                        userName : name
                }, function(responseText) {
                        $('#ajaxResponse').text(responseText);
                });
        });
});
</script>
</head>
<body>
<form>
  <fieldset>
    <legend>AJAX implementation in JSP and Servlet using JQuery</legend>
    <br /> Enter your Name: <input type="text" id="userName" />
 </fieldset>

 <fieldset>
   <legend>Response from jQuery Ajax Request on Blur event</legend>
   <div id="ajaxResponse"></div>
 </fieldset>
</form>
</body>
</html>
