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
        <style>
            .ellipsis{
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 2; /* number of lines to show */
                -webkit-box-orient: vertical;
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
        <div class="breadcumb_area breadcumb-style-two bg-img" style="background-image: url(../img/bg-img/breadcumb2.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <div class="page-title text-center">
                            <h2>Collections</h2>
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
                    <c:forEach var="rows" items="${listNews}">
                        <!-- Single Blog Area -->
                        <div class="col-12 col-lg-6">
                            <div class="single-blog-area mb-50">
                                <img src="../img/bg-img/${rows.imagetitle}" alt="">
                                <!-- Post Title -->
                                <div class="post-title">
                                    <div class="ellipsis">
                                        <a href="#">${rows.title}</a>
                                    </div>
                                </div>
                                <!-- Hover Content -->
                                <div class="hover-content">
                                    <!-- Post Title -->
                                    <div class="hover-post-title">
                                        <a href="#" class="text-truncate">${rows.title}</a>
                                    </div>
                                    <div style="max-height: 50%;overflow: hidden;">
                                        ${rows.content}
                                    </div>
                                        <a href="<s:url value="../news/${rows.id}.htm"/>">Continue reading <i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
        <!-- ##### Blog Wrapper Area End ##### -->


        <!--Footer-->
        <jsp:include page="footer.jsp"/>

    </body>
</html>
