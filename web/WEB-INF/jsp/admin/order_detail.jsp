<%-- 
    Document   : user2
    Created on : Oct 31, 2018, 4:33:12 PM
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Essence Admin</title>
        <meta name="description" content="Free Bootstrap 4 Admin Theme | Pike Admin">
        <meta name="author" content="Pike Web Development - https://www.pikephp.com">

        <!-- Favicon -->
        <link rel="shortcut icon" href="../../admin/assets/images/favicon.ico">

        <!-- Bootstrap CSS -->
        <link href="../../admin/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

        <!-- Font Awesome CSS -->
        <link href="../../admin/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Custom CSS -->
        <link href="../../admin/assets/css/style.css" rel="stylesheet" type="text/css" />		

        <!-- BEGIN CSS for this page -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"/>
        <style>	
            td.details-control {
                background: url('../../admin/assets/plugins/datatables/img/details_open.png') no-repeat center center;
                cursor: pointer;
            }
            tr.shown td.details-control {
                background: url('../../admin/assets/plugins/datatables/img/details_close.png') no-repeat center center;
            }
        </style>		
        <!-- END CSS for this page -->

    </head>
    <body class="adminbody">
        <div id="main">
            <!-- Navigation -->
            <div class="headerbar">

                <!-- LOGO -->
                <div class="headerbar-left">
                    <a href="../../admin/dashboard.htm" class="logo"><img alt="Logo" src="../../admin/assets/images/logo.png" /> <span>Admin</span></a>
                </div>

                <nav class="navbar-custom">

                    <ul class="list-inline float-right mb-0">

                        <li class="list-inline-item dropdown notif">
                            <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <img src="../../img/users-img/${sessionScope.IMGUSER}" alt="Profile image" class="avatar-rounded">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                <c:forEach var="rows" items="${user_items}">
                                    <!-- item-->
                                    <div class="dropdown-item noti-title">
                                        <h5 class="text-overflow"><small>Hello, ${rows.name}</small> </h5>
                                    </div>

                                    <!-- item-->
                                    <a href="pro-profile.html" class="dropdown-item notify-item">
                                        <i class="fa fa-user"></i> <span>Profile</span>
                                    </a>

                                    <!-- item-->
                                    <a href="../../login/logout.htm" class="dropdown-item notify-item">
                                        <i class="fa fa-power-off"></i> <span>Logout</span>
                                    </a>

                                    <!-- item-->
                                    <a target="_blank" href="https://www.pikeadmin.com" class="dropdown-item notify-item">
                                        <i class="fa fa-external-link"></i> <span>Pike Admin</span>
                                    </a>
                                </c:forEach>
                            </div>
                        </li>

                    </ul>

                    <ul class="list-inline menu-left mb-0">
                        <li class="float-left">
                            <button class="button-menu-mobile open-left">
                                <i class="fa fa-fw fa-bars"></i>
                            </button>
                        </li>                        
                    </ul>

                </nav>

            </div>
            <!-- End Navigation -->
            <!-- Left Sidebar -->
            <div class="left main-sidebar">

                <div class="sidebar-inner leftscroll">

                    <div id="sidebar-menu">

                        <ul>

                            <li class="submenu">
                                <a href="../../admin/dashboard.htm"><i class="fa fa-fw fa-bars"></i><span> Dashboard </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-users"></i><span> Users </span><span class="menu-arrow"></span> </a>
                                <ul>
                                    <li class="submenu">
                                        <a href="#"><span>Staffs</span> <span class="menu-arrow"></span> </a>
                                        <ul>
                                            <li><a href="../../admin/users.htm"><span>Active Staffs</span></a></li>
                                            <li><a href="../../admin/users_inactive.htm"><span>Inactive Staffs</span></a></li>
                                        </ul>
                                    </li>      
                                    <li class="submenu">
                                        <a href="#"><span>Shipper</span> <span class="menu-arrow"></span> </a>
                                        <ul>
                                            <li><a href="#"><span>Active Shippers</span></a></li>
                                            <li><a href="#"><span>Inactive Shippers</span></a></li>
                                        </ul>
                                    </li>  
                                </ul>

                            </li>

                            <li class="submenu">
                                <a href="../../admin/nav.htm"><i class="fa fa-fw fa-indent"></i><span> Navigate Menu </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="../../admin/news.htm"><i class="fa fa-fw fa-newspaper-o"></i><span> Collections </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="../../admin/contact.htm"><i class="fa fa-fw fa-address-card-o"></i><span> Contact Manage </span> </a>
                            </li>

                            <li class="submenu">
                                <a class="active" href="#"><i class="fa fa-fw fa-cubes"></i> <span> Order Handler </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="../../admin/search_order.htm">Search Order</a></li>
                                    <li><a href="../../admin/order_is_processing.htm">Processing</a></li>
                                    <li><a href="../../admin/order_is_Delivering.htm">Delivering</a></li>
                                </ul>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-paperclip"></i> <span> Supplier </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="../../admin/supplier.htm">List suppliers</a></li>
                                    <li><a href="../../admin/invoice.htm">List invoices</a></li>
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



                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-holder">
                                    <h1 class="main-title float-left">Data Tables</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Home</li>
                                        <li class="breadcrumb-item active">Data Tables</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->





                        <div class="row">


                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6" style="flex: 0 0 100%;max-width: 100%;">						
                                <div class="card mb-3">
                                    <div class="card-header">   
                                        <span class="pull-right"><a href="javascript:void(0)" onclick="window.history.back();" class="btn btn-primary btn-sm"><i class="fa fa-arrow-left" aria-hidden="true"></i>&nbsp;Back</a></span>
                                        <h3><i class="fa fa-user"></i> OrderID ( ${orderid} )</h3>		

                                    </div>
                                    <!-- end card-header -->	

                                    <div class="card-body">

                                        <div class="table-responsive">
                                            <table id="user" class="table table-bordered table-hover display" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th></th>                                                        
                                                        <td>Product ID</td>
                                                        <th>Product Name</th>
                                                        <th>Product price</th>
                                                        <th>Discount</th>
                                                        <th>Quantity</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="rows" items="${listOrder_detail}">
                                                        <tr>
                                                            <td></td>                                                            
                                                            <td>${rows.id}</td>
                                                            <td>
                                                                <strong>${rows.name}</strong><br>
                                                            </td>
                                                            <td><fmt:formatNumber type="number" value="${rows.price}"/></td>
                                                            <td><fmt:formatNumber type="number" value="${rows.discount}"/></td>
                                                            <td>${rows.quantity}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

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
        <!-- dataTable child row -->
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <!-- dataTable child row -->
        <script src="../../admin/assets/js/modernizr.min.js"></script>
        <script src="../../admin/assets/js/moment.min.js"></script>
        <script src="../../admin/assets/js/popper.min.js"></script>
        <script src="../../admin/assets/js/bootstrap.min.js"></script>
        <script src="../../admin/assets/js/detect.js"></script>
        <script src="../../admin/assets/js/fastclick.js"></script>
        <script src="../../admin/assets/js/jquery.blockUI.js"></script>
        <script src="../../admin/assets/js/jquery.nicescroll.js"></script>

        <!-- App js -->
        <script src="../../admin/assets/js/pikeadmin.js"></script>

        <!-- dataTable child row -->
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $('#user').DataTable({
                                                    responsive: {
                                                        details: {
                                                            type: 'column',
                                                            target: 'tr'
                                                        }
                                                    },
                                                    columnDefs: [{
                                                            className: 'control',
                                                            orderable: false,
                                                            targets: 0
                                                        }],
                                                    order: [1, 'asc']
                                                });
                                            });
        </script>	
        <!-- dataTable child row -->


    </body>
</html>
