<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="copyright" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Eshop - Confirmation</title>
    <link rel="icon" type="image/png" href="images/favicon.png" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="table.css">
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/jquery.fancybox.min.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="style.css" />
</head>

<body class="js confirm-order-page">
    <%@include file="header.jsp" %>
    <div class="confirm-order container p-0">
        <div class="delivery-img">
            <img src="images/delivery.png" alt="">
        </div>
        <div class="thank-you">Thank you for your purchase,<br>Sit back and relax, your order is on its way!</div>
        <div class="buy-more-btn"><a href="MainController?btnAction=FindProduct">BUY MORE</a></div>
        <div class="email-confirmation">An order confirmation was sent to your Email.</div>
    </div>
    <script src="scripts/main.js"></script>
</body>

</html>