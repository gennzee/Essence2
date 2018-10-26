<%-- 
    Document   : index
    Created on : Oct 2, 2018, 5:39:20 PM
    Author     : tanks
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="icon" href="../img/icon/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="../css/core-style.css">
        <link rel="stylesheet" href="../style.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="nav_right_side.jsp"/>
        <!-- ##### Welcome Area Start ##### -->
        <section class="welcome_area bg-img background-overlay" style="background-image: url(../img/bg-img/bg-12.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <div class="hero-content">
                            <h6>asoss</h6>
                            <h2><s:message code="label.newcollection"/></h2>
                            <a href="../news/news.htm" class="btn essence-btn"><s:message code="label.viewcollection"/></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Welcome Area End ##### -->

        <!-- ##### Top Catagory Area Start ##### -->
        <div class="top_catagory_area section-padding-80 clearfix">
            <div class="container">
                <div class="row justify-content-center">
                    <!-- Single Catagory -->
                    <div class="col-12 col-sm-6 col-md-4">
                        <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(../img/bg-img/bg-102.jpg);">
                            <div class="catagory-content">
                                <a href="../products/products_selection_thuonghieu.htm">Watch</a>
                            </div>
                        </div>
                    </div>
                    <!-- Single Catagory -->
                    <div class="col-12 col-sm-6 col-md-4">
                        <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(../img/bg-img/bg-99.jpg);">
                            <div class="catagory-content">
                                <a href="../products/products_selection_linhkien.htm">Accessories</a>
                            </div>
                        </div>
                    </div>
                    <!-- Single Catagory -->
                    <div class="col-12 col-sm-6 col-md-4">
                        <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(../img/bg-img/bg-100.jpg);">
                            <div class="catagory-content">
                                <a href="../news/news.htm">News</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Top Catagory Area End ##### -->

        <!-- ##### CTA Area Start ##### -->
        <div class="cta-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="cta-content bg-img background-overlay" style="background-image: url(../img/bg-img/bg-5.jpg);">
                            <div class="h-100 d-flex align-items-center justify-content-end">
                                <div class="cta--text">
                                    <h6>-60%</h6>
                                    <h2>Global Sale</h2>
                                    <a href="../sale/sale.htm" class="btn essence-btn">Buy Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### CTA Area End ##### -->

        <!-- ##### New Arrivals Area Start ##### -->
        <section class="new_arrivals_area section-padding-80 clearfix">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-heading text-center">
                            <h2><s:message code="label.cac"/></h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="popular-products-slides owl-carousel">

                            <!-- List Product -->

                            <c:forEach var="rows" items="${listProducts}">
                                <div class="single-product-wrapper">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <img src="../img/product-img/${rows.img1}" alt="">
                                        <!-- Hover Thumb -->
                                        <img class="hover-img" src="../img/product-img/${rows.img2}" alt="">
                                        <c:if test="${(rows.discount/rows.price)*100 > 0}">
                                            <div class="product-badge offer-badge">
                                                <span>-<fmt:formatNumber value="${(rows.discount/rows.price)*100}" maxFractionDigits="0"/>%</span>
                                            </div>
                                        </c:if>
                                        <!-- Favourite -->
                                        <div class="product-favourite">
                                            <a href="<s:url value="../wishlist/${rows.id}.htm"/>" class="favme fa fa-heart"></a>
                                        </div>
                                    </div>
                                    <!-- Product Description -->
                                    <div class="product-description">
                                        <span>ABC Company</span>
                                        <a href="<s:url value="../product_detail/${rows.id}.htm"/>">
                                            <h6>${rows.name}</h6>
                                        </a>
                                        <p class="product-price">${rows.price} VND</p>

                                        <!-- Hover Content -->
                                        <div class="hover-content">
                                            <!-- Add to Cart -->
                                            <div class="add-to-cart-btn">
                                                <a href="<s:url value="../cartbean/${rows.id}.htm"/>" class="btn essence-btn">Add to Cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### New Arrivals Area End ##### -->

        <!-- ##### Brands Area Start ##### -->
        <div class="brands-area d-flex align-items-center justify-content-between">
            <!-- Brand Logo -->
            <div class="single-brands-logo">
                <img src="../img/core-img/brand1.png" alt="">
            </div>
            <!-- Brand Logo -->
            <div class="single-brands-logo">
                <img src="../img/core-img/brand2.png" alt="">
            </div>
            <!-- Brand Logo -->
            <div class="single-brands-logo">
                <img src="../img/core-img/brand3.png" alt="">
            </div>
            <!-- Brand Logo -->
            <div class="single-brands-logo">
                <img src="../img/core-img/brand4.png" alt="">
            </div>
            <!-- Brand Logo -->
            <div class="single-brands-logo">
                <img src="../img/core-img/brand5.png" alt="">
            </div>
            <!-- Brand Logo -->
            <div class="single-brands-logo">
                <img src="../img/core-img/brand6.png" alt="">
            </div>
        </div>
        <!-- ##### Brands Area End ##### -->

        <!--Footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>