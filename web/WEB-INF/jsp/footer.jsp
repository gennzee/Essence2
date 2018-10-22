<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <li><a href="shop.html">Shop</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="contact.html">Contact</a></li>
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
                <h4 class="modal-title">Login</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="../login/loginIndex.htm" method="post">
                <!-- Modal body -->
                <div class="modal-body">
                    <div>
                        <div class="col-12 mb-3">
                            <label for="city">Username </label>
                            <input type="text" name="txtUser" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Password </label>
                            <input type="password" name="txtPass" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Đăng ký tài khoản <a href="#" style="font-size: 14px;" data-toggle="modal" data-target="#user_register">tại đây </a> </label>
                            <label for="state" style="float: right;"><a href="#" style="font-size: 14px;" data-toggle="modal" data-target="#forgot_password" data-dismiss="modal">Quên mật khẩu ? </a> </label>
                        </div>
                        <div style="width: 100%;text-align: center;">
                            <button type="submit" class="btn essence-btn" >Submit</button>
                            <button type="button" class="btn essence-btn" data-dismiss="modal">Close</button>
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
                <h4 class="modal-title">User Info</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <c:forEach var="rows" items="${listUser}">
                    <form action="../login/update.htm" method="POST">
                        <div>
                            <div class="row">
                                <input type="text" hidden="true" name="txtID" value="${rows.id}">
                                <div class="col-3" style="line-height: 5vh;">
                                    <label>Username </label>
                                </div>
                                <div class="col-9">
                                    <input type="text" disabled="true" class="form-control" value="${rows.username}">
                                </div>
                                <div class="col-3" style="line-height: 5vh;">
                                    <label>Name </label>
                                </div>
                                <div class="col-9">
                                    <input type="text" name="txtName" class="form-control" value="${rows.name}">
                                </div>
                                <div class="col-3" style="line-height: 5vh;">
                                    <label>Email </label>
                                </div>
                                <div class="col-9">
                                    <input type="email" name="txtEmail" class="form-control" value="${rows.email}">
                                </div>
                                <div class="col-3" style="line-height: 5vh;">
                                    <label>Image </label>
                                </div>
                                <div class="col-9">
                                    <div id="text" style="position: absolute;font-size: 20px;">
                                    </div>
                                    <input type="file" src="../img/users-img/${rows.imageuser}" name="txtImage" style="position: absolute;width: 92%;height: 99%;opacity: 0;cursor:pointer;z-index: 999999999;" onchange="readIMG(this);" onMouseOver="showText('CLICK TO CHANGE IMAGE')" onMouseOut="hide();"/>
                                    <img src="../img/users-img/${rows.imageuser}" id="blah" style="margin-bottom: 2%;">
                                </div>
                                <div class="col-3" style="line-height: 5vh;">
                                    <label>Phone </label>
                                </div>
                                <div class="col-9">
                                    <input type="text" name="txtPhone" class="form-control" value="${rows.phone}">
                                </div>
                                <div class="col-3" style="line-height: 5vh;">
                                    <label>Address </label>
                                </div>
                                <div class="col-9">
                                    <input type="text" name="txtAddress" class="form-control" value="${rows.address}" style="overflow: hidden;text-overflow: ellipsis;">
                                </div>
                            </div>
                            <div>
                                <div style="margin: 1vh 0vh 1vh 0vh;text-align: right">
                                    <label><a href="#" style="font-size: 14px;" data-toggle="modal" data-target="#change_password" data-dismiss="modal">Đổi mật khẩu ? </a> </label>
                                </div>
                                <div style="margin: 1vh 0vh 1vh 0vh;text-align: right">
                                    <label><a href="../login/logout.htm" style="font-size: 14px;" >Đăng xuất. </a> </label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div style="width: 100%;text-align: center;">
                                <button type="submit" class="btn essence-btn">Cập nhật</button>
                                <button type="button" class="btn essence-btn" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
</div>      

<!-- User Register -->
<div class="modal fade" id="user_register" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Register</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="../login/register.htm" method="post">
                <!-- Modal body -->
                <div class="modal-body">
                    <div>
                        <div class="col-12 mb-3">
                            <label for="username">Username </label>
                            <input type="text" name="txtUser" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Password </label>
                            <input type="password" name="txtPass" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Email </label>
                            <input type="email" name="txtEmail" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Name </label>
                            <input type="text" name="txtName" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Image </label>
                            <input type="file" class="form-control" name="txtImage" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Phone Number </label>
                            <input type="text" class="form-control" name="txtPhone" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Address </label>
                            <input type="text" class="form-control" name="txtAddress" value="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div style="width: 100%;text-align: center;">
                        <button type="submit" class="btn essence-btn" >Submit</button>
                        <button type="button" class="btn essence-btn" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Forgot password -->
<div class="modal fade" id="forgot_password" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Forgot password ?</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="../login/fogetpass.htm" method="get">
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="col-12 mb-3">
                        <span>We will send you a new password.</span>
                    </div>
                    <div>
                        <div class="col-12 mb-3">
                            <label>Username </label>
                            <input type="text" name="txtUser" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label>Email </label>
                            <input type="email" name="txtEmail" class="form-control" value="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div style="width: 100%;text-align: center;">
                        <button type="submit" class="btn essence-btn" >Send</button>
                        <button type="button" class="btn essence-btn" data-dismiss="modal">Close</button>
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
                <h4 class="modal-title">Change Password.</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="../login/changepass.htm" method="post">
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="col-12 mb-3">
                        <span>You will be able to use your new <b>Password</b> to <b>login</b> in the next time !</span>
                    </div>
                    <div>
                        <div class="col-12 mb-3">
                            <label>Username </label>
                            <input type="text" name="txtUser" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label>Old Password </label>
                            <input type="password" name="txtPass" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label>New Password </label>
                            <input type="password" name="txtNewPass" class="form-control" value="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div style="width: 100%;text-align: center;">
                        <button type="submit" class="btn essence-btn" >Send</button>
                        <button type="button" class="btn essence-btn" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

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