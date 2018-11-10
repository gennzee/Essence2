<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<script src="../js/validation-form/validation.js"></script>
<!-- ##### Footer Area Start ##### -->
<footer class="footer_area clearfix">
    <div class="container">
        <div class="row">
            <!-- Single Widget Area -->
            <div class="col-12 col-md-6">
                <div class="single_widget_area d-flex mb-30">
                    <!-- Logo -->
                    <div class="footer-logo mr-50">
                        <a href="#"><img src="../img/core-img/logo2.png" alt=""></a>
                    </div>
                    <!-- Footer Menu -->
                    <div class="footer_menu">
                        <ul>
                            <li><a href="#">Shop</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Single Widget Area -->
            <div class="col-12 col-md-6">
                <div class="single_widget_area mb-30">
                    <ul class="footer_widget_menu">
                        <li><a href="#">Order Status</a></li>
                        <li><a href="#">Payment Options</a></li>
                        <li><a href="#">Shipping and Delivery</a></li>
                        <li><a href="#">Guides</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Use</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row align-items-end">
            <!-- Single Widget Area -->
            <div class="col-12 col-md-6">
                <div class="single_widget_area">
                    <div class="footer_heading mb-30">
                        <h6>Subscribe</h6>
                    </div>
                    <div class="subscribtion_form">
                        <form action="#" method="post">
                            <input type="email" name="mail" class="mail" placeholder="Your email here">
                            <button type="submit" class="submit"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Single Widget Area -->
            <div class="col-12 col-md-6">
                <div class="single_widget_area">
                    <div class="footer_social_area">
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Youtube"><i class="fa fa-youtube-play" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-md-12 text-center">
                <p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
        </div>

    </div>
</footer>

<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"><s:message code="label.logintitle" text="Login" /></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form name="loginForm" onsubmit="return loginForms()" action="../login/loginIndex.htm" method="post">
                <!-- Modal body -->
                <div class="modal-body">
                    <div>
                        <div class="col-12 mb-3">
                            <label for="city"><s:message code="label.username" text="" /> </label>
                            <p id="txt_username" style="color: red;"></p>
                            <input type="text" name="txtUser" class="form-control" value="">

                        </div>
                        <div class="col-12 mb-3">
                            <label for="state"><s:message code="label.password" text="" /> </label>
                            <p id="txt_password" style="color: red;"></p>
                            <input type="password" name="txtPass" class="form-control" value="">

                        </div>
                        <div class="col-12 mb-3">
                            <label for="state"><s:message code="label.register" text="" /> <a href="#" style="font-size: 14px;" data-toggle="modal" data-target="#user_register"><s:message code="label.here" text="" /> </a> </label>
                            <label for="state" style="float: right;"><a href="#" style="font-size: 14px;" data-toggle="modal" data-target="#forgot_password" data-dismiss="modal"><s:message code="label.forgotpassword" text="" /> ? </a> </label>
                        </div>
                        <div style="width: 100%;text-align: center;">
                            <button type="submit" class="btn essence-btn" ><s:message code="label.loginsubmit" text="" /></button>
                            <button type="button" class="btn essence-btn" data-dismiss="modal"><s:message code="label.loginclose" text="" /></button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>             

