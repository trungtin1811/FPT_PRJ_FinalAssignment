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
        <title>Eshop - Update Product</title>
        <link rel="icon" type="image/png" href="" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="css/font-awesome.css" />
        <link rel="stylesheet" href="css/themify-icons.css" />
        <link rel="stylesheet" href="style.css" />
    </head>

    <body class="js">
        <%@include file="header.jsp" %>
        <c:set var="categoryList" value="${sessionScope.LIST_CATEGORY}"/>
        <c:set var="updateProduct" value="${sessionScope.UPDATE_PRODUCT}"/>
        <c:set var="productError" value="${requestScope.PRODUCT_ERROR}"/>
        <div class="update-product-container container p-0">
            <h3>Update Product</h3>
            <form action="UpdateProductController" method="POST" enctype="multipart/form-data" class="admin-product-wrapper">
                <div class="product-attr">
                    <div class="product-header">Product ID</div>
                    <div class="product-input"><input type="text"  name="productID" value="${updateProduct.productID}" readonly=""/><span class="error">${productError.productIDError}</span></div>
                </div>
                <div class="product-attr">
                    <div class="product-header">Product Name</div>
                    <div class="product-input"><input type="text"  name="productName" value="${updateProduct.productName}"/><span class="error">${productError.productNameError}</span></div>
                </div>
                <div class="product-attr">
                    <div class="product-header">Image</div>
                    <div class="product-input pi-img">
                        <img class="product-img-thumb" id="img-thumb" src="${updateProduct.image}" alt="" >
                        <input type="file" name="image"  value="${updateProduct.image}" onchange="readURL(this);">    
                    </div>
                </div>
                <div class="product-attr">
                    <div class="product-header">Price</div>
                    <div class="product-input"><input type="number"  name="price" min="1000" value="${updateProduct.price}"/></div>
                </div>
                <div class="product-attr">
                    <div class="product-header">In Stock</div>
                    <div class="product-input"><input type="number"  name="quantity" min="0" value="${updateProduct.quantity}"/></div>
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
                    <div class="product-input"><input type="date"  name="importDate"value="${updateProduct.importDate}"/></div>
                </div>
                <div class="product-attr">
                    <div class="product-header">Using Date</div>
                    <div class="product-input"><input type="date"  name="usingDate"value="${updateProduct.usingDate}"/></div>
                </div>

                <button class="update-product-btn" type="submit" value="UpdateProduct" name="btnAction" >UPDATE PRODUCT</button>
            </form>
            <p>${requestScope.MESSAGE}</p>
        </div>
        <script src="scripts/main.js"></script>
    </body>

</html>