<%-- 
    Document   : form
    Created on : Oct 29, 2018, 5:09:43 PM
    Author     : tanks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Pike Admin - Free Bootstrap 4 Admin Template</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../admin/assets/images/favicon.ico">

        <!-- Switchery css -->
        <link href="../admin/assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

        <!-- Bootstrap CSS -->
        <link href="../admin/assets/css/bootstrap.min.css" rel="stylesheet"/>

        <!-- Font Awesome CSS -->
        <link href="../admin/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>

        <!-- Custom CSS -->
        <link href="../admin/assets/css/style.css" rel="stylesheet"/>

        <!-- Modernizr -->
        <script src="../admin/assets/js/modernizr.min.js"></script>

        <!-- jQuery -->
        <script src="../admin/assets/js/jquery.min.js"></script>

        <!-- Moment -->
        <script src="../admin/assets/js/moment.min.js"></script>

        <!-- BEGIN CSS for this page -->
        <link rel="stylesheet" href="../admin/assets/plugins/trumbowyg/ui/trumbowyg.min.css">
        <link rel="stylesheet" href="../admin/assets/plugins/trumbowyg/ui/trumbowyg.css">
        <link rel="stylesheet" href="../admin/assets/plugins/trumbowyg/plugins/colors/ui/trumbowyg.colors.css">
        <link rel="stylesheet" href="../admin/assets/plugins/trumbowyg/plugins/table/ui/trumbowyg.table.css">
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
                                <a href="../admin/nav.htm"><i class="fa fa-fw fa-indent"></i><span> Navigate Menu </span> </a>
                            </li>

                            <li class="submenu">
                                <a class="active" href="../admin/news.htm"><i class="fa fa-fw fa-newspaper-o"></i><span> Collections </span> </a>
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

                <!-- Start content -->
                <div class="content">

                    <div class="container-fluid">


                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-holder">
                                    <h1 class="main-title float-left">Add new article</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Home</li>
                                        <li class="breadcrumb-item">Articles</li>
                                        <li class="breadcrumb-item active">Add article</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->


                        <div class="row">

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">						

                                <div class="card mb-3">

                                    <div class="card-body">

                                        <form action="../admin/news_edit.htm" method="post">	
                                            <c:forEach var="rows" items="${news_item}">
                                                <div class="row">

                                                    <div class="form-group col-xl-9 col-md-8 col-sm-12">
                                                        <div class="form-group">
                                                            <label>News title</label>
                                                            <input type="text" hidden="true" value="${rows.id}" name="txtId"/>
                                                            <input class="form-control" name="txtTitle" type="text" required value="${rows.title}">
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Thumbnail image</label><br />
                                                            <img src="../img/bg-img/${rows.imagetitle}" style="width: 150px"/>
                                                            <input type="text" hidden="true" value="${rows.imagetitle}" name="txtOldimg"/>
                                                            <input type="file" name="txtImg">
                                                        </div>

                                                        <div class="form-group">
                                                            <label>News content</label>
                                                            <textarea rows="3" class="form-control editor" name="txtContent">${rows.content}</textarea>
                                                        </div>



                                                        <div class="form-group">
                                                            <button type="submit" class="btn btn-primary">Edit article</button>
                                                            <a href="../admin/news.htm" class="btn btn-primary">Cancel edit</a>
                                                        </div>
                                                    </div>

                                                    <div class="form-group col-xl-3 col-md-4 col-sm-12 border-left">
                                                        <div class="form-group">
                                                            <label>Created by</label>
                                                            <input type="text" disabled="true" class="form-control" value="${rows.createdby}">    
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Created date</label>
                                                            <input type="text" disabled="true" class="form-control" value="${rows.createddate}">    
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Editing by</label>
                                                            <input type="text" disabled="true" class="form-control" value="${sessionScope.NAME}">    
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Editing date</label>
                                                            <input id="dateediting" type="text" disabled="true" class="form-control"> 
                                                            <script>
                                                                n = new Date();
                                                                y = n.getFullYear();
                                                                m = n.getMonth() + 1;
                                                                d = n.getDate();
                                                                document.getElementById("dateediting").value = y+"-"+m+"-"+d;
                                                            </script>
                                                        </div>

                                                    </div>

                                                </div><!-- end row -->	
                                            </c:forEach>
                                        </form>

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
        <!-- END Java Script for this page -->

    </body>
</html>
