
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %> 

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="copyright" content="" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Eshop - Product Details</title>
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="table.css">
        <link rel="stylesheet" href="css/font-awesome.css" />
        <link rel="stylesheet" href="css/jquery.fancybox.min.css" />
        <link rel="stylesheet" href="css/themify-icons.css" />
        <link rel="stylesheet" href="style.css" />
    </head>

    <body class="js">
        <c:set var="product" value="${requestScope.PRODUCT_DETAIL}"/>
        <%@include file="header.jsp" %>
        <div class="product-details container p-0">
            <div id="detail">
                <div class="detail-img">
                    <img src="${product.image}" width="200px"/>
                </div>
                <div class="detail-info">
                    <h2 class="product-title">${product.productName}</h2>
                    <p><span>Price: </span> <fmt:formatNumber type="currency" value="${product.price}" /></p>
                    <p><span>Category: </span>${product.categoryName}</p>
                    <p><span>Import Date: </span><fmt:formatDate type="date" dateStyle="short" timeStyle="short"  value="${product.importDate}" /></p>
                    <p><span>Using Date: </span><fmt:formatDate type="date" dateStyle="short" timeStyle="short"  value="${product.usingDate}" /></p>
                    <p><span>Stock Quantity: </span>${product.quantity > 0 ? product.quantity : "Out of stock"}</p>
                    <p><span>Quantity: </span></p>
                    <form action="MainController" class="buy-form" method="POST">
                        <input type="hidden" name="productID" value="${product.productID}"/>
                        <input type="hidden" name="productName" value="${product.productName}"/>
                        <input type="hidden" name="price" value="${product.price}"/>
                        <input type="hidden" name="image" value="${product.image}"/>
                        <div class="counter">
                            <span class="down" onClick='decreaseCount(event, this)'>-</span>
                            <input type="number" value="0" min="0" required="" name="quantity" >
                            <span class="up" onClick='increaseCount(event, this)'>+</span>
                        </div>
                        <button class="ghost" id="addToCart" type="submit" name="btnAction" value="AddToCart">Add To Cart</button>
                    </form>
                    <h2>${requestScope.MESSAGE}</h2>
                    <h2 class="error">${requestScope.ERROR}</h2>
                </div>
            </div>
        </div>
        <script src="scripts/main.js"></script>
    </body>

</html>
