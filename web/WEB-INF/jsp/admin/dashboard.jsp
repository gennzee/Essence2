<%-- 
    Document   : dashboard
    Created on : Oct 29, 2018, 2:49:01 PM
    Author     : tanks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

        <title>Essence Admin</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../admin/assets/images/favicon.ico">

        <!-- Bootstrap CSS -->
        <link href="../admin/assets/css/bootstrap.min.css" rel="stylesheet"/>

        <!-- Font Awesome CSS -->
        <link href="../admin/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>

        <!-- Custom CSS -->
        <link href="../admin/assets/css/style.css" rel="stylesheet"/>

        <!-- BEGIN CSS for this page -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
        <!-- END CSS for this page -->

    </head>
    <body class="adminbody">
        <div id="main">
            <jsp:include page="part/navigationbar.jsp"/>
            <!-- Left Sidebar -->
            <div class="left main-sidebar">

                <div class="sidebar-inner leftscroll">

                    <div id="sidebar-menu">

                        <ul>

                            <li class="submenu">
                                <a class="active" href="../admin/dashboard.htm"><i class="fa fa-fw fa-bars"></i><span> Dashboard </span> </a>
                            </li>
                            <c:if test="${sessionScope.ROLE == 'admin'}">
                                <li class="submenu">
                                    <a href="#"><i class="fa fa-fw fa-users"></i><span> Users </span><span class="menu-arrow"></span> </a>
                                    <ul>
                                        <li class="submenu">
                                            <a href="#"><span>Staffs</span> <span class="menu-arrow"></span> </a>
                                            <ul>
                                                <li><a href="../admin/users.htm"><span>Active Staffs</span></a></li>
                                                <li><a href="../admin/users_inactive.htm"><span>Inactive Staffs</span></a></li>
                                            </ul>
                                        </li>      
                                        <li class="submenu">
                                            <a href="#"><span>Shipper</span> <span class="menu-arrow"></span> </a>
                                            <ul>
                                                <li><a href="../admin/shipper.htm"><span>Active Shippers</span></a></li>
                                                <li><a href="../admin/shipper_inactive.htm"><span>Inactive Shippers</span></a></li>
                                            </ul>
                                        </li>  
                                    </ul>

                                </li>
                            </c:if>

                            <li class="submenu">
                                <a href="../admin/nav.htm"><i class="fa fa-fw fa-indent"></i><span> Navigate Menu </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="../admin/news.htm"><i class="fa fa-fw fa-newspaper-o"></i><span> Collections </span> </a>
                            </li>
                            <c:if test="${sessionScope.ROLE == 'admin'}">
                                <li class="submenu">
                                    <a href="../admin/contact.htm"><i class="fa fa-fw fa-address-card-o"></i><span> Contact Manage </span> </a>
                                </li>
                            </c:if>
                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-cubes"></i> <span> Order Handler </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="../admin/search_order.htm">Search Order</a></li>
                                    <li><a href="../admin/order_is_processing.htm">Processing</a></li>
                                    <li><a href="../admin/order_is_Delivering.htm">Delivering</a></li>
                                </ul>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-paperclip"></i> <span> Supplier </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="../admin/supplier.htm">List suppliers</a></li>
                                    <li><a href="../admin/invoice.htm">List invoices</a></li>
                                </ul>
                            </li>



                        </ul>

                        <div class="clearfix"></div>

                    </div>

                    <div class="clearfix"></div>

                </div>

            </div>
            <!-- End Sidebar -->

            <div class="content-page">

                <!-- Start content -->
                <div class="content">

                    <div class="container-fluid">
                        <c:choose>
                            <c:when test="${sessionScope.ROLE == 'admin'}">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="breadcrumb-holder">
                                            <h1 class="main-title float-left">Dashboard</h1>
                                            <ol class="breadcrumb float-right">
                                                <li class="breadcrumb-item">Home</li>
                                                <li class="breadcrumb-item active">Dashboard</li>
                                            </ol>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end row -->


                                <div class="row">
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div class="card-box noradius noborder bg-default">
                                            <i class="fa fa-file-text-o float-right text-white"></i>
                                            <h6 class="text-white text-uppercase m-b-20"><a href="#" style="color:white;">Orders</a></h6>
                                            <h1 class="m-b-20 text-white counter">${orders_in_this_month}</h1>
                                            <span class="text-white">In this month</span>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div class="card-box noradius noborder bg-warning">
                                            <i class="fa fa-bar-chart float-right text-white"></i>
                                            <h6 class="text-white text-uppercase m-b-20">Collections</h6>
                                            <h1 class="m-b-20 text-white counter">${collections_in_this_month}</h1>
                                            <span class="text-white">In this month</span>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div class="card-box noradius noborder bg-info">
                                            <i class="fa fa-user-o float-right text-white"></i>
                                            <h6 class="text-white text-uppercase m-b-20">Customers</h6>
                                            <h1 class="m-b-20 text-white counter">${customers_created_in_this_month}</h1>
                                            <span class="text-white">In this month</span>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div class="card-box noradius noborder bg-danger">
                                            <i class="fa fa-bell-o float-right text-white"></i>
                                            <h6 class="text-white text-uppercase m-b-20">Orders Canceled</h6>
                                            <h1 class="m-b-20 text-white counter">${orders_canceled_in_this_month}</h1>
                                            <span class="text-white">In this month</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3" style="flex: 0 0 50%;max-width: 50%;">
                                        <div class="card-box noradius noborder bg-success">
                                            <i class="fa fa-check-circle float-right text-white"></i>
                                            <h6 class="text-white text-uppercase m-b-20">Orders Delivered</h6>
                                            <h1 class="m-b-20 text-white counter">${orders_delivered_in_this_month}</h1>
                                            <span class="text-white">In this month</span>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3" style="flex: 0 0 50%;max-width: 50%;">
                                        <div class="card-box noradius noborder bg-purple">
                                            <i class="fa fa-money float-right text-white"></i>
                                            <h6 class="text-white text-uppercase m-b-20">Revenue (&#8363)</h6>
                                            <h1 class="m-b-20 text-white counter"><fmt:formatNumber type="number" value="${sum_revenue_in_month}"/></h1>
                                            <span class="text-white">In this month</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div style="border: 2px solid #1bb99a;margin-bottom: 5%;">
                                            <div class="card-box noradius noborder bg-transparent">
                                                <i class="fa fa-check-circle float-right text-success"></i>
                                                <h6 class="text-success text-uppercase m-b-20">Orders</h6>
                                                <h1 class="m-b-20 text-success counter">${orders_in_today}</h1>
                                                <span class="text-success">Today</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div style="border: 2px solid #ff5d48;margin-bottom: 5%;">
                                            <div class="card-box noradius noborder bg-transparent">
                                                <i class="fa fa-bell-o float-right text-danger"></i>
                                                <h6 class="text-danger text-uppercase m-b-20">Orders Pending</h6>
                                                <h1 class="m-b-20 text-danger counter">${orders_pending_in_today}</h1>
                                                <span class="text-danger">Today</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div style="border: 2px solid #1bb99a;margin-bottom: 5%;">
                                            <div class="card-box noradius noborder bg-transparent">
                                                <i class="fa fa-spinner fa-spin float-right text-success"></i>
                                                <h6 class="text-success text-uppercase m-b-20">Orders Delivering</h6>
                                                <h1 class="m-b-20 text-success counter">${orders_delivering_in_today}</h1>
                                                <span class="text-success">Today</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div style="border: 2px solid #ff5d48;margin-bottom: 5%;">
                                            <div class="card-box noradius noborder bg-transparent">
                                                <i class="fa fa-times float-right text-danger"></i>
                                                <h6 class="text-danger text-uppercase m-b-20">Orders Canceled</h6>
                                                <h1 class="m-b-20 text-danger counter">${orders_canceled_in_today}</h1>
                                                <span class="text-danger">Today</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:when>
                            <c:when test="${sessionScope.ROLE == 'nhanvien'}">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <div class="breadcrumb-holder">
                                            <h1 class="main-title float-left">Dashboard</h1>
                                            <ol class="breadcrumb float-right">
                                                <li class="breadcrumb-item">Home</li>
                                                <li class="breadcrumb-item active">Dashboard</li>
                                            </ol>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div style="border: 2px solid #1bb99a;margin-bottom: 5%;">
                                            <div class="card-box noradius noborder bg-transparent">
                                                <i class="fa fa-check-circle float-right text-success"></i>
                                                <h6 class="text-success text-uppercase m-b-20">Orders</h6>
                                                <h1 class="m-b-20 text-success counter">${orders_in_today}</h1>
                                                <span class="text-success">Today</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div style="border: 2px solid #ff5d48;margin-bottom: 5%;">
                                            <div class="card-box noradius noborder bg-transparent">
                                                <i class="fa fa-bell-o float-right text-danger"></i>
                                                <h6 class="text-danger text-uppercase m-b-20">Orders Pending</h6>
                                                <h1 class="m-b-20 text-danger counter">${orders_pending_in_today}</h1>
                                                <span class="text-danger">Today</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div style="border: 2px solid #1bb99a;margin-bottom: 5%;">
                                            <div class="card-box noradius noborder bg-transparent">
                                                <i class="fa fa-spinner fa-spin float-right text-success"></i>
                                                <h6 class="text-success text-uppercase m-b-20">Orders Delivering</h6>
                                                <h1 class="m-b-20 text-success counter">${orders_delivering_in_today}</h1>
                                                <span class="text-success">Today</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                        <div style="border: 2px solid #ff5d48;margin-bottom: 5%;">
                                            <div class="card-box noradius noborder bg-transparent">
                                                <i class="fa fa-times float-right text-danger"></i>
                                                <h6 class="text-danger text-uppercase m-b-20">Orders Canceled</h6>
                                                <h1 class="m-b-20 text-danger counter">${orders_canceled_in_today}</h1>
                                                <span class="text-danger">Today</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                        <!-- end row -->



                        <div class="row">

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-6">						
                                <div class="card mb-3">
                                    <div class="card-header text-white bg-success">
                                        <h3><i class="fa fa-users"></i> Orders Delivering</h3>
                                    </div>

                                    <div class="card-body">

                                        <table id="example1" class="table table-bordered table-responsive-xl table-hover display">
                                            <thead>
                                                <tr>                                                    
                                                    <th></th>
                                                    <th>ID</th>
                                                    <th>Shipper Name</th>
                                                    <th>Shipper Phone</th>
                                                </tr>
                                            </thead>													
                                            <tbody>
                                                <c:forEach var="rows" items="${listOrder_delivering}">
                                                    <tr>                                                        
                                                        <td></td>
                                                        <td>${rows.id}</td>
                                                        <td>${rows.shippername}</td>
                                                        <td>${rows.shipperphone}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>														
                                </div><!-- end card-->					
                            </div>












                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-6">						
                                <div class="card mb-3">
                                    <div class="card-header text-white bg-danger">
                                        <h3><i class="fa fa-bell-o"></i> Orders Pending</h3>
                                    </div>

                                    <div class="card-body">

                                        <table id="example2" class="table table-bordered table-responsive-xl table-hover display">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>ID</th>
                                                    <th>Total Price</th>
                                                    <th>Receiver</th>
                                                    <th>Receiver Phone</th>
                                                </tr>
                                            </thead>													
                                            <tbody>
                                                <c:forEach var="rows" items="${listOrder_processing}">
                                                    <tr>
                                                        <td></td>
                                                        <td>${rows.id}</td>
                                                        <td>${rows.total}</td>
                                                        <td>${rows.name}</td>
                                                        <td>${rows.phone}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>														
                                </div><!-- end card-->					
                            </div>





                        </div>			



                    </div>
                    <!-- END container-fluid -->

                </div>
                <!-- END content -->

            </div>
            <!-- END content-page -->
            <jsp:include page="part/footer.jsp"/>
        </div>






        <script src="../admin/assets/js/modernizr.min.js"></script>
        <script src="../admin/assets/js/jquery.min.js"></script>
        <script src="../admin/assets/js/moment.min.js"></script>

        <script src="../admin/assets/js/popper.min.js"></script>
        <script src="../admin/assets/js/bootstrap.min.js"></script>

        <script src="../admin/assets/js/detect.js"></script>
        <script src="../admin/assets/js/fastclick.js"></script>
        <script src="../admin/assets/js/jquery.blockUI.js"></script>
        <script src="../admin/assets/js/jquery.nicescroll.js"></script>

        <!-- App js -->
        <script src="../admin/assets/js/pikeadmin.js"></script>

        <!-- BEGIN Java Script for this page -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

        <!-- Counter-Up-->
        <script src="../admin/assets/plugins/waypoints/lib/jquery.waypoints.min.js"></script>
        <script src="../admin/assets/plugins/counterup/jquery.counterup.min.js"></script>			

        <script>
            $(document).ready(function () {
                // data-tables
                $('#example1').DataTable();
                $('#example2').DataTable();

                // counter-up
                $('.counter').counterUp({
                    delay: 10,
                    time: 600
                });
            });
        </script>

        <!-- END Java Script for this page -->
    </body>
</html>
