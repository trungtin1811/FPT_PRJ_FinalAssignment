<%-- 
    Document   : login
    Created on : Mar 4, 2022, 5:17:50 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Eshop - Login</title>
        <link rel="stylesheet" href="css/login.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">

    </head>

    <body>
        <div class="container" id="container">
            <div class="form-container sign-in-container">
                <form method="POST" action="MainController" class="form" id="login">
                    <h1 class="form__title">Login</h1>
                    <div class="form__input-group">
                        <label for="username">Username: </label>
                        <input type="text" class="form__input" name="userID" id="username"placeholder="Input userID.." maxlength="20" required>
                    </div>
                    <div class="form__input-group">
                        <label for="pass">Password: </label>
                        <input type="password" class="form__input" name="password" id="pass" placeholder="Input password.." maxlength="20" required>
                    </div>
                    <div class="form__input-group">
                        <button type="submit" value="Login" name="btnAction"  class="form__button">Login</button>
                    </div>
                    <p class="error">${requestScope.ERROR}</p>
                    <div class="col s12 m6 offset-m3 center-align" style="margin-top: -16px">
                        <a class="oauth-container btn darken-4 white black-text" href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/ShoppingManagement_V2/LoginGGController&response_type=code
                           &client_id=729531010209-t3dv2umr1fpkcvl8f5aagbn9lmrsmphh.apps.googleusercontent.com&approval_prompt=force" style="text-transform:none">
                            <div class="left">
                                <img width="20px" style="margin-top:7px; margin-right:8px" alt="Google sign-in" 
                                     src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" />
                            </div>
                            Login with Google
                        </a>
                    </div>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp"><a href="register.jsp" class="ghost" id="signUp">Register</a></button>
                        <a href="MainController?searchValue=&btnAction=FindProduct" class="back-btn" style="color: white"><i class="fa fa-angle-double-left" aria-hidden="true"></i>
                            Back to shopping!</a>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            document.getElementById('signUp').onclick = function () {
                location.href = 'register.jsp';
            };
        </script>
        <script src="scripts/main.js"></script>
    </body>
</html>