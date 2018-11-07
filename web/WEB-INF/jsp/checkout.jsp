<%-- 
    Document   : checkout
    Created on : Oct 11, 2018, 9:49:45 PM
    Author     : tanks
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
                            <h2>Checkout</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Breadcumb Area End ##### -->

        <!-- ##### Checkout Area Start ##### -->
        <div class="checkout_area section-padding-80">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <div class="checkout_details_area mt-50 clearfix">
                            <c:choose>
                                <c:when test="${sessionScope.USER != null}">
                                    <div class="cart-page-heading mb-30">
                                        <h5>Billing Address</h5>
                                    </div>
                                    <form id="form" action="../checkout/add_orders.htm" method="get">
                                        <div class="row">
                                            <c:forEach var="rows" items="${listUser}">
                                                <input type="text" hidden="true" name="txtUserID" value="${rows.id}">
                                                <div class="col-12 mb-3">
                                                    <label for="full_name">Full Name <span>*</span></label>
                                                    <input name="txtName" type="text" class="form-control mb-3" id="full_name" value="${rows.name}">
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <label for="street_address">Address <span>*</span></label>
                                                    <input name="txtAddress" type="text" class="form-control mb-3" id="street_address" value="${rows.address}">
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <label for="phone_number">Phone No <span>*</span></label>
                                                    <input name="txtPhone" type="number" class="form-control" id="phone_number" min="0" value="${rows.phone}">
                                                </div>
                                                <div class="col-12 mb-4">
                                                    <label for="email_address">Email Address <span>*</span></label>
                                                    <input name="txtEmail" type="email" class="form-control" id="email_address" value="${rows.email}">
                                                </div>
                                                <div class="col-12 mb-4">
                                                    <label for="note">Notes </label>
                                                    <textarea style="height: 20vh;" rows="10" cols="50" class="form-control" id="note" name="note" ></textarea>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <c:set var="shop2" value="${sessionScope.SHOP}"/>
                                        <c:if test="${not empty shop2}">
                                            <c:set var="totalprice2" value="${0}"/>
                                            <c:set var="totaldiscount2" value="${0}"/>
                                            <c:forEach var="rowss" items="${shop2}">
                                                <c:set var="totalprice2" value="${totalprice2 + rowss.value.sanpham.price * rowss.value.quantity}"/>
                                                <c:set var="totaldiscount2" value="${totaldiscount2 + rowss.value.sanpham.discount * rowss.value.quantity}"/>
                                                <input name="txtProductID" type="text" hidden="true" value="${rowss.value.sanpham.id}"/>
                                                <input name="txtQuantity" type="text" hidden="true" value="${rowss.value.quantity}"/>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${totalprice2 >= 300000000}">
                                                    <input name="txtTotalPrice" type="text" hidden="true" value="${totalprice2 - totaldiscount2}"/>
                                                </c:when>
                                                <c:when test="${totalprice2 < 300000000}">
                                                    <input name="txtTotalPrice" type="text" hidden="true" value="${totalprice2 + 25000 - totaldiscount2}"/>
                                                </c:when>
                                            </c:choose>
                                        </c:if>
                                    </form>
                                    <div style="width: 100%; text-align: center;">
                                        <button onclick="resetFunction();" class="btn essence-btn">Reset</button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="cart-page-heading mb-30">
                                        <h5>Login in to checkout those products.</h5>
                                    </div>
                                    <form action="../login/loginIndex.htm" method="post">
                                        <div class="col-12 mb-3">
                                            <label for="user_name">Username <span>*</span></label>
                                            <input name="txtUser" type="text" class="form-control mb-3" id="user_name" value="">
                                        </div>
                                        <div class="col-12 mb-3">
                                            <label for="pass_word">Password <span>*</span></label>
                                            <input name="txtPass" type="password" class="form-control mb-3" id="pass_word" value="">
                                        </div>
                                        <div class="col-12 mb-3">
                                            <label for="state">Đăng ký tài khoản <a href="#" style="text-decoration: underline;" data-toggle="modal" data-target="#user_register">tại đây </a> </label>
                                            <label for="state" style="float: right;"><a href="#" data-toggle="modal" data-target="#forgot_password" data-dismiss="modal">Quên mật khẩu ? </a> </label>
                                        </div>
                                        <div style="width: 100%;text-align: center;">
                                            <button type="submit" class="btn essence-btn" >Submit</button>
                                            <button type="reset" class="btn essence-btn">Reset</button>
                                        </div>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>



                    <div class="col-12 col-md-6 col-lg-5 ml-lg-auto">
                        <div class="order-details-confirmation">

                            <div class="cart-page-heading">
                                <h4>Your Order</h4>
                                <p>The Details</p>
                            </div>

                            <ul class="order-details-form mb-4">
                                <li><span style="font-size: 140%;">Product</span> <span style="font-size: 140%;">Total</span></li>
                                    <c:set var="shop" value="${sessionScope.SHOP}"/>
                                    <c:if test="${not empty shop}">
                                        <c:set var="totalprice" value="${0}"/>
                                        <c:set var="totaldiscount" value="${0}"/>
                                        <c:forEach var="rows" items="${shop}">
                                            <c:set var="totalprice" value="${totalprice + rows.value.sanpham.price * rows.value.quantity}"/>
                                            <c:set var="totaldiscount" value="${totaldiscount + rows.value.sanpham.discount * rows.value.quantity}"/>
                                        <li><span style="text-decoration: underline;">${rows.value.sanpham.name} x ${rows.value.quantity}</span> <span><fmt:formatNumber type="number" value="${rows.value.sanpham.price * rows.value.quantity}"/> &#8363</span></li>
                                        </c:forEach>
                                    <li><span style="font-size: 140%;">Subtotal</span> <span><fmt:formatNumber type="number" value="${totalprice}"/> &#8363</span></li>
                                    <li><span style="font-size: 140%;">Shipping</span> 
                                        <c:if test="${totalprice >= 300000000}">
                                            <span>Free</span>
                                        </c:if>
                                        <c:if test="${totalprice < 300000000}">
                                            <span><fmt:formatNumber type="number" value="25000"/> &#8363</span>
                                        </c:if>
                                    </li>
                                    <li><span style="font-size: 140%;">Total</span> 
                                        <c:if test="${totalprice >= 300000000}">
                                            <span><fmt:formatNumber type="number" value="${totalprice - totaldiscount}"/> &#8363</span>
                                        </c:if>
                                        <c:if test="${totalprice < 300000000}">
                                            <span><fmt:formatNumber type="number" value="${totalprice + 25000 - totaldiscount}"/> &#8363</span>
                                        </c:if>
                                    </li>

                                </ul>
                            </c:if>
                            <div id="accordion" role="tablist" class="mb-4">
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingOne">
                                        <h6 class="mb-0">
                                            <a data-toggle="collapse" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne"><i class="fa fa-circle-o mr-3"></i>Paypal</a>
                                        </h6>
                                    </div>

                                    <div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so dales. Phasellus sagittis auctor gravida. Integ er bibendum sodales arcu id te mpus. Ut consectetur lacus.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingTwo">
                                        <h6 class="mb-0">
                                            <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><i class="fa fa-circle-o mr-3"></i>direct bank transper</a>
                                        </h6>
                                    </div>
                                    <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo quis in veritatis officia inventore, tempore provident dignissimos.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingThree">
                                        <h6 class="mb-0">
                                            <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><i class="fa fa-circle-o mr-3"></i>credit card</a>
                                        </h6>
                                    </div>
                                    <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse quo sint repudiandae suscipit ab soluta delectus voluptate, vero vitae</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" role="tab" id="headingFour">
                                        <h6 class="mb-0">
                                            <a class="collapsed" data-toggle="collapse" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour"><i class="fa fa-circle-o mr-3"></i>cash on delievery</a>
                                        </h6>
                                    </div>
                                    <div id="collapseFour" class="collapse show" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                                        <div class="card-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est cum autem eveniet saepe fugit, impedit magni.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${sessionScope.USER != null}">
                                    <button type="submit" form="form" href="#" class="btn essence-btn">Place Order</button>
                                </c:when>
                                <c:otherwise>
                                    <a href="#" data-toggle="modal" data-target="#loginModal" class="btn essence-btn">Place Order</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Checkout Area End ##### -->


        <!--Footer-->
        <jsp:include page="footer.jsp"/>
        <script>
            function resetFunction() {
                document.getElementById("full_name").value = '';
                document.getElementById("street_address").value = '';
                document.getElementById("phone_number").value = '';
                document.getElementById("email_address").value = '';
                document.getElementById("note").value = '';
            }
        </script>
    </body>
</html>
