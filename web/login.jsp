<%-- 
    Document   : login
    Created on : Mar 4, 2022, 5:17:50 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login:</h1>
        <form action="MainController" method="POST">
            UserID: <input type="text" name="userID" required="" placeholder="Input userID.."/> </br>
            Password: <input type="password" name="password" placeholder="Input password.."/></br>
            <input type="submit" value="Login" name="btnAction" />
            <input type="reset" value="Reset" />
        </form>        
        Don't have account? 
        <a href="register.jsp">Register</a></br>
        <a href="shoppingPage.jsp">Back to shopping</a></br>

        <!--        <a href="createUser.jsp">Create page</a></br>
                <a href="shopping.jsp">Shopping page</a>-->
    </body>
</html>
