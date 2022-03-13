<%-- 
    Document   : updateUser
    Created on : Mar 9, 2022, 8:16:21 PM
    Author     : User
--%>

<%@page import="trungtin.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="copyright" content="" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Eshop - User</title>
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="table.css">
        <link rel="stylesheet" href="css/font-awesome.css" />
        <link rel="stylesheet" href="css/jquery.fancybox.min.css" />
        <link rel="stylesheet" href="css/themify-icons.css" />
        <link rel="stylesheet" href="style.css" />
    </head>

    <body class="js user">
        <%@include file="header.jsp" %>
        <div class="profile-container container p-0">
            <h3>User Account</h3>
            <div class="profile-wrapper col-12 p-0">
                <div class="user-profile col-3 p-0">
                    <span><i class="fa fa-user-o"></i>My Account</span>            
                </div>
                <div class="profile-info col-9 pr-0">
                    <h4>My Profile</h4>
                    <span class="mp-caption">Manage your account information</span>
                    <hr>
                    <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
                    <c:set var="userError" value="${requestScope.USER_ERROR}"/>
                    <form action="MainController" method="POST"  class="information-wrapper">
                        <table class="user-info">
                            <tbody>
                                <tr>
                                    <td class="info-type">User ID</td>
                                    <td class="info-input"><input type="text" name="userID" readonly="" value="${loginUser.userID}"/> <span class="error">${userError.userIDError}</span></td>
                                </tr>
                                <tr>
                                    <td class="info-type">User Name</td>
                                    <td class="info-input"><input type="text" name="fullName" value="${loginUser.fullName}" placeholder="Input Full Name.."/><span class="error">${userError.fullNameError}</span></td>
                                </tr>
                                <tr>
                                    <td class="info-type">Role ID</td>
                                    <td class="info-input"><input class="user-id" type="text" readonly value="US"></td>
                                </tr>
                                <tr>
                                    <td class="info-type">Password</td>
                                    <td class="info-input"><input type="password" name="password" placeholder="Input Password.."/><span class="error">${userError.passwordError}</span></td>
                                </tr><tr>
                                    <td class="info-type">Confirm Password</td>
                                    <td class="info-input"><input type="password" name="confirmPassword" placeholder="Input Confirm Password.."/><span class="error">${userError.confirmError}</span> </td>
                                </tr>
                                <tr>
                                    <td class="info-type">Address</td>
                                    <td class="info-input"><input type="text" name="address" placeholder="Input Address.." value="${loginUser.address}"/><span class="error">${userError.addressError}</span></td>
                                </tr>
                                <tr>
                                    <td class="info-type">Birthday</td>
                                    <td class="info-input"><input type="date" name="birthday" placeholder="Input Birthday.." value="${loginUser.birthday}"/><span class="error">${userError.birthdayError}</span></td>
                                </tr>
                                <tr>
                                    <td class="info-type">Phone Number</td>
                                    <td class="info-input"><input type="text" name="phone" placeholder="Input Phone Number.." value="${loginUser.phone}"/><span class="error">${userError.phoneError}</span></td>
                                </tr>
                                <tr>
                                    <td class="info-type">Email:</td>
                                    <td class="info-input"><input type="email" name="email" placeholder="Input Email.." value="${loginUser.email}"/><span class="error">${userError.emailError}</span></td>
                                </tr>
                            </tbody>
                        </table>
                </div>
            </div>
            <button class="update-pf-btn" type="submit" value="UpdateUser" name="btnAction" style="margin-bottom: 20px; display: inline-block">UPDATE</button> <span>${requestScope.MESSAGE}</span>

        </div>
    </form>
    <script src="scripts/main.js"></script>
</body>

</html>