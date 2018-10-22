<%-- 
    Document   : news
    Created on : Oct 11, 2018, 8:45:01 PM
    Author     : tanks
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
        <!--header-->
        <jsp:include page="header.jsp"/>
        <div class="container" style="max-width: 100%;padding: 0;">
            <div class="alert alert-danger alert-dismissible" style="margin: 0;text-align: center;">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Chưa làm</strong> <strong>${uri}</strong> 
            </div>
        </div>
        <!--cart-->
        <jsp:include page="nav_right_side.jsp"/>
        <!-- ##### Breadcumb Area Start ##### -->
        <div class="breadcumb_area breadcumb-style-two bg-img" style="background-image: url(../img/bg-img/breadcumb2.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <div class="page-title text-center">
                            <h2>News</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Breadcumb Area End ##### -->

        <!-- ##### Blog Wrapper Area Start ##### -->
        <div class="blog-wrapper section-padding-80">
            <div class="container">
                <div class="row">

                    <!-- Single Blog Area -->
                    <div class="col-12 col-lg-6">
                        <div class="single-blog-area mb-50">
                            <img src="../img/bg-img/blog1.jpg" alt="">
                            <!-- Post Title -->
                            <div class="post-title">
                                <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                            </div>
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <!-- Post Title -->
                                <div class="hover-post-title">
                                    <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce enim nulla, mollis eu metus in, sagittis fringilla tortor. Phasellus purus dignissim convallis.</p>
                                <a href="#">Continue reading <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Single Blog Area -->
                    <div class="col-12 col-lg-6">
                        <div class="single-blog-area mb-50">
                            <img src="../img/bg-img/blog2.jpg" alt="">
                            <!-- Post Title -->
                            <div class="post-title">
                                <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                            </div>
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <!-- Post Title -->
                                <div class="hover-post-title">
                                    <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce enim nulla, mollis eu metus in, sagittis fringilla tortor. Phasellus purus dignissim convallis.</p>
                                <a href="#">Continue reading <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Single Blog Area -->
                    <div class="col-12 col-lg-6">
                        <div class="single-blog-area mb-50">
                            <img src="../img/bg-img/blog3.jpg" alt="">
                            <!-- Post Title -->
                            <div class="post-title">
                                <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                            </div>
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <!-- Post Title -->
                                <div class="hover-post-title">
                                    <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce enim nulla, mollis eu metus in, sagittis fringilla tortor. Phasellus purus dignissim convallis.</p>
                                <a href="#">Continue reading <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Single Blog Area -->
                    <div class="col-12 col-lg-6">
                        <div class="single-blog-area mb-50">
                            <img src="../img/bg-img/blog4.jpg" alt="">
                            <!-- Post Title -->
                            <div class="post-title">
                                <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                            </div>
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <!-- Post Title -->
                                <div class="hover-post-title">
                                    <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce enim nulla, mollis eu metus in, sagittis fringilla tortor. Phasellus purus dignissim convallis.</p>
                                <a href="#">Continue reading <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Single Blog Area -->
                    <div class="col-12 col-lg-6">
                        <div class="single-blog-area mb-50">
                            <img src="../img/bg-img/blog5.jpg" alt="">
                            <!-- Post Title -->
                            <div class="post-title">
                                <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                            </div>
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <!-- Post Title -->
                                <div class="hover-post-title">
                                    <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce enim nulla, mollis eu metus in, sagittis fringilla tortor. Phasellus purus dignissim convallis.</p>
                                <a href="#">Continue reading <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Single Blog Area -->
                    <div class="col-12 col-lg-6">
                        <div class="single-blog-area mb-50">
                            <img src="../img/bg-img/blog6.jpg" alt="">
                            <!-- Post Title -->
                            <div class="post-title">
                                <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                            </div>
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <!-- Post Title -->
                                <div class="hover-post-title">
                                    <a href="#">Vivamus sed nunc in arcu cursus mollis quis et orci. Interdum et malesuada</a>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce enim nulla, mollis eu metus in, sagittis fringilla tortor. Phasellus purus dignissim convallis.</p>
                                <a href="#">Continue reading <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Blog Wrapper Area End ##### -->


        <!--Footer-->
        <jsp:include page="footer.jsp"/>

    </body>
</html>
