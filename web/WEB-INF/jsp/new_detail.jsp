<%-- 
    Document   : newjsp
    Created on : Oct 26, 2018, 3:46:43 PM
    Author     : tanks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
        <style>
            .ellipsis{
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 4; /* number of lines to show */
                -webkit-box-orient: vertical;
            }
        </style>
    </head>
    <body>
        <!--header-->
        <jsp:include page="header.jsp"/>
        <!--cart-->
        <jsp:include page="nav_right_side.jsp"/>
        <!-- ##### Blog Wrapper Area Start ##### -->
        <div class="single-blog-wrapper">

            <!-- Single Blog Post Thumb -->
            <div class="single-blog-post-thumb">
                <img src="../img/bg-img/bg-7.jpg" alt="">
            </div>

            <!-- Single Blog Content Wrap -->
            <div class="single-blog-content-wrapper d-flex">
                <c:forEach var="rows" items="${news_item}">
                    <!-- Blog Content -->
                    <div class="single-blog--text">
                        <h2>${rows.title}</h2>
                        ${rows.content}
                    </div>
                </c:forEach>
                <!-- Related Blog Post -->
                <div class="related-blog-post">
                    <!-- Single Related Blog Post -->
                    <c:forEach var="rows" items="${listNews}">
                        <div class="single-related-blog-post">
                            <img src="../img/bg-img/${rows.imagetitle}" alt="">

                            <a href="<s:url value="../news/${rows.id}.htm"/>">
                                <div class="ellipsis">
                                    <h5>${rows.title}</h5>
                                </div>
                            </a>

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
