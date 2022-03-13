<%-- 
    Document   : viewCart
    Created on : Feb 24, 2022, 11:07:32 AM
    Author     : User
--%>


<%@page import="trungtin.cart.CartDTO"%>
<%@page import="trungtin.cart.Cart"%>
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
        <title>Eshop - Order</title>
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="table.css">
        <link rel="stylesheet" href="css/font-awesome.css" />
        <link rel="stylesheet" href="css/jquery.fancybox.min.css" />
        <link rel="stylesheet" href="css/themify-icons.css" />
        <link rel="stylesheet" href="style.css" />
    </head>

    <body class="js checkout">
        <%@include file="header.jsp" %>
        <div class="cart-wrapper container p-0">
            <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
            <c:set var="cart" value="${sessionScope.CART}"/>
            <h3>Confirm Your Orders</h3>
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
                        <c:set var="total" value="${total+dto.price * dto.quantity}"/>
                        <form action="MainController" class="cart-item row mx-0">
                            <div class="cart-item-img col-2">
                                <img src="${dto.image}" alt="">
                            </div>
                            <div class="cart-item-info col-4">
                                <div class="item-info-name">${dto.productName}</div>
                                <div class="item-info-price"><span class="caption">Price: <fmt:formatNumber type="currency" value="${dto.price}" /></div>
                                <div class="item-info-id"><span class="caption">ID: </span>${dto.productID}</div>
                            </div>
                            <div class="cart-item-quantity col-2">
                                <div class="item-quantity">
                                    <div class="input-group">${dto.quantity}</div>
                                </div>
                            </div>
                            <div class="cart-item-subtotal col-4">
                                <div class="item-subtotal"><fmt:formatNumber type="currency" value="${dto.price * dto.quantity}" /></div>
                            </div>
                        </form>
                    </c:forEach>
                </div>
                <div class="row">
                    <div class="profile-info col-6 pr-0" style="min-width: 300px; margin-left: 16px" >
                        <h4>Confirm information</h4>
                        <table class="user-info">
                            <tbody>
                                <tr>
                                    <td class="info-type">User ID</td>
                                    <td class="info-input">${loginUser.userID}</td>
                                </tr>
                                <tr>
                                    <td class="info-type">User Name</td>
                                    <td class="info-input">${loginUser.fullName}</td>
                                </tr>
                                <tr>
                                    <td class="info-type">Address</td>
                                    <td class="info-input">${loginUser.address}</td>
                                </tr>
                                <tr>
                                    <td class="info-type">Birthday</td>
                                    <td class="info-input">${loginUser.birthday}</td>
                                </tr>
                                <tr>
                                    <td class="info-type">Phone Number</td>
                                    <td class="info-input">${loginUser.phone}</td>
                                </tr>
                                <tr>
                                    <td class="info-type">Email:</td>
                                    <td class="info-input">${loginUser.email}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="order-subtotal-wrapper row col-6">
                        <div class="order-subtotal-header col-9">
                            Order Sub-total:<br>
                            <span class="item-count">${cart.size} item(s)</span>
                        </div>
                        <div class="order-subtotal col-3"> <fmt:formatNumber type="currency" value="${total > 0 ?  total :0}" /></div>
                        <div class="check-out-btn"><a href="MainController?btnAction=CheckOut">CHECK OUT</a></div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${empty cart || cart.cart.size() == 0}">    
            <h1 class="error">Your cart is empty! Please buy first!</h1>
        </c:if>
    </div>
    <script src="scripts/main.js"></script>
</body>

</html>