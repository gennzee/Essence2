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
        <title>Essence</title>

        <!-- Favicon  -->
        <link rel="icon" href="../img/icon/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="../css/core-style.css">
        <link rel="stylesheet" href="../style.css">
        <link href="../css/pace/blue/pace-theme-corner-indicator.css" rel="stylesheet" type="text/css"/>
        <script src="../js/pace/pace.js"></script>
        <script>
            function load(time) {
                var x = new XMLHttpRequest();
                x.open('GET', "http://localhost:8084/Essence/" + time, true);
                x.send();
            }
            ;

            load(20);
            load(100);
            load(500);
            load(2000);
            load(3000);

            setTimeout(function () {
                Pace.ignore(function () {
                    load(3100);
                });
            }, 4000);

            Pace.on('hide', function () {
                console.log('done');
            });
        </script>
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
                                <a href="../products/4.htm"><s:message code="label.iwatch" text="" /></a>
                            </div>
                        </div>
                    </div>
                    <!-- Single Catagory -->
                    <div class="col-12 col-sm-6 col-md-4">
                        <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(../img/bg-img/bg-99.jpg);">
                            <div class="catagory-content">
                                <a href="../products/6.htm"><s:message code="label.iaccessories" text="" /></a>
                            </div>
                        </div>
                    </div>
                    <!-- Single Catagory -->
                    <div class="col-12 col-sm-6 col-md-4">
                        <div class="single_catagory_area d-flex align-items-center justify-content-center bg-img" style="background-image: url(../img/bg-img/bg-100.jpg);">
                            <div class="catagory-content">
                                <a href="../news/news.htm"><s:message code="label.icollections" text="" /></a>
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
                                    <h2><s:message code="label.iglobalsale" text="" /></h2>
                                    <a href="../sale/sale.htm" class="btn essence-btn"><s:message code="label.ibuynow" text="" /></a>
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
                                        <c:if test="${sessionScope.USER != null}">
                                            <c:forEach var="rowss" items="${sessionScope.WISHLIST_LIST}">
                                                <c:if test="${rowss.productid == rows.id}">
                                                    <c:set var="productid" value="${rowss.productid}"/>
                                                    <c:set var="wishlist_id" value="${rowss.id}"/>
                                                </c:if>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${productid == rows.id}">
                                                    <div class="product-favourite">
                                                        <a href="<s:url value="javascript:void(0)"/>" onclick="$.get('../wishlist/remove/${wishlist_id}.htm');
                                                                return location.reload();" class="favme fa fa-heart active"></a>
                                                    </div>
                                                </c:when>
                                                <c:when test="${productid != rows.id}">
                                                    <div class="product-favourite">
                                                        <a href="<s:url value="javascript:void(0)"/>" onclick="$.get('../wishlist/${rows.id}.htm');
                                                                return location.reload();" class="favme fa fa-heart"></a>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:if>
                                    </div>
                                    <!-- Product Description -->
                                    <div class="product-description">
                                        <span>${rows.brand}</span>
                                        <a href="<s:url value="../product_detail/${rows.id}.htm"/>">
                                            <h6>${rows.name}</h6>
                                        </a>
                                        <p class="product-price"><fmt:formatNumber type="number" value="${rows.price}"/> &#8363</p>

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
