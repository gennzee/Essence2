
<%@page import="java.math.RoundingMode"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="../js/pace.js"></script>
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

        <style>
            .easyPaginateNav{
                width: 100% !important;
                text-align: center;
            }
            .easyPaginateNav a {
                padding: 2vh 3vh 2vh 3vh;
                color: #727a7a;
                border: 1px solid #e9e9e9;
            }
            .easyPaginateNav a.current {
                font-weight:bold;
                background-color: #e9ecef; ;
                color: #0315ff;
            }
        </style>
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

        <!-- ##### Breadcumb Area Start ##### -->
        <div class="breadcumb_area bg-img" style="background-image: url(../img/bg-img/breadcumb.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <div class="page-title text-center">
                            <c:forEach var="rows" items="${shop_title}">
                                <h2>${rows.name}</h2>
                            </c:forEach>
                            <h2>${sale}${shop_title_search_result}</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Breadcumb Area End ##### -->

        <!-- ##### Shop Grid Area Start ##### -->
        <section class="shop_grid_area section-padding-80">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-4 col-lg-3">
                        <div class="shop_sidebar_area">

                            <!-- ##### Single Widget ##### -->
                            <div class="widget catagory mb-50">
                                <!-- Widget Title -->
                                <h6 class="widget-title mb-30"><s:message code="label.scatagories" text="" /></h6>

                                <!--  Catagories  -->
                                <div class="catagories-menu">

                                    <ul id="menu-content2" class="menu-content collapse show">
                                        <c:forEach var="rows" items="${sessionScope.list_Nav}">
                                            <!-- Single Item -->
                                            <li data-toggle="collapse" data-target="#clothing${rows.id}">
                                                <a href="#">${rows.name}</a>
                                                <ul class="sub-menu collapse show" id="clothing${rows.id}">
                                                    <c:forEach var="rowss" items="${sessionScope.list_Catalog}">
                                                        <c:if test="${rows.id == rowss.navid}">
                                                            <li><a href="<s:url value="../products/${rowss.id}.htm"/>">${rowss.name}</a></li>
                                                            </c:if>
                                                        </c:forEach>
                                                </ul>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-12 col-md-8 col-lg-9">
                        <div class="shop_grid_product_area">
                            <div class="row">
                                <div class="col-12">
                                    <div class="product-topbar d-flex align-items-center justify-content-between">
                                        <!-- Total Products -->
                                        <div class="total-products">
                                            <p><span>${product_size}${search_size}${shopIndex_size}</span> <s:message code="label.sproductfount" text="" /></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="easyPaginate" class="row">

                                <!-- List Product -->


                                <c:forEach var="rows" items="${listProducts}">
                                    <div class="col-12 col-sm-6 col-lg-4">
                                        <div class="single-product-wrapper">
                                            <!-- Product Image -->
                                            <div class="product-img">
                                                <img src="../img/product-img/${rows.img1}" alt="">
                                                <!-- Hover Thumb -->
                                                <img class="hover-img" src="../img/product-img/${rows.img2}" alt="">

                                                <!-- Product Badge -->
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
                                                                <a href="<s:url value="../wishlist/remove/${wishlist_id}.htm"/>" onclick="return location.reload();" class="favme fa fa-heart active"></a>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="product-favourite">
                                                                <a href="<s:url value="../wishlist/${rows.id}.htm"/>" onclick="return location.reload();" class="favme fa fa-heart"></a>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>

                                            </div>

                                            <!-- Product Description -->
                                            <div class="product-description">

                                                <span>${rows.brand}</span>
                                                <a href="<s:url value="../product_detail/${rows.id}.htm"/>">
                                                    <h6>${rows.name}</h6>
                                                </a>

                                                <p class="product-price"><fmt:formatNumber value="${rows.price}" type="number" /> &#8363</p>

                                                <!-- Hover Content -->
                                                <div class="hover-content">
                                                    <!-- Add to Cart -->
                                                    <div class="add-to-cart-btn">
                                                        <a href="<s:url value="../cartbean/${rows.id}.htm"/>" onclick="return location.reload();" class="btn essence-btn">Add to Cart</a>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Shop Grid Area End ##### -->


        <!--Pagination-->
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="../js/jquery.easyPaginate.js"></script>
        <script>
                                                            $('#easyPaginate').easyPaginate({
                                                                paginateElement: 'div.col-12',
                                                                elementsPerPage: 6,
                                                                effect: 'default'
                                                            });
        </script>
        <!--        <script>
        //            addtocart
                    $(function () {
                        $("a.btn").click(function () {
                            return location.reload();
                        });
                    });
                </script>-->
        <jsp:include page="footer.jsp"/>





    </body>
</html>
