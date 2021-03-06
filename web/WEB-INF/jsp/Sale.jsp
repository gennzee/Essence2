<%-- 
    Document   : Sale
    Created on : Oct 22, 2018, 9:43:32 PM
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
        <!--header-->
        <jsp:include page="header.jsp"/>
        <!--cart-->
        <jsp:include page="nav_right_side.jsp"/>

        <!-- ##### Breadcumb Area Start ##### -->
        <div class="breadcumb_area bg-img" style="background-image: url(../img/bg-img/breadcumb.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <div class="page-title text-center">
                            <h2>${sale}</h2>
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
                                <h6 class="widget-title mb-30">Catagories</h6>

                                <!--  Catagories  -->
                                <div class="catagories-menu">
                                    <ul id="menu-content2" class="menu-content collapse show">
                                        <!-- Single Item -->
                                        <li data-toggle="collapse" data-target="#clothing">
                                            <a href="#">Thương hiệu</a>
                                            <ul class="sub-menu collapse show" id="clothing">
                                                <li><a href="../products/products_selection_thuonghieu.htm">All</a></li>
                                                    <c:forEach var="rows" items="${listNav_thuonghieu}">
                                                    <li><a href="<s:url value="../products/${rows.catalogmenuid}.htm"/>">${rows.catalogmenuname}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </li>
                                        <!-- Single Item -->
                                        <li data-toggle="collapse" data-target="#shoes" class="collapsed">
                                            <a href="#">Linh kiện</a>
                                            <ul class="sub-menu collapse show" id="shoes">
                                                <li><a href="../products/products_selection_linhkien.htm">All</a></li>
                                                    <c:forEach var="rows" items="${listNav_linhkien}">
                                                    <li><a href="<s:url value="../products/${rows.catalogmenuid}.htm"/>">${rows.catalogmenuname}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </li>
                                        <!-- Single Item -->
                                        <li data-toggle="collapse" data-target="#accessories" class="collapsed">
                                            <a href="#">Đồng hồ cho giới tính</a>
                                            <ul class="sub-menu collapse show" id="accessories">
                                                <c:forEach var="rows" items="${listNav_gioitinh}">
                                                    <li><a href="<s:url value="../products/${rows.catalogmenuid}.htm"/>">${rows.catalogmenuname}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </li>
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
                                            <p><span>${sale_size}</span> products found</p>
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
                                                <div class="product-badge offer-badge">
                                                    <span>-<fmt:formatNumber value="${(rows.discount/rows.price)*100}" maxFractionDigits="0"/>%</span>
                                                </div>
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
                                                        <a href="<s:url value="javascript:void(0)"/>" onclick="$.get('../cartbean/${rows.id}.htm');return location.reload();" class="btn essence-btn">Add to Cart</a>
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
        <jsp:include page="footer.jsp"/>
    </body>
</html>
