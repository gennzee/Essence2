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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"/>
        <link rel="stylesheet" href="../admin/assets/plugins/trumbowyg/ui/trumbowyg.min.css">
        <link rel="stylesheet" href="../admin/assets/plugins/trumbowyg/ui/trumbowyg.css">
        <link rel="stylesheet" href="../admin/assets/plugins/trumbowyg/plugins/colors/ui/trumbowyg.colors.css">
        <link rel="stylesheet" href="../admin/assets/plugins/trumbowyg/plugins/table/ui/trumbowyg.table.css">
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

                            <li class="submenu">
                                <a href="../admin/users.htm"><i class="fa fa-fw fa-users"></i><span> Users </span> </a>
                            </li>

                            <li class="submenu">
                                <a class="active" href="../admin/nav.htm"><i class="fa fa-fw fa-indent"></i><span> Navigate Menu </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="../admin/news.htm"><i class="fa fa-fw fa-newspaper-o"></i><span> Collections </span> </a>
                            </li>

                            <li class="submenu">
                                <a href="../admin/contact.htm"><i class="fa fa-fw fa-address-card-o"></i><span> Contact Manage </span> </a>
                            </li>

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

                <c:forEach var="rows" items="${shop_title}">
                    <c:set var="title_id" value="${rows.id}"/>
                    <c:set var="title_name" value="${rows.name}"/>
                </c:forEach>

                <!-- Start content -->
                <div class="content">

                    <div class="container-fluid">



                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-holder">
                                    <h1 class="main-title float-left">Product in ${title_name}</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Home</li>
                                        <li class="breadcrumb-item">Categories</li>
                                        <li class="breadcrumb-item active">Product in ${title_name}</li>
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
                                        <span class="pull-right"><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_add_product"><i class="fa fa-user-plus" aria-hidden="true"></i> Add new product</button></span>
                                        <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-labelledby="modal_add_product" aria-hidden="true" id="modal_add_product">
                                            <div class="modal-dialog">
                                                <div class="modal-content">

                                                    <form action="../admin/add_new_product.htm" method="post">

                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Add product</h5>
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                        </div>

                                                        <div class="modal-body">          

                                                            <div class="row">

                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Product Name</label>
                                                                        <input class="form-control" name="txtProductname" type="text" required value="" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Price </label>
                                                                        <input class="form-control" name="txtPrice" type="number" required value="0" />
                                                                        <div style="position: absolute;top: 40px;right: 48px;">&#8363</div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Discount </label>
                                                                        <input class="form-control" name="txtDiscount" type="number" required value="0" />
                                                                        <div style="position: absolute;top: 40px;right: 48px;">&#8363</div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Brand</label>
                                                                        <input class="form-control" name="txtBrand" type="text" required value="" />
                                                                    </div>
                                                                </div>	
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Sub-category</label>
                                                                        <select name="txtSubcategory" class="form-control" required>
                                                                            <option value="${title_id}">${title_name}</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Detail</label><br>
                                                                        <textarea name="txtDetail" class="form-control editor" rows="3">${rows.detail}</textarea>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label>Image product 1 :</label> <br />

                                                                <input type="file" name="txtImage1">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Image product 2 :</label> <br />

                                                                <input type="file" name="txtImage2">
                                                            </div>

                                                        </div>

                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Add product</button>
                                                        </div>

                                                    </form>	

                                                </div>
                                            </div>
                                        </div> 
                                        <h3><i class="fa fa-user"></i> All products (${product_size} products)</h3>								
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
                                                        <th>Products Name</th>
                                                        <th>Price</th>
                                                        <th>Discount</th>
                                                        <th>Quantity</th>
                                                        <th>Brand</th>
                                                        <th>Image 1</th>
                                                        <th>Image 2</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="rows" items="${listProducts}">
                                                        <tr>
                                                            <td></td>
                                                            <td>
                                                                <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_edit_products_${rows.id}"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="modal_edit_products_${rows.id}">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <form action="../admin/edit_product.htm" method="post">

                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title">Edit product</h5>
                                                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                                                </div>

                                                                                <div class="modal-body">          

                                                                                    <div class="row">

                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Product Name</label>
                                                                                                <input class="form-control" name="txtProductname" type="text" required value="${rows.name}" />
                                                                                                <input hidden="true" type="text" value="${rows.id}" name="txtId"/>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Price </label>
                                                                                                <input class="form-control" name="txtPrice" type="number" required value="${rows.price}" />
                                                                                                <div style="position: absolute;top: 40px;right: 48px;">&#8363</div>
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>

                                                                                    <div class="row">
                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Discount </label>
                                                                                                <input class="form-control" name="txtDiscount" type="number" required value="${rows.discount}" />
                                                                                                <div style="position: absolute;top: 40px;right: 48px;">&#8363</div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Brand</label>
                                                                                                <input class="form-control" name="txtBrand" type="text" required value="${rows.brand}" />
                                                                                            </div>
                                                                                        </div>	
                                                                                    </div>

                                                                                    <div class="row">
                                                                                        <div class="col-lg-12">
                                                                                            <div class="form-group">
                                                                                                <label>Sub-category</label>
                                                                                                <select name="txtSubcategory" class="form-control" required>
                                                                                                    <c:forEach var="nav" items="${sessionScope.list_Nav}">
                                                                                                        <optgroup label="${nav.name}">
                                                                                                            <c:forEach var="catalog" items="${sessionScope.list_Catalog}">
                                                                                                                <c:if test="${catalog.navid == nav.id}">
                                                                                                                    <option value="${catalog.id}">${catalog.name}</option>
                                                                                                                </c:if>
                                                                                                            </c:forEach>
                                                                                                        </optgroup>
                                                                                                    </c:forEach>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="row">
                                                                                        <div class="col-lg-12">
                                                                                            <div class="form-group">
                                                                                                <label>Detail</label><br>
                                                                                                <textarea name="txtDetail" class="form-control editor" rows="3">${rows.detail}</textarea>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label>Image product 1 :</label> <br />
                                                                                        <img src="../img/product-img/${rows.img1}" style="width: 65px"/>
                                                                                        <input type="text" hidden="true" value="${rows.img1}" name="txtOldimg1"/>
                                                                                        <input type="file" name="txtImage1">
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label>Image product 2 :</label> <br />
                                                                                        <img src="../img/product-img/${rows.img2}" style="width: 65px"/>
                                                                                        <input type="text" hidden="true" value="${rows.img2}" name="txtOldimg2"/>
                                                                                        <input type="file" name="txtImage2">
                                                                                    </div>

                                                                                </div>

                                                                                <div class="modal-footer">
                                                                                    <button type="submit" class="btn btn-primary">Edit product</button>
                                                                                </div>
                                                                            </form>	

                                                                        </div>
                                                                    </div>
                                                                </div> 
                                                                <a href="<s:url value="../admin/remove_product/${rows.id}.htm"/>" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                            </td>
                                                            <td>${rows.id}</td>
                                                            <td>${rows.name}</td>
                                                            <td>${rows.price}</td>
                                                            <td>${rows.discount}</td>
                                                            <td>${rows.quantity}</td>
                                                            <td>${rows.brand}</td>
                                                            <td><img src="../img/product-img/${rows.img1}" style="width: 65px"/></td>
                                                            <td><img src="../img/product-img/${rows.img2}" style="width: 65px"/></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>							
                                </div><!-- end card-->					
                            </div>

                        </div>

                        <hr>

                        <div class="row">


                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6" style="flex: 0 0 100%;max-width: 100%;">						
                                <div class="card mb-3">
                                    <div class="card-header">
                                        <h3><i class="fa fa-user"></i> All products inactive (doesn't have invoice) (${product_size} products)</h3>								
                                    </div>
                                    <!-- end card-header -->	

                                    <div class="card-body">

                                        <div class="table-responsive">
                                            <table id="user2" class="table table-bordered table-hover display" style="width: 100%">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>Actions</th>
                                                        <th>ID</th>
                                                        <th>Products Name</th>
                                                        <th>Price</th>
                                                        <th>Discount</th>
                                                        <th>Quantity</th>
                                                        <th>Brand</th>
                                                        <th>Image 1</th>
                                                        <th>Image 2</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="rows" items="${listProducts_no_invoice}">
                                                        <tr>
                                                            <td></td>
                                                            <td>
                                                                <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_edit_products_${rows.id}"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="modal_edit_products_${rows.id}">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <form action="../admin/edit_product.htm" method="post">

                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title">Edit product</h5>
                                                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                                                </div>

                                                                                <div class="modal-body">          

                                                                                    <div class="row">

                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Product Name</label>
                                                                                                <input class="form-control" name="txtProductname" type="text" required value="${rows.name}" />
                                                                                                <input hidden="true" type="text" value="${rows.id}" name="txtId"/>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Price </label>
                                                                                                <input class="form-control" name="txtPrice" type="number" required value="${rows.price}" />
                                                                                                <div style="position: absolute;top: 40px;right: 48px;">&#8363</div>
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>

                                                                                    <div class="row">
                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Discount </label>
                                                                                                <input class="form-control" name="txtDiscount" type="number" required value="${rows.discount}" />
                                                                                                <div style="position: absolute;top: 40px;right: 48px;">&#8363</div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Brand</label>
                                                                                                <input class="form-control" name="txtBrand" type="text" required value="${rows.brand}" />
                                                                                            </div>
                                                                                        </div>	
                                                                                    </div>

                                                                                    <div class="row">
                                                                                        <div class="col-lg-12">
                                                                                            <div class="form-group">
                                                                                                <label>Sub-category</label>
                                                                                                <select name="txtSubcategory" class="form-control" required>
                                                                                                    <c:forEach var="nav" items="${sessionScope.list_Nav}">
                                                                                                        <optgroup label="${nav.name}">
                                                                                                            <c:forEach var="catalog" items="${sessionScope.list_Catalog}">
                                                                                                                <c:if test="${catalog.navid == nav.id}">
                                                                                                                    <option value="${catalog.id}">${catalog.name}</option>
                                                                                                                </c:if>
                                                                                                            </c:forEach>
                                                                                                        </optgroup>
                                                                                                    </c:forEach>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="row">
                                                                                        <div class="col-lg-12">
                                                                                            <div class="form-group">
                                                                                                <label>Detail</label><br>
                                                                                                <textarea name="txtDetail" class="form-control editor" rows="3">${rows.detail}</textarea>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label>Image product 1 :</label> <br />
                                                                                        <img src="../img/product-img/${rows.img1}" style="width: 65px"/>
                                                                                        <input type="text" hidden="true" value="${rows.img1}" name="txtOldimg1"/>
                                                                                        <input type="file" name="txtImage1">
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label>Image product 2 :</label> <br />
                                                                                        <img src="../img/product-img/${rows.img2}" style="width: 65px"/>
                                                                                        <input type="text" hidden="true" value="${rows.img2}" name="txtOldimg2"/>
                                                                                        <input type="file" name="txtImage2">
                                                                                    </div>

                                                                                </div>

                                                                                <div class="modal-footer">
                                                                                    <button type="submit" class="btn btn-primary">Edit product</button>
                                                                                </div>
                                                                            </form>	

                                                                        </div>
                                                                    </div>
                                                                </div> 
                                                                <a href="<s:url value="../admin/remove_product/${rows.id}.htm"/>" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                            </td>
                                                            <td>${rows.id}</td>
                                                            <td>${rows.name}</td>
                                                            <td>${rows.price}</td>
                                                            <td>${rows.discount}</td>
                                                            <td>${rows.quantity}</td>
                                                            <td>${rows.brand}</td>
                                                            <td><img src="../img/product-img/${rows.img1}" style="width: 65px"/></td>
                                                            <td><img src="../img/product-img/${rows.img2}" style="width: 65px"/></td>
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
        <script>window.jQuery || document.write('<script src="../admin/assets/plugins/trumbowyg/jquery-3.2.1.min"><\/script>');</script>
        <script src="../admin/assets/plugins/trumbowyg/trumbowyg.js"></script>

        <script src="../admin/assets/plugins/trumbowyg/trumbowyg.min.js"></script>
        <script src="../admin/assets/plugins/trumbowyg/plugins/base64/trumbowyg.base64.js"></script>
        <script src="../admin/assets/plugins/trumbowyg/plugins/colors/trumbowyg.colors.js"></script>
        <script src="../admin/assets/plugins/trumbowyg/plugins/fontsize/trumbowyg.fontsize.js"></script>
        <script src="../admin/assets/plugins/trumbowyg/plugins/table/trumbowyg.table.js"></script>
        <script src="../admin/assets/plugins/trumbowyg/plugins/lineheight/trumbowyg.lineheight.js"></script>
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
        <script>
            $(document).ready(function () {
                $('#user2').DataTable({
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
        <script>
            $(document).ready(function () {
                $('.editor')
                        .trumbowyg({
                            btnsDef: {
                                // Create a new dropdown
                                image: {
                                    dropdown: ['insertImage', 'base64'],
                                    ico: 'insertImage'
                                }
                            },
                            // Redefine the button pane
                            btns: [
                                ['viewHTML'],
                                ['fontsize'],
                                ['foreColor', 'backColor'],
                                ['table'],
                                ['undo'],
                                ['redo'],
                                ['formatting'],
                                ['strong', 'em', 'del'],
                                ['superscript', 'subscript'],
                                ['link'],
                                ['image'], // Our fresh created dropdown
                                ['justifyLeft', 'justifyCenter', 'justifyRight', 'justifyFull'],
                                ['unorderedList', 'orderedList'],
                                ['horizontalRule'],
                                ['removeformat'],
                                ['fullscreen']
                            ]
                        });
            });

        </script>
        <!-- dataTable child row -->


    </body>
</html>
