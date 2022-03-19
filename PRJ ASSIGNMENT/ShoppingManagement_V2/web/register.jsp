<%-- 
    Document   : createUser
    Created on : Mar 3, 2022, 8:57:43 AM
    Author     : User
--%>

<%@page import="trungtin.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Eshop - Register</title>
        <link rel="stylesheet" href="css/register.css">
        <link rel="stylesheet" href="css/font-awesome.css" />
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        
        <style>
            .error {
                font-size: 0.7em;
            }
        </style>
    </head>

    <body>
        <c:set var="userError" value="${requestScope.USER_ERROR}"/>
        <div class="container right-panel-active" id="container">
            <div class="form-container sign-up-container">
                <form method="POST" action="RegisterController" class="form" id="register">
                    <h1 class="form__title">Register</h1>
                    <div class="form__input-group">
                        <label for="username"> Username *: </label>
                        <input type="text" class="form__input" name="userID" id="username" maxlength="20" placeholder="Input User ID.." required>
                    </div>
                    <span class="error">${userError.userIDError}</span>
                    <div class="form__input-group">
                        <label for="username"> Full Name *: </label>
                        <input type="text" class="form__input" name="fullName" id="fullName" placeholder="Input Full Name.." maxlength="20" required>
                    </div>
                    <span class="error">${userError.fullNameError}</span>
                    <div class="form__input-group">
                        <label for="pass">Password *: </label>
                        <input type="password" class="form__input" name="password" id="password" maxlength="20" placeholder="Input Password.." required>
                    </div>
                    <span class="error">${userError.passwordError}</span>
                    <div class="form__input-group">
                        <label for="pass">Confirm Password *: </label>
                        <input type="password" class="form__input" name="confirmPassword" id="pass" maxlength="20" placeholder="Input Confirm Password.." required>
                    </div>                 
                    <span class="error">${userError.confirmError}</span>
                    <div class="form__input-group">
                        <label for="pass">Address *: </label>
                        <input type="text" class="form__input" placeholder="Input Address.." name="address" id="pass" placeholder="Input Confirm Password.." required>
                    </div>
                    <span class="error">${userError.addressError}</span>
                    <div class="form__input-group">
                        <label for="pass">Birthday *: </label>
                        <input type="date" class="form__input" placeholder="Input Birthday.." name="birthday" id="pass" placeholder="Input Confirm Password.." required>
                    </div>
                    <span class="error">${userError.birthdayError}</span> 
                    <div class="form__input-group">
                        <label for="pass">Phone Number *: </label>
                        <input type="text" class="form__input" placeholder="Input Phone Number.." name="phone" id="pass"  placeholder="Input Confirm Password.." required>
                    </div>
                    <span class="error">${userError.phoneError}</span> 
                    <div class="form__input-group">
                        <label for="pass">Email *: </label>
                        <input type="email" class="form__input" placeholder="Input Email.." name="email" id="pass" placeholder="Input Confirm Password.." required>
                    </div>
                    <span class="error">${userError.emailError}</span>
                    <div class="g-recaptcha" data-sitekey="6LcyusseAAAAAFUTZ6BMPTVypb4xu5EMSYkCHSXb"></div>
                    <button class="form__button" value="Register" type="submit" name="btnAction">Register</button>
                </form>
            </div>

            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>Please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                        <a href="MainController?searchValue=&btnAction=FindProduct" class="back-btn"><i class="fa fa-angle-double-left" aria-hidden="true"></i>
                            Back to shopping!</a>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            document.getElementById('signIn').onclick = function () {
                location.href = 'login.jsp';
            }
        </script>
        <script>
            window.onload = function () {
                let isValid = false;
                const form = document.getElementById("register");
                const error = document.getElementById("error");
                form.addEventListener("submit", function (event) {
                    event.preventDefault();
                    const response = grecaptcha.getResponse()
                    if (response) {
                        form.submit();
                    }
                })
            }
        </script>
        <script src="scripts/main.js"></script>
    </body>

</html>
