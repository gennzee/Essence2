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

        <title>Pike Admin - Free Bootstrap 4 Admin Template</title>
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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css"/>
        <style>	
            td.details-control {
                background: url('../admin/assets/plugins/datatables/img/details_open.png') no-repeat center center;
                cursor: pointer;
            }
            tr.shown td.details-control {
                background: url('../admin/assets/plugins/datatables/img/details_close.png') no-repeat center center;
            }
        </style>		
        <style>
            .ellipsis{
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 2; /* number of lines to show */
                -webkit-box-orient: vertical;
            }
        </style>
        <!-- END CSS for this page -->

    </head>
    <body class="adminbody">
        <div id="main">
            <jsp:include page="part/navigationbar.jsp"/>
            <jsp:include page="part/leftsidebar.jsp"/>

            <div class="content-page">

                <!-- Start content -->
                <div class="content">

                    <div class="container-fluid">


                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-holder">
                                    <h1 class="main-title float-left">Articles</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Home</li>
                                        <li class="breadcrumb-item active">Articles</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->



                        <div class="row">

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">						

                                <div class="card mb-3">

                                    <div class="card-header">
                                        <span class="pull-right"><a href="../admin/news_add.htm" class="btn btn-primary btn-sm"><i class="fa fa-plus" aria-hidden="true"></i> Add new article</a></span>
                                        <h3><i class="fa fa-file-text-o"></i> All articles (${listNews_size} articles)</h3>								
                                    </div>
                                    <!-- end card-header -->	

                                    <div class="card-body">

                                        <div class="table-responsive">	
                                            <table id="newss" class="table table-bordered table-hover display" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>Actions</th>
                                                        <th>Article details</th>
                                                        <th>ID</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="rows" items="${listNews}">
                                                        <tr >
                                                            <td></td>
                                                            <td>
                                                                <a href="#" class="btn btn-primary btn-sm" data-placement="top" data-toggle="tooltip" data-title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>								
                                                                <a href="#" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                            </td>
                                                            <td>
                                                                <span style="float: left; margin-right:10px;"><img alt="image" style="max-width:140px; height:auto;" src="../img/bg-img/${rows.imagetitle}" /></span>
                                                                <h5> ${rows.title}</h5>Posted by <b>${rows.createdby}</b> at ${rows.createddate}<br />
                                                                <c:if test="${rows.editedby != null && rows.editeddate != null}">
                                                                    <small>Lastest edited by <b>${rows.editedby}</b> at ${rows.editeddate}</small><br />
                                                                </c:if>
                                                            </td>

                                                            <td>${rows.id}</td>


                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>


                                    </div>	
                                    <!-- end card-body -->								

                                </div>
                                <!-- end card -->					

                            </div>
                            <!-- end col -->	

                        </div>
                        <!-- end row -->	



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
        <script>
            $(document).ready(function () {
                $('#newss').DataTable({
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
