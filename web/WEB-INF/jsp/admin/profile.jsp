<%-- 
    Document   : profile
    Created on : Nov 5, 2018, 2:47:45 PM
    Author     : Genn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                                    <h1 class="main-title float-left">My Profile</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Home</li>
                                        <li class="breadcrumb-item active">Profile</li>
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
                                        <h3><i class="fa fa-user"></i> Profile details</h3>								
                                    </div>

                                    <div class="card-body">


                                        <form action="../admin/edit_profile.htm" method="post">
                                            <c:forEach var="rows" items="${logged_in_user}">
                                                <div class="row">	

                                                    <div class="col-lg-9 col-xl-9">

                                                        <div class="row">				
                                                            <div class="col-lg-12">
                                                                <div class="form-group">
                                                                    <label>Full name </label>
                                                                    <input class="form-control" name="txtName" type="text" value="${rows.name}" required />
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label> Email</label>
                                                                    <input class="form-control" name="txtEmail" type="email" value="${rows.email}" required />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label>Password </label>
                                                                    <input class="form-control" name="txtPass" type="password" value="" placeholder="**********" />
                                                                </div>
                                                            </div>              			                                


                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label>Phone number</label>
                                                                    <input class="form-control" name="txtPhone" type="text" value="${rows.phone}" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group">
                                                                    <label>Address</label>
                                                                    <input class="form-control" name="txtAddress" type="text" value="${rows.address}" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <button type="submit" class="btn btn-primary">Edit profile</button>
                                                            </div>
                                                        </div>

                                                    </div>



                                                    <div class="col-lg-3 col-xl-3 border-left">

                                                        <div class="m-b-10"></div>

                                                        <div id="avatar_image">
                                                            <img alt="image" style="width:100%; height:auto;" src="../img/users-img/${rows.imageuser}" />
                                                            <input type="text" hidden="true" name="txtOldimage" value="${rows.imageuser}"/>
                                                            <br />

                                                        </div>  
                                                        <div id="image_deleted_text"></div>                      


                                                        <div class="m-b-10"></div>

                                                        <div class="form-group">
                                                            <label>Change avatar</label> 
                                                            <input type="file" name="txtImage" class="form-control">
                                                        </div>

                                                    </div>
                                                </div>								
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
    </body>
</html>
