<%-- 
    Document   : addProduc
    Created on : Mar 4, 2022, 11:05:55 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add product</title>
    </head>
    <body>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="categoryList" value="${sessionScope.LIST_CATEGORY}"/>

        <c:if test="${empty loginUser || !sessionScope.LOGIN_USER.getRoleID().equals('AD')}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <h1>Add product</h1>
        <form action="AddProductController" method="POST" enctype="multipart/form-data">
            Product ID: <input type="text" required="" name="productID"/></br>
            Product Name: <input type="text" required="" name="productName"/></br>
            Image:<input type="file" name="image" ></br>
            Price: <input type="number" required="" name="price" min="0"/></br>
            Quantity: <input type="number" required="" name="quantity" min="0"/></br>
            Category: 
            <select name="categoryID">
                <c:forEach var="category" items="${categoryList}">
                    <option value="${category.key}">${category.value}</option>
                </c:forEach>
            </select>
            </br>
            Import Date:<input type="date" required="" name="importDate"/></br>
            Using Date:<input type="date" required="" name="usingDate"/></br>
            <input type="submit" value="AddProduct" name="btnAction" />
        </form>
        <!--        <form action="UploadFileController" method="POST" >
                    Select image to upload:
                    <input type="submit" value="Upload Image" name="submit">
                </form>-->
        <a href="MainController?searchValue=&btnAction=SearchProduct&role=managementPage">Back</a>
    </body>
</html>
