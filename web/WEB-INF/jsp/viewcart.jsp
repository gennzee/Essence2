<%-- 
    Document   : viewcart
    Created on : Nov 6, 2018, 10:39:46 AM
    Author     : Genn
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
                            <h2>Shopping Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Breadcumb Area End ##### -->

        <div class="checkout_area section-padding-80">
            <div class="site-section">
                <div class="container">
                    <div class="row mb-5">
                        <form class="col-md-12" method="post">
                            <div class="site-blocks-table">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr style="text-align: center;">
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-total">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="shop" value="${sessionScope.SHOP}"/>
                                        <c:if test="${not empty shop}">
                                            <c:set var="totalprice" value="${0}"/>
                                            <c:set var="totaldiscount" value="${0}"/>
                                            <c:forEach var="rows" items="${shop}">
                                                <c:set var="totalprice" value="${totalprice + rows.value.sanpham.price * rows.value.quantity}"/>
                                                <c:set var="totaldiscount" value="${totaldiscount + rows.value.sanpham.discount * rows.value.quantity}"/>
                                            <form action="../cartbean/remove.htm" method="get">
                                                <tr style="text-align: center;">
                                                    <td class="product-thumbnail" style="width: 15%;">
                                                        <img src="../img/product-img/${rows.value.sanpham.img1}" style="width: 75%" alt="Image" class="img-fluid">
                                                    </td>
                                                    <td class="product-name" style="text-align: left;">
                                                        <span>${rows.value.sanpham.brand}</span><br>
                                                        <h2 class="h5 text-black">${rows.value.sanpham.name}</h2>
                                                    </td>
                                                    <td><fmt:formatNumber type="number" value="${rows.value.sanpham.price}"/> &#8363</td>
                                                    <td style="width: 15%">
                                                        <div class="input-group mb-3" style="max-width: 100%;">
                                                            <div class="input-group-prepend">
                                                                <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                                                            </div>
                                                            <input type="number" class="form-control text-center" value="${rows.value.quantity}" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                                            <div class="input-group-append">
                                                                <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                                                            </div>
                                                        </div>

                                                    </td>
                                                    <td><fmt:formatNumber type="number" value="${rows.value.quantity * rows.value.sanpham.price}"/> &#8363</td>
                                                    <td><a href="<s:url value="../cartbean/delete/${rows.value.sanpham.id}.htm"/>" class="product-remove" ><i class="fa fa-trash-o" style="font-size: 24px" aria-hidden="true"></i></a></td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="row mb-5">
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <button class="btn btn-outline-primary btn-sm btn-block">Update Cart</button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-outline-primary btn-sm btn-block" onclick="window.history.back();">Continue Shopping</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 pl-5">
                            <div class="row justify-content-end">
                                <div class="col-md-7">
                                    <div class="row">
                                        <div class="col-md-12 text-right border-bottom mb-5">
                                            <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <span class="text-black">Subtotal</span>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <strong class="text-black"><fmt:formatNumber type="number" value="${totalprice}"/> &#8363</strong>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <span class="text-black">Delivery</span>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <strong class="text-black">
                                                <c:if test="${totalprice >= 300000000}">
                                                    <span>Free</span>
                                                </c:if>
                                                <c:if test="${totalprice < 300000000}">
                                                    <span><fmt:formatNumber type="number" value="25000"/> &#8363</span>
                                                </c:if>
                                            </strong>
                                        </div>
                                    </div>
                                    <div class="row mb-5">
                                        <div class="col-md-6">
                                            <span class="text-black">Total</span>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <strong class="text-black">
                                                <c:if test="${totalprice >= 300000000}">
                                                    <span><fmt:formatNumber type="number" value="${totalprice - totaldiscount}"/> &#8363</span>
                                                </c:if>
                                                <c:if test="${totalprice < 300000000}">
                                                    <span><fmt:formatNumber type="number" value="${totalprice + 25000 - totaldiscount}"/> &#8363</span>
                                                </c:if>
                                            </strong>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <a href="../checkout/checkout.htm" class="btn essence-btn" style="width: 100%">Proceed To Checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>



        <script src="../js/js_shopcart/owl.carousel.min.js"></script>
        <script src="../js/js_shopcart/jquery.magnific-popup.min.js"></script>
        <script src="../js/js_shopcart/aos.js"></script>

        <script src="../js/js_shopcart/main.js"></script>
    </body>
</html>
