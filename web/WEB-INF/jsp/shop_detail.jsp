<%-- 
    Document   : shop_detail
    Created on : Oct 3, 2018, 10:17:53 PM
    Author     : tanks
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Essence - Fashion Ecommerce Template</title>

        <!-- Favicon  -->
        <link rel="icon" href="../img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="../css/core-style.css">
        <link rel="stylesheet" href="../style.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="nav_right_side.jsp"/>

        <!-- ##### Single Product Details Area Start ##### -->
        <section class="single_product_details_area d-flex align-items-center">
            <c:forEach var="rows" items="${listProducts}">

            <!-- Single Product Thumb -->
            <div class="single_product_thumb clearfix">
                <div class="product_thumbnail_slides owl-carousel">
                    <img src="../img/product-img/${rows.img1}" alt="">
                    <img src="../img/product-img/${rows.img2}" alt="">
                </div>
            </div>

            <!-- Single Product Description -->
            
            <div class="single_product_desc clearfix">
                <span>mango</span>
                <a href="#">
                    <h2>${rows.name}</h2>
                </a>
                <p class="product-price"><fmt:formatNumber value="${rows.price}" type="number" /> VNĐ</p>
                <p class="product-desc">${rows.detail}</p>

                <!-- Form -->
                <form class="cart-form clearfix" method="post">
                    <!-- Select Box -->
                    <div class="select-box d-flex mt-50 mb-30">
                        <select name="select" id="productSize" class="mr-5">
                            <option value="value">Size: XL</option>
                            <option value="value">Size: X</option>
                            <option value="value">Size: M</option>
                            <option value="value">Size: S</option>
                        </select>
                        <select name="select" id="productColor">
                            <option value="value">Color: Black</option>
                            <option value="value">Color: White</option>
                            <option value="value">Color: Red</option>
                            <option value="value">Color: Purple</option>
                        </select>
                    </div>
                    <!-- Cart & Favourite Box -->
                    <div class="cart-fav-box d-flex align-items-center">
                        <!-- Cart -->
                        <button type="submit" name="addtocart" value="5" class="btn essence-btn">Add to cart</button>
                        <!-- Favourite -->
                        <div class="product-favourite ml-4">
                            <a href="#" class="favme fa fa-heart"></a>
                        </div>
                    </div>
                </form>
            </div>
            </c:forEach>
        </section>
        <!-- ##### Single Product Details Area End ##### -->

        <!--Footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>
