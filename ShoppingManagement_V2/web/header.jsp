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
        <c:set var="cart" value="${sessionScope.CART}"/>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="searchValue" value="${sessionScope.SEARCH_VALUE}"/>
        <c:if test="${empty loginUser || loginUser.roleID eq 'US'}">
            <c:set var="homeUrl" value="MainController?btnAction=FindProduct"/>
            <c:set var="action" value="FindProduct"/>
            <c:set var="updateUser" value="updateUser.jsp"/>
        </c:if>
        <c:if test="${loginUser.roleID eq 'AD'}">
            <c:set var="updateUser" value="#"/>
            <c:set var="homeUrl" value="MainController?btnAction=SearchProduct"/>
            <c:set var="action" value="SearchProduct"/>
        </c:if>
        <c:set var="cartSize" value="0"/>
        <c:if test="${not empty cart}">
            <c:set var="cartSize" value="${cart.size}"/>
        </c:if>
        <c:if test="${not empty loginUser}">
            <header class="header shop">
                <div class="middle-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="logo">
                                    <a href="${homeUrl}"><img src="images/logo.png" alt="logo" /></a>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="search-bar-top">
                                    <div class="search-bar">
                                        <form action="MainController">
                                            <input name="searchValue" placeholder="Search Products Here....." type="search" value="${searchValue}" />
                                            <button class="btnn" value="${action}"" type="submit" name="btnAction" ><i class="ti-search"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="right-bar">
                                    <div class="sinlge-bar shopping">
                                        Welcome <a href="${updateUser}" class="session-user">${loginUser.fullName}</span>,</a>
                                    </div>
                                    <c:if test="${loginUser.roleID eq 'US'}">
                                        <div class="sinlge-bar shopping">
                                            <a href="viewCart.jsp" class="single-icon"><i class="ti-bag"></i>
                                                <span class="total-count">${cartSize}</span></a>
                                        </div>
                                    </c:if>
                                    <div class="sinlge-bar log-btn">
                                        <a href="MainController?btnAction=Logout" class="single-icon">
                                            <i class="fa fa-user-o" aria-hidden="true"></i> LOG OUT
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </c:if>
    <c:if test="${empty loginUser}">
        <header class="header shop">
            <div class="middle-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="${homeUrl}"><img src="images/logo.png" alt="logo" /></a>
                            </div>
                            <div class="mobile-nav"></div>
                        </div>

                        <div class="col-lg-8">
                            <div class="search-bar-top">
                                <div class="search-bar">
                                    <form action="MainController">
                                        <input name="searchValue" placeholder="Search Products Here....." type="search" value="${searchValue}"/>
                                        <button class="btnn" value="${action}" type="submit" name="btnAction" ><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="right-bar">
                                <!-- Search Form -->
                                <div class="sinlge-bar">
                                    <a href="login.jsp" class="single-icon"><i class="fa fa-user-o" aria-hidden="true"></i>
                                        LOGIN</i
                                        ></a>
                                </div>
                                <div class="sinlge-bar shopping">
                                    <a href="viewCart.jsp" class="single-icon"><i class="ti-bag"></i>
                                        <span class="total-count">${cartSize}</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
</c:if>
</body> 
</html>