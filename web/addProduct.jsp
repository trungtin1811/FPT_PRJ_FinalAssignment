<%-- 
    Document   : addProduc
    Created on : Mar 4, 2022, 11:05:55 PM
    Author     : User
--%>

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
        <title>Eshop - Add Product</title>
        <link rel="icon" type="image/png" href="" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="css/font-awesome.css" />
        <link rel="stylesheet" href="css/themify-icons.css" />
        <link rel="stylesheet" href="style.css" />
    </head>

    <body class="js">
        <c:set var="categoryList" value="${sessionScope.LIST_CATEGORY}"/>
        <c:set var="productError" value="${requestScope.PRODUCT_ERROR}"/>
        <%@include file="header.jsp" %>
        <c:if test="${empty loginUser or loginUser.roleID eq 'US'}">
            <c:redirect url="Login.jsp"/>
        </c:if>
        <div class="add-product-container container p-0">
            <h3>Add Product</h3>
            <form action="AddProductController" method="POST" enctype="multipart/form-data"  class="admin-product-wrapper">
                <div class="product-attr">
                    <div class="product-header">Product ID</div>
                    <div class="product-input"><input type="text" required="" name="productID"/><span class="error">${productError.productIDError}</span></div>
                </div>
                <div class="product-attr">
                    <div class="product-header">Product Name</div>
                    <div class="product-input"><input type="text" required="" name="productName"/><span class="error">${productError.productNameError}</span></div>
                </div>
                <div class="product-attr">
                    <div class="product-header">Image</div>
                    <div class="product-input pi-img">
                        <img class="product-img-thumb" id="img-thumb" src="" alt="" >
                        <input type="file" name="image" required="" onchange="readURL(this);">
                    </div>
                </div>
                <div class="product-attr">
                    <div class="product-header">Price</div>
                    <div class="product-input"><input type="number" required="" name="price" min="1000"/></div>
                </div>
                <div class="product-attr">
                    <div class="product-header">In Stock</div>
                    <div class="product-input"><input type="number" required="" name="quantity" min="0"/></div>
                </div>
                <div class="product-attr">
                    <div class="product-header">Category</div>
                    <div class="product-input">
                        <select name="categoryID">
                            <c:forEach var="category" items="${categoryList}">
                                <option value="${category.key}">${category.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="product-attr">
                    <div class="product-header">Import Date</div>
                    <div class="product-input"><input type="date" required="" name="importDate"/></div>
                </div>
                <div class="product-attr">
                    <div class="product-header">Expiry Date</div>
                    <div class="product-input"><input type="date" required="" name="usingDate"/></div>
                </div>
                <button  class="add-product-btn" type="submit" value="AddProduct" name="btnAction"> ADD PRODUCT</button>
            </form>
            <p>${requestScope.MESSAGE}</p>
        </div>
        <script src="scripts/main.js"></script>
    </body>

</html>