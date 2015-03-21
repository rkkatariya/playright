<%-- 
    Document   : index.jsp
    Created on : Mar 13, 2015, 11:08:08 PM
    Author     : Rahul
--%>
<jsp:include page="header.jsp"/>
<link href="css/prlogin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    document.getElementById('navigator').style.visibility = 'hidden';
    document.getElementById('navigator').style.height = '0px';
</script>    
<div id="body_container">
        <div id="login">
            <form action="LoginController" method="post" >
                <label>login/password:</label>
                <input name="userid" type="text" id="userid" value="" />
                <input name="password" type="password" id="password" value="" />
                <input name="login" type="submit" class="botton" value="GO" />
            </form>
        </div>
        <div id="loginerror">
            <%if ("INVALID_LOGIN".equals((String) session.getAttribute("error"))) { %>
            <h2> Invalid Login or Password. Please try again.</h2>
            <%session.removeAttribute("error");
              }%>
        </div>
</div>              
<jsp:include page="footer.jsp"/>