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
        <title>User Page</title>
    </head>
    <body>

        <c:if test="${sessionScope.LOGIN_USER.getRoleID().equals('AD')}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <c:if test="${not empty sessionScope.LOGIN_USER}">
            <p>Welcome ${sessionScope.LOGIN_USER.getFullName()}</p>
            <form action="MainController">
                <input type="submit" name="btnAction" value="Logout"/>
            </form>
            <a href="user.jsp">Information</a>
        </c:if>
        <c:if test="${empty sessionScope.LOGIN_USER}">
            <a href="login.jsp">LOGIN</a>
        </c:if>   

        <form action="MainController">
            <input type="text" value="${requestScope.SEARCH_VALUE}" placeholder="Search product.." name="searchValue"/>
            <input type="submit" value="FindProduct" name="btnAction"/>
        </form>
        <c:set var="productList" value="${sessionScope.LIST_PRODUCT_USER}"/>
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
                            <td><a href="MainController?btnAction=SeeDetail&productID=${product.productID}">See details</a></td>
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
