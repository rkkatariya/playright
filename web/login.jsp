<%-- 
    Document   : login
    Created on : Mar 12, 2015, 4:03:49 PM
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery-1.11.1.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#tabs").tabs();
            });
        </script>
    </head>
    <body>
        <div class="wrapper">   
            <div class="container">
                <div id="tabs">
                    <ul>
                        <li><a href="#login">Login</a></li>
                        <!--<li><a href="#register">Sign up</a></li>-->
                    </ul>
                    <div id="login">
                        <%
                            if ("INVALID_LOGIN".equals((String) session.getAttribute("error"))) { %>
                        <h6> Invalid User Id or Password. Please try again.</h6>
                        <%
                                session.removeAttribute("error");
                            }%>
                        <form method="post" action="LoginController">
                            <label for="userid">User Id:</label>
                            <br/>
                            <input type="text" name="userid" id="userid"/>
                            <br/>
                            <label for="password">Password:</label>
                            <br/>
                            <input type="password" name="password" id="password"  />
                            <br/>
                            <br/>
                            <input type="submit" value="Login">
                        </form>
                    </div>
<!--                    <div id="register">
                        <form method="post" action="SignupController">
                            <label for="fname">First Name:</label>
                            <br/>
                            <input type="text" name="fname" id="fname" />
                            <br/>
                            <label for="lname">Last Name:</label>
                            <br/>
                            <input type="text" name="lname" id="lname" />
                            <br/>
                            <label for="userid">User Id:</label>
                            <br/>
                            <input type="text" name="userid" id="userid" />
                            <br/>
                            <label for="email">Email:</label>
                            <br/>
                            <input type="text" name="email" id="email" />
                            <br/>
                            <label for="password">Password:</label>
                            <br/>
                            <input type="password" name="password" id="password" />
                            <br/>
                            <br/>
                            <input type="submit" value="Register">
                        </form>
                    </div>-->
                </div>
            </div>
        </div>
    </body>
</html>
