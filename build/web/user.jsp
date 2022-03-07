<%-- 
    Document   : admin.jsp
    Created on : Mar 4, 2022, 5:29:46 PM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="trungtin.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>

        <c:set var="loginUser" value="sessionScope.LOGIN_USER"/>
        <c:if test="${empty loginUser || !sessionScope.LOGIN_USER.getRoleID().equals('US')}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <p>Welcome ${sessionScope.LOGIN_USER.getFullName()}</p>
        <form action="MainController">
            <input type="submit" name="btnAction" value="Logout"/>
        </form>
        <h2>Your information</h2></br>
        User ID: ${sessionScope.LOGIN_USER.getUserID()} </br>
        Full Name: ${sessionScope.LOGIN_USER.getFullName()}</br>
        Role ID: ${sessionScope.LOGIN_USER.getRoleID()}</br>
        Address: ${sessionScope.LOGIN_USER.getAddress()}</br>
        Birthday: ${sessionScope.LOGIN_USER.getBirthday()}</br>
        Phone Number: ${sessionScope.LOGIN_USER.getPhone()}</br>
        Email: ${sessionScope.LOGIN_USER.getEmail()}</br>
        <a href="shoppingPage.jsp">Back to shopping</a>

    </body>
</html>
