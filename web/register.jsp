<%-- 
    Document   : createUser
    Created on : Mar 3, 2022, 8:57:43 AM
    Author     : User
--%>

<%@page import="trungtin.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Input your information:</h1>
        <% UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
        <form action="MainController" method="POST">
            UserID: <input type="text" name="userID" required="" placeholder="Input User ID.."/> <%= userError.getUserIDError()%> </br>
            Full Name: <input type="text" name="fullName" placeholder="Input Full Name.." required=""/><%= userError.getFullNameError()%> </br>
            Password: <input type="password" name="password" placeholder="Input Password.." required=""/><%= userError.getPasswordError()%> </br>
            Confirm Password: <input type="password" name="confirmPassword" placeholder="Input Confirm Password.." required=""/><%= userError.getConfirmError()%> </br>
            Address: <input type="text" name="address" placeholder="Input Address.." required=""/><%= userError.getFullNameError()%> </br>
            Birthday: <input type="date" name="birthday" placeholder="Input Birthday.." required=""/><%= userError.getFullNameError()%> </br>
            Phone: <input type="text" name="phone" placeholder="Input Phone Number.." required=""/><%= userError.getFullNameError()%> </br>
            Email: <input type="email" name="email" placeholder="Input Email.." required=""/><%= userError.getFullNameError()%> </br>

            <input type="submit" value="Register" name="btnAction" />
            <input type="reset" value="Reset" />
        </form>
        <a href="login.jsp">Back to Login</a>
    </body>
</html>