<!-- User Info Modal -->
<div class="modal fade" id="userInfo" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"><s:message code="label.utitle" text="" /></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <c:forEach var="rows" items="${listUser}">
                    <form action="../login/update.htm" onsubmit="return updateInfoForm();" method="POST">
                        <div>
                            <div class="row">
                                <input type="text" hidden="true" name="txtID" value="${rows.id}">
                                <div class="col-3" style="line-height: 5vh;">
                                    <p></p>
                                    <label><s:message code="label.username" text="" /> </label>
                                </div>
                                <div class="col-9">
                                    <p id="txt_info_usernamename" style="color: red;"></p>
                                    <input type="text" id="info_username" disabled="true" class="form-control" value="${rows.username}">
                                </div>
                                <div class="col-3" style="line-height: 5vh;">
                                    <p></p>
                                    <label><s:message code="label.wishlistname" text="" /> </label>
                                </div>
                                <div class="col-9">
                                    <p id="txt_info_name" style="color: red;"></p>
                                    <input type="text" id="info_name" name="txtName" class="form-control" value="${rows.name}">
                                </div>
                                <div class="col-3" style="line-height: 5vh;">
                                    <p></p>
                                    <label>Email </label>                                    
                                </div>
                                <div class="col-9">
                                    <p id="txt_info_email" style="color: red;"></p>
                                    <input type="email" id="info_email" name="txtEmail" class="form-control" value="${rows.email}">
                                </div>
                                <div class="col-3" style="line-height: 5vh;">
                                    <p></p>
                                    <label><s:message code="label.rimage" text="" /> </label>
                                </div>
                                <div class="col-9">
                                    <p></p>
                                    <div id="text" style="position: absolute;font-size: 20px;">
                                    </div>
                                    <input type="file" src="../img/users-img/${rows.imageuser}" name="txtImage" accept="image/*" style="position: absolute;width: 92%;height: 99%;opacity: 0;cursor:pointer;z-index: 999999999;" onchange="readIMG(this);" onMouseOver="showText('CLICK TO CHANGE IMAGE')" onMouseOut="hide();"/>
                                    <img src="../img/users-img/${rows.imageuser}" id="blah" style="margin-bottom: 2%;">
                                </div>
                                <div class="col-3" style="line-height: 5vh;">
                                    <label><s:message code="label.uphone" text="" /> </label>
                                </div>
                                <div class="col-9">
                                    <input type="text" name="txtPhone" class="form-control" value="${rows.phone}">
                                </div>
                                <div class="col-3" style="line-height: 5vh;">
                                    <label><s:message code="label.raddress" text="" /> </label>
                                </div>
                                <div class="col-9">
                                    <input type="text" name="txtAddress" class="form-control" value="${rows.address}" style="overflow: hidden;text-overflow: ellipsis;">
                                </div>
                            </div>
                            <div>
                                <div style="margin: 1vh 0vh 1vh 0vh;text-align: right">
                                    <label><a href="#" style="font-size: 14px;" data-toggle="modal" data-target="#change_password" data-dismiss="modal"><s:message code="label.uchangepass" text="" /> </a> </label>
                                </div>
                                <div style="margin: 1vh 0vh 1vh 0vh;text-align: right">
                                    <label><a href="../login/logout.htm" style="font-size: 14px;" ><s:message code="label.ulogout" text="" /> </a> </label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div style="width: 100%;text-align: center;">
                                <button type="submit" class="btn essence-btn"><s:message code="label.uupdate" text="" /></button>
                                <button type="button" class="btn essence-btn" data-dismiss="modal"><s:message code="label.loginclose" text="" /></button>
                            </div>
                        </div>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</div>      

<!-- User Register -->
<div class="modal fade" id="user_register" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 2000;">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"><s:message code="label.rtitle" text="" /></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="../login/register.htm" id="registerFormm" onsubmit="return registerForms();" method="post">
                <!-- Modal body -->
                <div class="modal-body">
                    <div>
                        <div class="col-12 mb-3">
                            <label for="username"><s:message code="label.username" text="" /> <span style="color: red">*</span> </label>
                            <p id="txt_register_username" style="color: red;"></p>
                            <input type="text" id="register_username" name="txtUser" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state"><s:message code="label.password" text="" /> <span style="color: red">*</span> </label>
                            <p id="txt_register_password" style="color: red;"></p>
                            <input type="password" id="register_password" name="txtPass" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state"><s:message code="label.rname" text="" /> <span style="color: red">*</span> </label>
                            <p id="txt_register_name" style="color: red;"></p>
                            <input type="text" id="register_name" name="txtName" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Email <span style="color: red">*</span> </label>
                            <p id="txt_register_email" style="color: red"></p>
                            <input type="email" id="register_email" name="txtEmail" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state"><s:message code="label.rimage" text="" /> </label>
                            <input type="file" class="form-control" name="txtImage" accept="image/*" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state"><s:message code="label.rphone" text="" /> </label>
                            <input type="number" id="register_phone" class="form-control" name="txtPhone" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state"><s:message code="label.raddress" text="" /> </label>
                            <input type="text" id="register_address" class="form-control" name="txtAddress" value="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div style="width: 100%;text-align: center;">
                        <button type="submit" class="btn essence-btn" ><s:message code="label.rsubmit" text="" /></button>
                        <button type="button" class="btn essence-btn" data-dismiss="modal"><s:message code="label.loginclose" text="" /></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Forgot password -->
