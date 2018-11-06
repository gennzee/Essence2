<%-- 
    Document   : checkout_success
    Created on : Nov 6, 2018, 11:50:21 AM
    Author     : Genn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
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

        <div class="checkout_area section-padding-80">
            <div class="container">
                <div class="row">
                    <div style="width: 100%;text-align: center;">
                    <h1>Thanks !</h1>
                    </div>
                </div>
            </div>
        </div>

        <!--Footer-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>
