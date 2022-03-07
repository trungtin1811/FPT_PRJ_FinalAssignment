<%-- 
    Document   : detail
    Created on : Mar 7, 2022, 11:38:55 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
    </head>
    <body>
        <h1>Detail</h1>
        <c:set var="product" value="${requestScope.PRODUCT_DETAIL}"/>
        <img src="${product.image}" width="200px"/>
        <h1>Name: ${product.productName}</h1>
        <p>Price: $${product.price}</p>
        <p>Stock Quantity: ${product.quantity}</p>
        <p>Category: ${product.categoryName}</p>
        <p>Import Date: ${product.importDate}</p>
        <p>Using Date: ${product.usingDate}</p>
        <form action="MainController">
            <input type="hidden" name="productID" value="${product.productID}"/>
            Quantity: <input type="number" min="0" max="10" required=""/>
            <input type="submit" name="btnAction" value="Buy"/>
        </form>
            <a href="shoppingPage.jsp">Back</a>

    </body>
</html>
