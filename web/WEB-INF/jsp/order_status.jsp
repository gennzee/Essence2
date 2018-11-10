<%-- 
    Document   : order_status
    Created on : Oct 28, 2018, 12:38:42 PM
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
        <div class="breadcumb_area breadcumb-style-two bg-img" style="background-image: url(../img/bg-img/breadcumb2.jpg);height: 1000px;">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <c:forEach var="rows" items="${shipper_info}">
                            <c:set var="orderid" value="${rows.orderid}"/>
                            <c:set var="shipper" value="${rows.shippername}"/>
                            <c:set var="payment" value="${rows.paymentstatus}"/>
                        </c:forEach>
                        <div class="page-title text-center" style="height: 10vh;padding-top: 3vh;background-color: #4E7D48;">
                            <h4 style="height: 10vh;color: white;"><s:message code="label.odtitle" text="" /> <b>${orderid}</b></h4>
                        </div>
                        <div>
                            <div class="page-title text-center" style="height: 10vh;padding-top: 3vh;background-color: #98d091;float: left;width: 50%">
                                <b style="height: 10vh;color: #4E7D48;"><s:message code="label.odshipper" text="" /> </b>&nbsp;&nbsp; <b style="color: white;">${shipper}</b>
                            </div>
                            <c:choose>
                                <c:when test="${payment == 1}">
                                    <div class="page-title text-center" style="height: 10vh;padding-top: 3vh;background-color: #98d091;float: left;width: 50%">
                                        <b style="height: 10vh;color: #4E7D48;"><s:message code="label.odstatus" text="" /> </b>&nbsp;&nbsp; <b style="color: white;"><s:message code="label.odstatus1" text="" /></b>
                                    </div>
                                </c:when>
                                <c:when test="${payment == 2}">
                                    <div class="page-title text-center" style="height: 10vh;padding-top: 3vh;background-color: #98d091;float: left;width: 50%">
                                        <b style="height: 10vh;color: #4E7D48;"><s:message code="label.odstatus" text="" /> </b>&nbsp;&nbsp; <b style="color: white;"><s:message code="label.odstatus2" text="" /></b>
                                    </div>
                                </c:when>
                                <c:when test="${payment == 3}">
                                    <div class="page-title text-center" style="height: 10vh;padding-top: 3vh;background-color: #98d091;float: left;width: 50%">
                                        <b style="height: 10vh;color: #4E7D48;"><s:message code="label.odstatus" text="" /> </b>&nbsp;&nbsp; <b style="color: white;"><s:message code="label.odstatus3" text="" /></b>
                                    </div>
                                </c:when>
                                <c:when test="${payment == 4}">
                                    <div class="page-title text-center" style="height: 10vh;padding-top: 3vh;background-color: #98d091;float: left;width: 50%">
                                        <b style="height: 10vh;color: #4E7D48;"><s:message code="label.odstatus" text="" /> </b>&nbsp;&nbsp; <b style="color: white;"><s:message code="label.odstatus4" text="" /></b>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                        <div class="page-title text-center" style="height: 10vh;padding-top: 3vh;background-color: #4E7D48; clear: both;">
                            <h4 style="height: 10vh;color: white;"><s:message code="label.odlistproducts" text="" /> </h4>
                        </div>
                        <div>
                            <c:forEach var="rows" items="${list_order_detail_items}">
                                <div class="page-title text-center" style="height: 10vh;padding-top: 3vh;background-color: #909090;clear: both;">
                                    <b style="height: 10vh;color: white;">${rows.name}</b>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <b style="height: 10vh;color: white;"><s:message code="label.odquantity" text="" /> : ${rows.quantity}</b>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Breadcumb Area End ##### -->






        <!--Footer-->
        <jsp:include page="footer.jsp"/>

    </body>
</html>