<div class="modal fade" id="forgot_password" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 1999">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"><s:message code="label.fpasstitle" text="" /></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="../login/fogetpass.htm" method="get">
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="col-12 mb-3">
                        <span><s:message code="label.fpasslabel" text="" /></span>
                    </div>
                    <div>
                        <div class="col-12 mb-3">
                            <label><s:message code="label.username" text="" /> </label>
                            <input type="text" name="txtUser" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label><s:message code="label.fpassemail" text="" /> </label>
                            <input type="email" name="txtEmail" class="form-control" value="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div style="width: 100%;text-align: center;">
                        <button type="submit" class="btn essence-btn" ><s:message code="label.cpasswordsend" text="" /></button>
                        <button type="button" class="btn essence-btn" data-dismiss="modal"><s:message code="label.loginclose" text="" /></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Change password -->
<div class="modal fade" id="change_password" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title"><s:message code="label.cpasswordtitle" text="" />.</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="../login/changepass.htm" method="post">
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="col-12 mb-3">
                        <span><s:message code="label.cpasswordlabel" text="" /> !</span>
                    </div>
                    <div>
                        <div class="col-12 mb-3">
                            <label><s:message code="label.username" text="" /> </label>
                            <input type="text" name="txtUser" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label><s:message code="label.cpasswordoldpass" text="" /> </label>
                            <input type="password" name="txtPass" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label><s:message code="label.cpasswordnewpass" text="" /> </label>
                            <input type="password" name="txtNewPass" class="form-control" value="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div style="width: 100%;text-align: center;">
                        <button type="submit" class="btn essence-btn" ><s:message code="label.cpasswordsend" text="" /></button>
                        <button type="button" class="btn essence-btn" data-dismiss="modal"><s:message code="label.loginclose" text="" /></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<c:choose>
    <c:when test="${sessionScope.USER == null}">
        <div class="modal fade" id="wishlistModal" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 1999">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"><s:message code="label.titleloginwishlist" text="" /></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form action="../login/loginIndex.htm" method="post">
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div>
                                <div class="col-12 mb-3">
                                    <label for="city"><s:message code="label.username" text="" /> </label>
                                    <input type="text" name="txtUser" class="form-control" value="">
                                </div>
                                <div class="col-12 mb-3">
                                    <label for="state"><s:message code="label.password" text="" /> </label>
                                    <input type="password" name="txtPass" class="form-control" value="">
                                </div>
                                <div class="col-12 mb-3">
                                    <label for="state"><s:message code="label.register" text="" /> <a href="#" style="font-size: 14px;" data-toggle="modal" data-target="#user_register"><s:message code="label.here" text="" /> </a> </label>
                                    <label for="state" style="float: right;"><a href="#" style="font-size: 14px;" data-toggle="modal" data-target="#forgot_password" data-dismiss="modal"><s:message code="label.forgotpassword" text="" /> ? </a> </label>
                                </div>
                                <div style="width: 100%;text-align: center;">
                                    <button type="submit" class="btn essence-btn" ><s:message code="label.loginsubmit" text="" /></button>
                                    <button type="button" class="btn essence-btn" data-dismiss="modal"><s:message code="label.loginclose" text="" /></button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${sessionScope.WISHLIST_SIZE > 0}">
                <div class="modal fade" id="wishlistModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" style="max-width: 600px;">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title"><s:message code="label.wishlisttitle" text="" /> !</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <form action="#" method="post">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th scope="col"><s:message code="label.wishlistname" text="" /></th>
                                                <th scope="col"><s:message code="label.wishlistbrand" text="" /></th>
                                                <th scope="col"><s:message code="label.wishlistdiscount" text="" /></th>
                                                <th scope="col"><s:message code="label.wishlistprice" text="" /></th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="rows" items="${sessionScope.WISHLIST_LIST}">
                                                <tr>
                                                    <th scope="row"><a href="<s:url value="../product_detail/${rows.productid}.htm"/>">${rows.productname}</a></th>
                                                    <td>${rows.productbrand}</td>
                                                    <td><fmt:formatNumber value="${(rows.productdiscount/rows.productprice)*100}" maxFractionDigits="0"/>%</td>
                                                    <td><fmt:formatNumber type="number" value="${rows.productprice}"/> &#8363</td>
                                                    <td><a href="javascript:void(0)" onclick="$.get('../cartbean/${rows.productid}.htm');
                                                            return location.reload();"><i style="font-size: 140%;" class="fa fa-shopping-cart"></i></a></td>
                                                    <td><a href="javascript:void(0)" onclick="$.get('../wishlist/remove/${rows.id}.htm');return location.reload();"><i style="font-size: 140%;" class="fa fa-trash" aria-hidden="true"></i></a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>

                                    </table>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="modal fade" id="wishlistModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <h4 class="modal-title">Your Wishlist is empty.</h4>
                            </div>

                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${sessionScope.WISHLIST_SIZE > 0}">
        <div class="modal fade" id="history_shipping_status" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 700px;">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"><s:message code="label.historyorderedtitle" text="" /> !</h4>
                        <button onclick="close_filter_table()" type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="#" method="post">
                            <div class="col-12 mb-4">
                                <input style="background: url(../img/core-img/698627-icon-111-search-512.png) no-repeat scroll 5px 2px; padding-left: 41px;" id="myInput" onkeyup="search_filter_table()" placeholder="<s:message code="label.historyorderedsearch" text="" />" type="text" class="form-control" value="">
                            </div>

                            <table class="table table-striped" id="myTable">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col"><s:message code="label.historyorderedtotalprice" text="" /></th>
                                        <th scope="col"><s:message code="label.historyorderedorderdate" text="" /></th>
                                        <th scope="col"><s:message code="label.historyorderedreceiver" text="" /></th>
                                        <th scope="col"><s:message code="label.historyorderedstatus" text="" /></th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <c:forEach var="rows" items="${sessionScope.ORDER_LIST}">
                                    <tbody>
                                        <tr>
                                            <th scope="row">${rows.id}</th>
                                            <td><fmt:formatNumber type="number" value="${rows.total}"/></td>
                                            <td>${rows.orderdate}</td>
                                            <td>${rows.name}</td>
                                            <c:choose>
                                                <c:when test="${rows.paymentstatus == 1}">
                                                    <td style="color: grey;"><i class="fa fa-spinner fa-spin" style="font-size:20px"></i> Processing </td>
                                                </c:when>
                                                <c:when test="${rows.paymentstatus == 2}">
                                                    <td style="color: brown;"><i style="text-decoration: underline;" class="fa fa-motorcycle" aria-hidden="true"></i> Shipper </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td style="color: green;"><i class="fa fa-check" aria-hidden="true"></i> Delivered </td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td>                    
                                                <a href="<s:url value="../orderdetail/${rows.id}.htm"/>"><div class="hoverrr" style="width: 22px;text-align: center;border-radius: 50%;border: 1px solid black;"><i class="fa fa-info"></i></div></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </c:forEach>


                            </table>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="modal fade" id="history_shipping_status" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 700px;">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title"><s:message code="label.historyorderedtitle" text="" /> !</h4>
                        <button onclick="close_filter_table()" type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <s:message code="label.historyorderedsnohistory" text="" />
                    </div>

                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>


