<%-- 
    Document   : viewCart
    Created on : Feb 24, 2022, 11:07:32 AM
    Author     : User
--%>


<%@page import="trungtin.cart.CartDTO"%>
<%@page import="trungtin.cart.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %> 



<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="copyright" content="" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Eshop - My Cart</title>
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
        <%@include file="header.jsp" %>
        <c:set var="listError" value="${requestScope.LIST_ERROR}"/>
        <div class="cart-wrapper container p-0">
            <h3>Your Cart</h3>
            <c:if test="${not empty cart && cart.cart.size()>0}"> 
                <div class="cart cart-items">
                    <div class="cart-headers row mx-0">
                        <div class="col-6">Item</div>
                        <div class="col-2" style="text-align: center;">Quantity</div>
                        <div class="col-4" style="text-align: end;">Sub-total</div>
                    </div>
                    <hr>
                    <c:set var="total" value="0"/>
                    <c:forEach var="dto" items="${cart.cart.values()}" varStatus="counter">
                        <c:set var="total" value="${total + dto.price * dto.quantity}"/>
                        <form action="MainController" class="cart-item row mx-0">
                            <div class="cart-item-img col-2">
                                <img src="${dto.image}" alt="">
                            </div>
                            <div class="cart-item-info col-4">
                                <div class="item-info-name"><input type="hidden" name="productID" value="${dto.productID}">${dto.productName}</div>
                                <div class="item-info-price"><span class="caption">Price: </span><fmt:formatNumber type="currency" value="${dto.price}" /> <span class="currency">vnd</span></div>
                                <div class="item-info-id"><span class="caption">ID: </span>${dto.productID}</div>
                            </div>
                            <div class="cart-item-quantity col-2">
                                <div class="item-quantity">
                                    <div class="input-group">
                                        <button class="quantity-ctrl minus" type="submit" value="Less" name="btnAction" >-</button>
                                        <input class="input-quantity" type="number" name="quantity" id="" value="${dto.quantity}">
                                        <button  class="quantity-ctrl plus" type="submit" value="More" name="btnAction" >+</button>
                                    </div>
                                    <c:forEach var="error" items="${listError}">
                                        <c:if test="${error.productID eq dto.productID}">
                                            <span class="error">${error.productQuantityError}</span> 
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="cart-item-subtotal col-4">
                                <div class="item-subtotal"><fmt:formatNumber type="currency" value="${dto.price * dto.quantity}" /></div>
                                <div class="cart-item-action">
                                    <button type="submit" value="Remove" name="btnAction" class="cart-remove-btn"><i class="fa fa-trash-o"></i>REMOVE</button>
                                </div>
                            </div>
                        </form>

                    </c:forEach>
                    <hr>
                    <div class="order-subtotal-wrapper row">
                        <div class="order-subtotal-header col-9">
                            Order Sub-total:<br>
                            <span class="item-count">${cart.size} item(s)</span>
                        </div>
                        <div class="order-subtotal col-3"><fmt:formatNumber type="currency" value="${total > 0 ?  total : 0}" /></div>
                        <div class="check-out-btn"><a href="confirmOrder.jsp">CONFIRM</a></div>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty cart || cart.cart.size() == 0}">
                <h2>Your cart is empty!!</h2> 
            </c:if>
            <h1 class="error">${requestScope.ERROR}</h1> 
        </div>
        <script src="scripts/main.js"></script>
    </body>

</html>

