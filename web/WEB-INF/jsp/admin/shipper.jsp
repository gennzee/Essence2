<%-- 
    Document   : user2
    Created on : Oct 31, 2018, 4:33:12 PM
    Author     : tanks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Essence Admin</title>
        <meta name="description" content="Free Bootstrap 4 Admin Theme | Pike Admin">
        <meta name="author" content="Pike Web Development - https://www.pikephp.com">

        <!-- Favicon -->
        <link rel="shortcut icon" href="../admin/assets/images/favicon.ico">

        <!-- Bootstrap CSS -->
        <link href="../admin/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

        <!-- Font Awesome CSS -->
        <link href="../admin/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Custom CSS -->
        <link href="../admin/assets/css/style.css" rel="stylesheet" type="text/css" />		

        <!-- BEGIN CSS for this page -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"/>
        <style>	
            td.details-control {
                background: url('../admin/assets/plugins/datatables/img/details_open.png') no-repeat center center;
                cursor: pointer;
            }
            tr.shown td.details-control {
                background: url('../admin/assets/plugins/datatables/img/details_close.png') no-repeat center center;
            }
        </style>		
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
                                <a href="../admin/dashboard.htm"><i class="fa fa-fw fa-bars"></i><span> Dashboard </span> </a>
                            </li>
                            <c:if test="${sessionScope.ROLE == 'admin'}">
                                <li class="submenu">
                                    <a class="active" href="#"><i class="fa fa-fw fa-users"></i><span> Users </span><span class="menu-arrow"></span> </a>
                                    <ul>
                                        <li class="submenu">
                                            <a href="#"><span>Staffs</span> <span class="menu-arrow"></span> </a>
                                            <ul>
                                                <li><a href="../admin/users.htm"><span>Active Staffs</span></a></li>
                                                <li><a href="../admin/users_inactive.htm"><span>Inactive Staffs</span></a></li>
                                            </ul>
                                        </li>      
                                        <li class="submenu">
                                            <a class="active" href="#"><span>Shipper</span> <span class="menu-arrow"></span> </a>
                                            <ul>
                                                <li class="active"><a href="../admin/shipper.htm"><span>Active Shippers</span></a></li>
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



                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-holder">
                                    <h1 class="main-title float-left">Active Shippers</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Home</li>
                                        <li class="breadcrumb-item">Shippers</li>
                                        <li class="breadcrumb-item active">Active Shippers</li>
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
                                        <span class="pull-right"><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_add_shipper"><i class="fa fa-user-plus" aria-hidden="true"></i> Add new shipper</button></span>
                                        <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-labelledby="modal_add_shipper" aria-hidden="true" id="modal_add_shipper">
                                            <div class="modal-dialog">
                                                <div class="modal-content">

                                                    <form action="../admin/add_shipper.htm" method="post">

                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Add new shipper</h5>
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                        </div>

                                                        <div class="modal-body">          

                                                            <div class="row">

                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Name</label>
                                                                        <input class="form-control" name="txtName" type="text" required value="" />
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Phone</label>
                                                                        <input class="form-control" name="txtPhone" type="number" required value="" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>             

                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Add</button>
                                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                                        </div>

                                                    </form>	

                                                </div>
                                            </div>
                                        </div> 
                                        <h3><i class="fa fa-user"></i> All shippers (${listShipper_size} shippers)</h3>								
                                    </div>
                                    <!-- end card-header -->	

                                    <div class="card-body">

                                        <div class="table-responsive">
                                            <table id="user" class="table table-bordered table-hover display" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>Actions</th>
                                                        <th>ID</th>
                                                        <th style="width: 215px;">Name</th>
                                                        <th>Phone</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="rows" items="${listShipper}">
                                                        <tr>
                                                            <td></td>
                                                            <td>
                                                                <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_edit_shipper_${rows.id}"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="modal_edit_shipper_${rows.id}">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <form action="../admin/edit_shipper.htm" method="post">

                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title">Edit shipper</h5>
                                                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                                                </div>

                                                                                <div class="modal-body">          

                                                                                    <div class="row">

                                                                                        <div class="col-lg-12">
                                                                                            <div class="form-group">
                                                                                                <label>Name</label>
                                                                                                <input type="text" name="txtId" value="${rows.id}" hidden="true"/>
                                                                                                <input class="form-control" name="txtName" type="text" required value="${rows.name}" />
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>

                                                                                    <div class="row">
                                                                                        <div class="col-lg-12">
                                                                                            <div class="form-group">
                                                                                                <label>Phone</label>
                                                                                                <input class="form-control" name="txtPhone" type="number" required value="${rows.phone}" />
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
                                                                <a href="#" data-toggle="modal" data-target="#hide_active_shipper_${rows.id}" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete">
                                                                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                                </a>
                                                                <!-- Delete shipper active modal -->
                                                                <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="hide_active_shipper_${rows.id}">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title">Delete user</h5>
                                                                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                                            </div>
                                                                            <div class="modal-body">          
                                                                                <div class="row">                                                                                    
                                                                                    <div class="col-lg-12">
                                                                                        <div class="form-group">
                                                                                            <label>Are you sure want to delete <b>${rows.name}</b> ?</label>                                                                                            
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>             
                                                                            <div class="modal-footer">
                                                                                <a href="<s:url value="../admin/delete_shipper/${rows.id}.htm"/>" class="btn btn-primary">Yes</a>
                                                                                <button type="button" data-dismiss="modal" class="btn btn-primary">No</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>${rows.id}</td>
                                                            <td style="height: 50px;">${rows.name}</td>
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
        <script src="../admin/assets/js/modernizr.min.js"></script>
        <script src="../admin/assets/js/moment.min.js"></script>
        <script src="../admin/assets/js/popper.min.js"></script>
        <script src="../admin/assets/js/bootstrap.min.js"></script>
        <script src="../admin/assets/js/detect.js"></script>
        <script src="../admin/assets/js/fastclick.js"></script>
        <script src="../admin/assets/js/jquery.blockUI.js"></script>
        <script src="../admin/assets/js/jquery.nicescroll.js"></script>

        <!-- App js -->
        <script src="../admin/assets/js/pikeadmin.js"></script>

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
