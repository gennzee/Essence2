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
        <title>Essence</title>

        <!-- Favicon  -->
        <link rel="icon" href="../img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="../css/core-style.css">
        <link rel="stylesheet" href="../style.css">
        <link href="../css/pace/blue/pace-theme-corner-indicator.css" rel="stylesheet" type="text/css"/>
        <script>
            paceOptions = {
                elements: false,
                restartOnRequestAfter: false
            };
        </script>
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

        <!-- ##### Single Product Details Area Start ##### -->
        <section class="single_product_details_area d-flex align-items-center">
            <c:forEach var="rows" items="${listProducts}">

                <!-- Single Product Thumb -->
                <div class="single_product_thumb clearfix">
                    <div class="product_thumbnail_slides owl-carousel">
                        <img src="../img/product-img/${rows.img1}" alt="" style="width: 50%;height: auto;margin-left: 25%">
                        <img src="../img/product-img/${rows.img2}" alt="" style="width: 50%;height: auto;margin-left: 25%">
                    </div>
                </div>

                <!-- Single Product Description -->

                <div class="single_product_desc clearfix">
                    <span>${rows.brand}</span>
                    <a href="#">
                        <h2>${rows.name}</h2>
                    </a>
                    <c:choose>
                        <c:when test="${rows.discount > 0}">
                            <p class="product-price"><span class="old-price"><fmt:formatNumber value="${rows.price}" type="number" /> &#8363</span><fmt:formatNumber value="${rows.price - rows.discount}" type="number" /> &#8363</p>
                        </c:when>
                        <c:otherwise>
                            <p class="product-price"><fmt:formatNumber value="${rows.price - rows.discount}" type="number" /> &#8363</p>
                        </c:otherwise>
                    </c:choose>
                    <p class="product-desc">${rows.detail}</p>

                    <!-- Form -->
                    <form class="cart-form clearfix" method="post">
                        <!-- Cart & Favourite Box -->
                        <div class="cart-fav-box d-flex align-items-center">
                            <!-- Cart -->
                            <a style="margin-right: 5%;" href="<s:url value="javascript:void(0)"/>" onclick="$.get('../cartbean/${rows.id}.htm');return location.reload();" class="btn essence-btn">Add to Cart</a>
                            <!-- Favourite -->
                            <c:if test="${sessionScope.USER != null}">
                                <c:choose>
                                    <c:when test="${sessionScope.WISHLIST_SIZE > 0}">
                                        <c:forEach var="rowss" items="${sessionScope.WISHLIST_LIST}">
                                            <c:if test="${rowss.productid == rows.id}">
                                                <c:set var="productid" value="${rowss.productid}"/>
                                                <c:set var="wishlist_id" value="${rowss.id}"/>
                                            </c:if>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${productid == rows.id}">
                                                <div class="product-favourite">
                                                    <a href="<s:url value="javascript:void(0)"/>" onclick="$.get('../wishlist/remove/${wishlist_id}.htm');return location.reload();" class="favme fa fa-heart active"></a>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="product-favourite">
                                                    <a href="<s:url value="javascript:void(0)"/>" onclick="$.get('../wishlist/${rows.id}.htm');return location.reload();" class="favme fa fa-heart"></a>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>

                                    </c:when>
                                    <c:otherwise>
                                        <div class="product-favourite">
                                            <a href="<s:url value="javascript:void(0)"/>" onclick="$.get('../wishlist/${rows.id}.htm');return location.reload();" class="favme fa fa-heart"></a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
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