<script>
    function search_filter_table() {

        var input, filter, table, tr, td, i, th, td1, td2, td3;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < 9; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            th = tr[i].getElementsByTagName("th")[0];
            td1 = tr[i].getElementsByTagName("td")[1];
            td2 = tr[i].getElementsByTagName("td")[2];
            td3 = tr[i].getElementsByTagName("td")[3];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else if (th) {
                    if (th.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else if (td1) {
                        if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else if (td2) {
                            if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                tr[i].style.display = "";
                            } else if (td3) {
                                if (td3.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                    tr[i].style.display = "";
                                } else {
                                    tr[i].style.display = "none";
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    function close_filter_table() {
        document.getElementById("myInput").value = "";
    }

</script>

<script>
    function readIMG(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                        .attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    function showText(text) {
        document.getElementById("text").innerHTML = text;
    }
    function hide() {
        document.getElementById("text").innerHTML = "";
    }
</script>

<!-- jQuery (Necessary for All JavaScript Plugins) -->
<script src="../js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="../js/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="../js/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="../js/plugins.js"></script>
<!-- Classy Nav js -->
<script src="../js/classy-nav.min.js"></script>
<!-- Active js -->
<script src="../js/active.js"></script>

<script>
    function loginForms() {

        var txtUser = document.forms["loginForm"]["txtUser"].value;

        var txtPass = document.forms["loginForm"]["txtPass"].value;

        if (txtUser === "" || txtPass === "") {

            if (txtUser === "") {
                document.getElementById("txt_username").innerHTML = "Tên tài khoảng không được để trống";
            } else {
                document.getElementById("txt_username").innerHTML = "";
            }
            if (txtPass === "") {
                document.getElementById("txt_password").innerHTML = "Mật khẩu không được để trống";
            } else {
                document.getElementById("txt_password").innerHTML = "";
            }
            return false;
        }

    }
</script>
<script>
    var secondCall = false;
    var secondCall2 = false;
    function registerForms() {
        if (secondCall && secondCall2) {
            return true;
        }
        var txtRegister_username = document.getElementById("register_username").value;
        var txtRegister_password = document.getElementById("register_password").value;
        var txtRegister_name = document.getElementById("register_name").value;
        var txtRegister_email = document.getElementById("register_email").value;


        //username
        if (txtRegister_username === "") {
            document.getElementById("txt_register_username").innerHTML = "Username không được để trống";
        }
        if (txtRegister_username !== "") {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=UTF-8",
                url: "/Essence/validation/users.htm",
                data: $("#register_username").val(),
                success: function (data) {
                    if (data === 'false') {
                        document.getElementById("txt_register_username").innerHTML = "Tài khoản này đã có người sử dụng";
                    } else {
                        document.getElementById("txt_register_username").innerHTML = "";
                        secondCall = true;
                    }
                }
            });
        }
        //password
        if (txtRegister_password === "") {
            document.getElementById("txt_register_password").innerHTML = "Password không được để trống";
        }
        if (txtRegister_password !== "") {
            if (txtRegister_password.length <= 7 || txtRegister_password.length >= 12) {
                document.getElementById("txt_register_password").innerHTML = "Password không được ít hơn 7 ký tự và quá 12 ký tự";
            } else {
                document.getElementById("txt_register_password").innerHTML = "";
            }
        }
        //name
        if (txtRegister_name === "") {
            document.getElementById("txt_register_name").innerHTML = "Tên không được để trống";
        }
        if (txtRegister_name !== "") {
            document.getElementById("txt_register_name").innerHTML = "";
        }
        //email
        if (txtRegister_email === "") {
            document.getElementById("txt_register_email").innerHTML = "Email không được để trống";
        }
        if (txtRegister_email !== "") {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=UTF-8",
                url: "/Essence/validation/emails.htm",
                data: $("#register_email").val(),
                success: function (data) {
                    if (data === 'false') {
                        document.getElementById("txt_register_email").innerHTML = "Email này đã có người sử dụng";
                    } else {
                        document.getElementById("txt_register_email").innerHTML = "";
                        secondCall2 = true;
                    }
                }
            });
        }
        return false;
    }

</script>

<script>
    function updateInfoForm() {
        var txtInfo_name = document.getElementById("info_name").value;
        var txtInfo_email = document.getElementById("info_email").value;

        if (txtInfo_name === "" || txtInfo_email === "") {
            if(txtInfo_name === ""){
                document.getElementById("txt_info_name").innerHTML = "Tên không được để trống";
            }else{
                document.getElementById("txt_info_name").innerHTML = "";
            }
            if(txtInfo_email === ""){
                document.getElementById("txt_info_email").innerHTML = "Email không được để trống";
            }else{
                document.getElementById("txt_info_email").innerHTML = "";
            }
            return false;
        }
    }
</script>

<script>
    function formCheckout(){
        var txtCheckout_name = document.getElementById("checkout_name").value;
        var txtCheckout_address = document.getElementById("checkout_address").value;
        var txtCheckout_phone = document.getElementById("checkout_phone").value;
        var txtCheckout_email = document.getElementById("checkout_email").value;
        
        if(txtCheckout_name === "" || txtCheckout_address === "" || txtCheckout_phone === "" || txtCheckout_email ===""){
            if(txtCheckout_name === ""){
                document.getElementById("txt_checkout_name").innerHTML = "Tên không được để trống";
            }else{
                document.getElementById("txt_checkout_name").innerHTML = "";
            }
            if(txtCheckout_address === ""){
                document.getElementById("txt_checkout_address").innerHTML = "Địa chỉ không được để trống";
            }else{
                document.getElementById("txt_checkout_address").innerHTML = "";
            }
            if(txtCheckout_phone === ""){
                document.getElementById("txt_checkout_phone").innerHTML = "Số điện thoại không được để trống";
            }else{
                document.getElementById("txt_checkout_phone").innerHTML = "";
            }
            if(txtCheckout_email ===""){
                document.getElementById("txt_checkout_email").innerHTML = "Email không được để trống";
            }else{
                document.getElementById("txt_checkout_email").innerHTML = "";
            }
            return false;
        }
    }
</script>