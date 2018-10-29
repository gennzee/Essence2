<%-- 
    Document   : users
    Created on : Oct 29, 2018, 7:05:53 PM
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
                                    <h1 class="main-title float-left">Users</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Home</li>
                                        <li class="breadcrumb-item active">Users</li>
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
                                        <span class="pull-right"><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_add_user"><i class="fa fa-user-plus" aria-hidden="true"></i> Add new user</button></span>
                                        <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-labelledby="modal_add_user" aria-hidden="true" id="modal_add_user">
                                            <div class="modal-dialog">
                                                <div class="modal-content">

                                                    <form action="#" method="post" enctype="multipart/form-data">


                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Add new user</h5>
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                        </div>

                                                        <div class="modal-body">                

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label>Full name (required)</label>
                                                                        <input class="form-control" name="name" type="text" required />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Valid Email (required)</label>
                                                                        <input class="form-control" name="email" type="email" required />
                                                                    </div>
                                                                </div>  

                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Password (required)</label>
                                                                        <input class="form-control" name="password" type="text" required />
                                                                    </div>
                                                                </div>  
                                                            </div>

                                                            <div class="row">

                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Role</label>
                                                                        <select name="role_id" class="form-control" required>
                                                                            <option value="">- select -</option>
                                                                            <optgroup label="Staff member">
                                                                                <option value="1">Administrator</option>
                                                                                <option value="2">Manager</option>
                                                                                <option value="3">Author</option>
                                                                            </optgroup>

                                                                            <optgroup label="Registered member">
                                                                                <option value="4">User</option>
                                                                            </optgroup>
                                                                        </select>
                                                                    </div>
                                                                </div>					               

                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Skype (optional)</label>
                                                                        <input class="form-control" name="skype" type="text" />
                                                                    </div>
                                                                </div>  				
                                                            </div>


                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Email verified</label>
                                                                        <select name="email_verified" class="form-control">
                                                                            <option value="1">YES</option>
                                                                            <option value="0">NO</option>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label>Active</label>
                                                                        <select name="active" class="form-control">
                                                                            <option value="1">YES</option>
                                                                            <option value="0">NO</option>
                                                                        </select>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="form-group">
                                                                <label>Avatar image (optional):</label> <br />
                                                                <input type="file" name="image">
                                                            </div>

                                                        </div>             

                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-primary">Add user</button>
                                                        </div>

                                                    </form>	

                                                </div>
                                            </div>
                                        </div> 
                                        <h3><i class="fa fa-user"></i> All users (4 users)</h3>								
                                    </div>
                                    <!-- end card-header -->	

                                    <div class="card-body">


                                        <div class="table-responsive">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width:50px">ID</th>
                                                        <th>User details</th>
                                                        <th style="width:130px">Role</th>
                                                        <th style="width:150px">Articles</th>
                                                        <th style="width:120px">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="rows" items="${list_users_admin}">
                                                        <tr>

                                                            <th>${rows.id}</th>
                                                            <td>
                                                                <span style="float: left; margin-right:10px;"><img alt="image" style="max-width:40px; height:auto;" src="../admin/assets/images/avatars/avatar1.png" /></span>
                                                                <strong>${rows.name}</strong><br>
                                                                <small>${rows.email}</small>
                                                            </td>
                                                            <c:choose>
                                                                <c:when test="${rows.roleid == 1}">
                                                                    <td>Admin</td>
                                                                </c:when>
                                                                <c:when test="${rows.roleid == 2}">
                                                                    <td>User</td>
                                                                </c:when>
                                                            </c:choose>



                                                            <td>0</td>

                                                            <td>
                                                                <a href="#" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_edit_user_5"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                <div class="modal fade custom-modal" tabindex="-1" role="dialog" aria-hidden="true" id="modal_edit_user_5">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <form action="#" method="post" enctype="multipart/form-data">


                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title">Edit user</h5>
                                                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>          	
                                                                                </div>

                                                                                <div class="modal-body">                

                                                                                    <div class="row">
                                                                                        <div class="col-lg-12">
                                                                                            <div class="form-group">
                                                                                                <label>Full name (required)</label>
                                                                                                <input class="form-control" name="name" type="text" required value="Gabriel Gaby" />
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="row">
                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Valid Email (required)</label>
                                                                                                <input class="form-control" name="email" type="email" required value="webmaster@website.com" />
                                                                                            </div>
                                                                                        </div>  

                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Password (empty not to change)</label>
                                                                                                <input class="form-control" name="password" type="text" />
                                                                                            </div>
                                                                                        </div>  
                                                                                    </div>

                                                                                    <div class="row">

                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Role</label>
                                                                                                <select name="role_id" class="form-control" required>
                                                                                                    <option value="">- select -</option>
                                                                                                    <optgroup label="Staff member">
                                                                                                        <option  value="1">Administrator</option>
                                                                                                        <option  value="2">Manager</option>
                                                                                                        <option selected="selected" value="3">Author</option>
                                                                                                    </optgroup>

                                                                                                    <optgroup label="Registered member">
                                                                                                        <option  value="4">User</option>
                                                                                                    </optgroup>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>					               

                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Skype (optional)</label>
                                                                                                <input class="form-control" name="skype" type="text" value="pppp" />
                                                                                            </div>
                                                                                        </div>  				
                                                                                    </div>


                                                                                    <div class="row">
                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Email verified</label>
                                                                                                <select name="email_verified" class="form-control">
                                                                                                    <option selected="selected" value="1">YES</option>
                                                                                                    <option  value="0">NO</option>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="col-lg-6">
                                                                                            <div class="form-group">
                                                                                                <label>Active</label>
                                                                                                <select name="active" class="form-control">
                                                                                                    <option selected="selected" value="1">YES</option>
                                                                                                    <option  value="0">NO</option>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label>Change avatar (optional):</label> <br />
                                                                                        <input type="file" name="image">
                                                                                    </div>

                                                                                </div>             

                                                                                <div class="modal-footer">
                                                                                    <input type="hidden" name="user_id" value="5" />
                                                                                    <button type="button" class="btn btn-primary">Edit user</button>
                                                                                </div>

                                                                            </form>	

                                                                        </div>
                                                                    </div>
                                                                </div> 
                                                                <a href="#" class="btn btn-danger btn-sm" data-placement="top" data-toggle="tooltip" data-title="Delete"><i class="fa fa-trash-o" aria-hidden="true"></i></a>

                                                            </td>

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
