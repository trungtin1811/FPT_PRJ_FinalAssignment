<%-- 
    Document   : admin.jsp
    Created on : Mar 4, 2022, 5:29:46 PM
    Author     : User
--%>

<%@page import="trungtin.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
        <c:if test="${empty loginUser || !sessionScope.LOGIN_USER.getRoleID().equals('AD')}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <p>Welcome ${loginUser.fullName}</p>
        <form action="MainController">
            <input type="submit" name="btnAction" value="Logout"/>
        </form>
        <h2>Your information</h2></br>
<!--        User ID: ${sessionScope.LOGIN_USER.getUserID()} </br>
        Full Name: ${sessionScope.LOGIN_USER.getFullName()}</br>
        Role ID: ${sessionScope.LOGIN_USER.getRoleID()}</br>
        Address: ${sessionScope.LOGIN_USER.getAddress()}</br>
        Birthday: ${sessionScope.LOGIN_USER.getBirthday()}</br>
        Phone Number: ${sessionScope.LOGIN_USER.getPhone()}</br>
        Email: ${sessionScope.LOGIN_USER.getEmail()}</br>-->
        <button><a href="addProduct.jsp">Add product</a></button>
        <form action="MainController">
            <input type="text" value="${requestScope.SEARCH_VALUE}" placeholder="Search product.." name="searchValue"/>
            <input type="hidden" value="managementPage" name="role"/>
            <input type="submit" value="SearchProduct" name="btnAction"/>
        </form>
        <c:set var="productList" value="${sessionScope.LIST_PRODUCT}"/>
        <c:if test="${not empty productList}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Category</th>
                        <th>Import Date</th>
                        <th>Using Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${productList}" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td><img src="${product.image}" width="160px"/></td>
                            <td>${product.productName}</td>
                            <td>${product.price}</td>
                            <td>${product.quantity}</td>
                            <td>${product.categoryName}</td>
                            <td>${product.importDate}</td>
                            <td>${product.usingDate}</td>
                            <td><a href="MainController?btnAction=DeleteProduct&productID=${product.productID}&searchValue=${requestScope.SEARCH_VALUE}">Delete</a></td>
                        </tr>
                    </c:forEach>


                </tbody>
            </table>

        </c:if>
        <c:if test="${empty productList}">
            <h2>No result</h2>
        </c:if>
    </body>
</html>
