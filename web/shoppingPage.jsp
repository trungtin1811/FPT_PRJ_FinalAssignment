<%@page import="trungtin.user.UserDTO"%>
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
        <title>Eshop</title>
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
        <c:set var="productList" value="${sessionScope.LIST_PRODUCT_USER}"/>
        <%@include file="header.jsp" %>
        <c:if test="${loginUser.roleID eq 'AD'}">
            <c:redirect url="Login.jsp"/>
        </c:if>
        <div class="container p-0">
            <section class="product-list">
                <c:if test="${not empty productList}">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Image</th>
                                <th scope="col">Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Category</th>
                                <th scope="col">Import Date</th>
                                <th scope="col">Using Date</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${productList}" varStatus="counter">
                                <tr>
                                    <th class="product-img">${counter.count}</th>
                                    <td class="product-img"><img src="${product.image}" alt=""></td>
                                    <td>${product.productName}</td>
                                    <td><fmt:formatNumber type="currency" value="${product.price}" /></td>
                                    <td>${product.quantity > 0 ? product.quantity : "Out of stock"}</td>
                                    <td>${product.categoryName}</td>                            
                                    <td><fmt:formatDate type="date" dateStyle="short" timeStyle="short"  value="${product.importDate}" /></td>
                                    <td><fmt:formatDate type="date" dateStyle="short" timeStyle="short"  value="${product.usingDate}" /></td>
                                    <td><a href="MainController?btnAction=SeeDetail&productID=${product.productID}">See details</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty productList}">
                    <h2>No result</h2>
                </c:if>
            </section>
        </div>
    </body>

</html>