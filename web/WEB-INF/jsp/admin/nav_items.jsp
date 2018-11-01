<%-- 
    Document   : nav_item
    Created on : Oct 29, 2018, 8:13:13 PM
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

        <title>Pike Admin PRO</title>
        <meta name="description" content="Bootstrap 4 Admin Theme | Pike Admin">
        <meta name="author" content="Pike Web Development - https://www.pikephp.com">

        <!-- Favicon -->
        <link rel="shortcut icon" href="../admin/assets/images/favicon.ico">

        <!-- Switchery css -->
        <link href="../admin/assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

        <!-- Bootstrap CSS -->
        <link href="../admin/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

        <!-- Font Awesome CSS -->
        <link href="../admin/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Custom CSS -->
        <link href="../admin/assets/css/style.css" rel="stylesheet" type="text/css" />

        <!-- BEGIN CSS for this page -->

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
                                    <h1 class="main-title float-left">Categories</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Home</li>
                                        <li class="breadcrumb-item active">Categories</li>
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
                                        <span class="pull-right">
                                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_add_category"><i class="fa fa-plus" aria-hidden="true"></i> Add new category</button>
                                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#new_sub_catagory"><i class="fa fa-plus" aria-hidden="true"></i> Add new sub-category</button>
                                        </span>
                                        <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="modal_add_category">
                                            <div class="modal-dialog">
                                                <div class="modal-content">

                                                    <form action="../admin/new_category.htm" method="post">

                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Add new category</h5>
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                        </div>

                                                        <div class="modal-body">                

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Category title </label>
                                                                        <input class="form-control" name="txtCategory" type="text" required placeholder="Enter your new Category's name here" value="" />
                                                                    </div>
                                                                </div>
                                                            </div>


                                                        </div>             

                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Add category</button>
                                                        </div>

                                                    </form>	

                                                </div>
                                            </div>
                                        </div> 
                                        <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="new_sub_catagory">
                                            <div class="modal-dialog">
                                                <div class="modal-content">

                                                    <form action="../admin/new_catalog.htm" method="post">


                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Add new sub-category.</h5>
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                        </div>

                                                        <div class="modal-body">                

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Sub-category title </label>
                                                                        <input class="form-control" name="txtSubcategory" type="text" value="" required placeholder="Enter you new Sub-category's name here."/>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">					                
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>From category</label>
                                                                        <select name="txtNavid" class="form-control">
                                                                            <c:forEach var="rows" items="${sessionScope.list_Nav}">
                                                                                <option value="${rows.id}">${rows.name}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>             

                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Add sub-category</button>
                                                        </div>

                                                    </form>	

                                                </div>
                                            </div>
                                        </div>
                                        <h3><i class="fa fa-sitemap"></i> All categories (${nav_Size} categories)</h3>								
                                    </div>
                                    <!-- end card-header -->	

                                    <div class="card-body">


                                        <c:forEach var="rows" items="${sessionScope.list_Nav}">
                                            <table class="table table-bordered" style="border: 3px solid gainsboro;">
                                                <thead>
                                                    <tr>
                                                        <th style="font-size: 22px;">${rows.name}
                                                            <span style="float: right;">
                                                                <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_edit_category_${rows.id}"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="modal_edit_category_${rows.id}">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <form action="../admin/edit_category.htm" method="post">


                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title">Edit category</h5>
                                                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                                                </div>

                                                                                <div class="modal-body">                

                                                                                    <div class="row">
                                                                                        <div class="col-lg-12">
                                                                                            <div class="form-group">
                                                                                                <label>Category title </label>
                                                                                                <input class="form-control" name="txtCategory" type="text" value="${rows.name}" required />
                                                                                                <input type="text" hidden="true" value="${rows.id}" name="txtCategoryid"/>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>             

                                                                                <div class="modal-footer">
                                                                                    <button type="submit" class="btn btn-primary">Edit Category</button>
                                                                                </div>

                                                                            </form>	

                                                                        </div>
                                                                    </div>
                                                                </div> 
                                                                <a href="<s:url value="../admin/remove_category/${rows.id}.htm"/>" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                            </span>
                                                        </th>
                                                        <th style="width:150px">ID</th>
                                                        <th style="width:120px">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="rowss" items="${sessionScope.list_Catalog}">
                                                        <c:if test="${rows.id == rowss.navid}">
                                                            <tr>
                                                                <td>
                                                                    <strong>${rowss.name}</strong><br>
                                                                    <small><a href="<s:url value="../admin/products/${rowss.id}.htm"/>">Go to manage product</a></small>
                                                                </td>
                                                                <td>${rowss.id}</td>
                                                                <td>
                                                                    <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_edit_sub_category_${rowss.id}"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                    <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="modal_edit_sub_category_${rowss.id}">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">

                                                                                <form action="../admin/edit_catalog.htm" method="post">


                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title">Edit sub-category</h5>
                                                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                                                    </div>

                                                                                    <div class="modal-body">                

                                                                                        <div class="row">
                                                                                            <div class="col-lg-12">
                                                                                                <div class="form-group">
                                                                                                    <label>Sub-category title </label>
                                                                                                    <input class="form-control" name="txtSubcategory" type="text" value="${rowss.name}" required />
                                                                                                    <input type="text" hidden="true" value="${rowss.id}" name="txtSubcategoryid"/>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>             

                                                                                    <div class="modal-footer">
                                                                                        <button type="submit" class="btn btn-primary">Edit sub-category</button>
                                                                                    </div>

                                                                                </form>	

                                                                            </div>
                                                                        </div>
                                                                    </div> 
                                                                    <a href="<s:url value="../admin/remove_catalog/${rowss.id}.htm"/>" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i></a>

                                                                </td>
                                                            </tr>
                                                        </c:if>

                                                    </c:forEach>
                                                </tbody>
                                            </table><br>
                                        </c:forEach>

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
        <!-- END main -->

        <script src="../admin/assets/js/modernizr.min.js"></script>
        <script src="../admin/assets/js/jquery.min.js"></script>
        <script src="../admin/assets/js/moment.min.js"></script>

        <script src="../admin/assets/js/popper.min.js"></script>
        <script src="../admin/assets/js/bootstrap.min.js"></script>

        <script src="../admin/assets/js/detect.js"></script>
        <script src="../admin/assets/js/fastclick.js"></script>
        <script src="../admin/assets/js/jquery.blockUI.js"></script>
        <script src="../admin/assets/js/jquery.nicescroll.js"></script>
        <script src="../admin/assets/js/jquery.scrollTo.min.js"></script>
        <script src="../admin/assets/plugins/switchery/switchery.min.js"></script>

        <!-- App js -->
        <script src="../admin/assets/js/pikeadmin.js"></script>

        <!-- BEGIN Java Script for this page -->

        <!-- END Java Script for this page -->
    </body>
</html>
