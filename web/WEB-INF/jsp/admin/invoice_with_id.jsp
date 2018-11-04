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

        <title>Pike Admin - Free Bootstrap 4 Admin Template</title>
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
                            <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <i class="fa fa-fw fa-envelope-o"></i><span class="notif-bullet"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-arrow-success dropdown-lg">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5><small><span class="label label-danger pull-xs-right">12</span>Contact Messages</small></h5>
                                </div>

                                <!-- item-->
                                <a href="#" class="dropdown-item notify-item">                                    
                                    <p class="notify-details ml-0">
                                        <b>Jokn Doe</b>
                                        <span>New message received</span>
                                        <small class="text-muted">2 minutes ago</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="#" class="dropdown-item notify-item">                                    
                                    <p class="notify-details ml-0">
                                        <b>Michael Jackson</b>
                                        <span>New message received</span>
                                        <small class="text-muted">15 minutes ago</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="#" class="dropdown-item notify-item">                                    
                                    <p class="notify-details ml-0">
                                        <b>Foxy Johnes</b>
                                        <span>New message received</span>
                                        <small class="text-muted">Yesterday, 13:30</small>
                                    </p>
                                </a>

                                <!-- All-->
                                <a href="#" class="dropdown-item notify-item notify-all">
                                    View All
                                </a>

                            </div>
                        </li>

                        <li class="list-inline-item dropdown notif">
                            <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <i class="fa fa-fw fa-bell-o"></i><span class="notif-bullet"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-arrow dropdown-lg">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5><small><span class="label label-danger pull-xs-right">5</span>Allerts</small></h5>
                                </div>

                                <!-- item-->
                                <a href="#" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-faded">
                                        <img src="../../admin/assets/images/avatars/avatar2.png" alt="img" class="rounded-circle img-fluid">
                                    </div>
                                    <p class="notify-details">
                                        <b>John Doe</b>
                                        <span>User registration</span>
                                        <small class="text-muted">3 minutes ago</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="#" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-faded">
                                        <img src="../../admin/assets/images/avatars/avatar3.png" alt="img" class="rounded-circle img-fluid">
                                    </div>
                                    <p class="notify-details">
                                        <b>Michael Cox</b>
                                        <span>Task 2 completed</span>
                                        <small class="text-muted">12 minutes ago</small>
                                    </p>
                                </a>

                                <!-- item-->
                                <a href="#" class="dropdown-item notify-item">
                                    <div class="notify-icon bg-faded">
                                        <img src="../../admin/assets/images/avatars/avatar4.png" alt="img" class="rounded-circle img-fluid">
                                    </div>
                                    <p class="notify-details">
                                        <b>Michelle Dolores</b>
                                        <span>New job completed</span>
                                        <small class="text-muted">35 minutes ago</small>
                                    </p>
                                </a>

                                <!-- All-->
                                <a href="#" class="dropdown-item notify-item notify-all">
                                    View All Allerts
                                </a>

                            </div>
                        </li>

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
                                <a class="active" href="../../admin/dashboard.htm"><i class="fa fa-fw fa-bars"></i><span> Dashboard </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="../../admin/users.htm"><i class="fa fa-fw fa-users"></i><span> Users </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="../../admin/nav.htm"><i class="fa fa-fw fa-area-chart"></i><span> Navigate Menu </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="../../admin/news.htm"><i class="fa fa-fw fa-area-chart"></i><span> News </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="../../admin/contact.htm"><i class="fa fa-fw fa-area-chart"></i><span> Contact Manage </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-table"></i> <span> Supplier </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="../../admin/supplier.htm">List suppliers</a></li>
                                    <li><a href="../../admin/invoice.htm">List invoice</a></li>
                                </ul>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-table"></i> <span> Tables </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="tables-basic.html">Basic Tables</a></li>
                                    <li><a href="tables-datatable.html">Data Tables</a></li>
                                </ul>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-tv"></i> <span> User Interface </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="ui-alerts.html">Alerts</a></li>
                                    <li><a href="ui-buttons.html">Buttons</a></li>
                                    <li><a href="ui-cards.html">Cards</a></li>
                                    <li><a href="ui-carousel.html">Carousel</a></li>
                                    <li><a href="ui-collapse.html">Collapse</a></li>
                                    <li><a href="ui-icons.html">Icons</a></li>
                                    <li><a href="ui-modals.html">Modals</a></li>
                                    <li><a href="ui-tooltips.html">Tooltips and Popovers</a></li>
                                </ul>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-file-text-o"></i> <span> Forms </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="forms-general.html">General Elements</a></li>
                                    <li><a href="forms-select2.html">Select2</a></li>
                                    <li><a href="forms-validation.html">Form Validation</a></li>
                                    <li><a href="../admin/form.htm">Text Editors</a></li>
                                    <li><a href="forms-upload.html">Multiple File Upload</a></li>
                                    <li><a href="forms-datetime-picker.html">Date and Time Picker</a></li>
                                    <li><a href="forms-color-picker.html">Color Picker</a></li>
                                </ul>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-th"></i> <span> Plugins </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="star-rating.html">Star Rating</a></li>
                                    <li><a href="range-sliders.html">Range Sliders</a></li>
                                    <li><a href="tree-view.html">Tree View</a></li>
                                    <li><a href="sweetalert.html">SweetAlert</a></li>
                                    <li><a href="calendar.html">Calendar</a></li>
                                    <li><a href="gmaps.html">GMaps</a></li>
                                    <li><a href="counter-up.html">Counter-Up</a></li>
                                </ul>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-image"></i> <span> Images and Galleries </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="media-fancybox.html"><span class="label radius-circle bg-danger float-right">cool</span> Fancybox </a></li>								
                                    <li><a href="media-masonry.html">Masonry</a></li>
                                    <li><a href="media-lightbox.html">Lightbox</a></li>
                                    <li><a href="media-owl-carousel.html">Owl Carousel</a></li>
                                    <li><a href="media-image-magnifier.html">Image Magnifier</a></li>

                                </ul>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-copy"></i><span> Example Pages </span></a>
                                <ul class="list-unstyled">								
                                    <li><a href="page-pricing-tables.html">Pricing Tables</a></li>
                                    <li><a target="_blank" href="page-coming-soon.html">Countdown</a></li>								
                                    <li><a href="page-invoice.html">Invoice</a></li>                        
                                    <li><a href="page-login.html">Login / Register</a></li>								
                                    <li><a href="page-blank.html">Blank Page</a></li>
                                </ul>
                            </li>

                            <li class="submenu">
                                <a href="#"><i class="fa fa-fw fa-indent"></i><span> Menu Levels </span></a>
                                <ul>
                                    <li>
                                        <a href="#"><span>Second Level</span></a>
                                    </li>
                                    <li class="submenu">
                                        <a href="#"><span>Third Level</span> <span class="menu-arrow"></span> </a>
                                        <ul style="">
                                            <li><a href="#"><span>Third Level Item</span></a></li>
                                            <li><a href="#"><span>Third Level Item</span></a></li>
                                        </ul>
                                    </li>                                
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
                                        <span class="pull-right"><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_add_invoice"><i class="fa fa-user-plus" aria-hidden="true"></i> Add new invoice</button></span>
                                        <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-labelledby="modal_add_invoice" aria-hidden="true" id="modal_add_invoice">
                                            <div class="modal-dialog">
                                                <div class="modal-content">

                                                    <form action="../../admin/add_invoice.htm" method="post">

                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Edit invoice </h5>
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                        </div>

                                                        <div class="modal-body">          

                                                            <div class="row">

                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Total Price </label>
                                                                        <input class="form-control" name="txtTotalprice" type="number" required value="${rows.total}" />
                                                                        <div style="position: absolute;top: 40px;right: 48px;">&#8363</div>
                                                                        <input type="text" hidden="true" value="${rows.id}" name="txtId"/>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <div class="form-group">
                                                                            <label>Date</label>
                                                                            <div class="input-group date">
                                                                                <input type="text" class="form-control" id="datepicker" placeholder="YYYY-MM-DD" value="${rows.date}" name="txtDate">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Suppliers</label>
                                                                        <select name="txtSupplier" class="form-control" required>
                                                                            <optgroup label="Supplier">
                                                                                <c:forEach var="rowss" items="${listSupplier}">
                                                                                    <c:if test="${supplier_default == rowss.id}">
                                                                                        <option value="${rowss.id}">${rowss.name}</option>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </optgroup>
                                                                        </select>
                                                                    </div>
                                                                </div>	
                                                            </div>

                                                        </div>             

                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Edit</button>
                                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                                        </div>

                                                    </form>	

                                                </div>
                                            </div>
                                        </div> 
                                        <h3><i class="fa fa-user"></i> All invoices (${listInvoice_size} invoices)</h3>								
                                    </div>
                                    <!-- end card-header -->	

                                    <div class="card-body">

                                        <div class="table-responsive">
                                            <table id="user" class="table table-bordered table-hover display" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>Actions</th>
                                                        <td>ID</td>
                                                        <th>Supplier Name</th>
                                                        <th>Total Price</th>
                                                        <th>Invoice Date</th>
                                                        <th>Phone</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="rows" items="${listInvoice}">
                                                        <tr>
                                                            <td></td>
                                                            <td>
                                                                <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_edit_invoice_${rows.id}"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="modal_edit_invoice_${rows.id}">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <form action="../../admin/edit_invoice.htm" method="post">

                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title">Edit invoice </h5>
                                                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                                                </div>

                                                                                <div class="modal-body">          

                                                                                    <div class="row">

                                                                                        <div class="col-lg-12">
                                                                                            <div class="form-group">
                                                                                                <label>Total Price </label>
                                                                                                <input class="form-control" name="txtTotalprice" type="number" required value="${rows.total}" />
                                                                                                <div style="position: absolute;top: 40px;right: 48px;">&#8363</div>
                                                                                                <input type="text" hidden="true" value="${rows.id}" name="txtId"/>
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>

                                                                                    <div class="row">
                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <div class="form-group">
                                                                                                    <label>Date</label>
                                                                                                    <div class="input-group date">
                                                                                                        <input type="text" class="form-control" id="datepicker" placeholder="YYYY-MM-DD" value="${rows.date}" name="txtDate">
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Suppliers</label>
                                                                                                <select name="txtSupplier" class="form-control" required>
                                                                                                    <optgroup label="Change to other">
                                                                                                        <c:forEach var="rowss" items="${listSupplier}">
                                                                                                            <option value="${rowss.id}">${rowss.name}</option>
                                                                                                        </c:forEach>
                                                                                                    </optgroup>
                                                                                                    <c:forEach var="rowss" items="${listSupplier}">
                                                                                                        <c:if test="${rows.name == rowss.name}">
                                                                                                            <optgroup label="Default">
                                                                                                                <option selected value="${rowss.id}">${rowss.name}</option>
                                                                                                            </optgroup>
                                                                                                        </c:if>
                                                                                                    </c:forEach>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>	
                                                                                    </div>

                                                                                </div>             

                                                                                <div class="modal-footer">
                                                                                    <button type="submit" class="btn btn-primary">Edit</button>
                                                                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                                                                </div>

                                                                            </form>

                                                                        </div>
                                                                    </div>
                                                                </div> 

                                                            </td>
                                                            <td>${rows.id}</td>
                                                            <td>
                                                                <strong>${rows.name}</strong><br>
                                                                <small><a href="<s:url value="../../admin/invoice_detail_with_id/${rows.id}.htm"/>">Go to see invoice detail.</a></small>
                                                            </td>
                                                            <td><fmt:formatNumber type="number" value="${rows.total}"/></td>
                                                            <td>${rows.date}</td>
                                                            <td>${rows.phone}</td>

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
