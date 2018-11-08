<%-- 
    Document   : dashboard
    Created on : Oct 29, 2018, 2:49:01 PM
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
            <jsp:include page="part/leftsidebar.jsp"/>

            <div class="content-page">

                <!-- Start content -->
                <div class="content">

                    <div class="container-fluid">

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
                                    <h1 class="m-b-20 text-white counter">1,587</h1>
                                    <span class="text-white">In this month</span>
                                </div>
                            </div>

                            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                <div class="card-box noradius noborder bg-warning">
                                    <i class="fa fa-bar-chart float-right text-white"></i>
                                    <h6 class="text-white text-uppercase m-b-20">Collections</h6>
                                    <h1 class="m-b-20 text-white counter">250</h1>
                                    <span class="text-white">In this month</span>
                                </div>
                            </div>

                            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                <div class="card-box noradius noborder bg-info">
                                    <i class="fa fa-user-o float-right text-white"></i>
                                    <h6 class="text-white text-uppercase m-b-20">Customers</h6>
                                    <h1 class="m-b-20 text-white counter">120</h1>
                                    <span class="text-white">In this month</span>
                                </div>
                            </div>

                            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                <div class="card-box noradius noborder bg-danger">
                                    <i class="fa fa-bell-o float-right text-white"></i>
                                    <h6 class="text-white text-uppercase m-b-20">Orders Canceled</h6>
                                    <h1 class="m-b-20 text-white counter">58</h1>
                                    <span class="text-white">In this month</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3" style="flex: 0 0 50%;max-width: 50%;">
                                <div class="card-box noradius noborder bg-success">
                                    <i class="fa fa-check-circle float-right text-white"></i>
                                    <h6 class="text-white text-uppercase m-b-20">Orders Delivered</h6>
                                    <h1 class="m-b-20 text-white counter">58</h1>
                                    <span class="text-white">In this month</span>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3" style="flex: 0 0 50%;max-width: 50%;">
                                <div class="card-box noradius noborder bg-purple">
                                    <i class="fa fa-money float-right text-white"></i>
                                    <h6 class="text-white text-uppercase m-b-20">Revenue</h6>
                                    <h1 class="m-b-20 text-white counter">58</h1>
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
                                        <h1 class="m-b-20 text-success counter">58</h1>
                                        <span class="text-success">Today</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                <div style="border: 2px solid #ff5d48;margin-bottom: 5%;">
                                    <div class="card-box noradius noborder bg-transparent">
                                        <i class="fa fa-bell-o float-right text-danger"></i>
                                        <h6 class="text-danger text-uppercase m-b-20">Orders Pending</h6>
                                        <h1 class="m-b-20 text-danger counter">58</h1>
                                        <span class="text-danger">Today</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                <div style="border: 2px solid #1bb99a;margin-bottom: 5%;">
                                    <div class="card-box noradius noborder bg-transparent">
                                        <i class="fa fa-spinner fa-spin float-right text-success"></i>
                                        <h6 class="text-success text-uppercase m-b-20">Orders Delivering</h6>
                                        <h1 class="m-b-20 text-success counter">58</h1>
                                        <span class="text-success">Today</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                                <div style="border: 2px solid #ff5d48;margin-bottom: 5%;">
                                    <div class="card-box noradius noborder bg-transparent">
                                        <i class="fa fa-times float-right text-danger"></i>
                                        <h6 class="text-danger text-uppercase m-b-20">Orders Canceled</h6>
                                        <h1 class="m-b-20 text-danger counter">58</h1>
                                        <span class="text-danger">Today</span>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                                                    <th>Name</th>
                                                    <th>Position</th>
                                                    <th>Office</th>
                                                    <th>Age</th>
                                                    <th>Start date</th>
                                                    <th>Salary</th>
                                                </tr>
                                            </thead>													
                                            <tbody>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>System Architect</td>
                                                    <td>Edinburgh</td>
                                                    <td>61</td>
                                                    <td>2011/04/25</td>
                                                    <td>$320,800</td>
                                                </tr>
                                                <tr>
                                                    <td>Garrett Winters</td>
                                                    <td>Accountant</td>
                                                    <td>Tokyo</td>
                                                    <td>63</td>
                                                    <td>2011/07/25</td>
                                                    <td>$170,750</td>
                                                </tr>
                                                <tr>
                                                    <td>Ashton Cox</td>
                                                    <td>Junior Technical Author</td>
                                                    <td>San Francisco</td>
                                                    <td>66</td>
                                                    <td>2009/01/12</td>
                                                    <td>$86,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Cedric Kelly</td>
                                                    <td>Senior Javascript Developer</td>
                                                    <td>Edinburgh</td>
                                                    <td>22</td>
                                                    <td>2012/03/29</td>
                                                    <td>$433,060</td>
                                                </tr>
                                                <tr>
                                                    <td>Airi Satou</td>
                                                    <td>Accountant</td>
                                                    <td>Tokyo</td>
                                                    <td>33</td>
                                                    <td>2008/11/28</td>
                                                    <td>$162,700</td>
                                                </tr>
                                                <tr>
                                                    <td>Brielle Williamson</td>
                                                    <td>Integration Specialist</td>
                                                    <td>New York</td>
                                                    <td>61</td>
                                                    <td>2012/12/02</td>
                                                    <td>$372,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Herrod Chandler</td>
                                                    <td>Sales Assistant</td>
                                                    <td>San Francisco</td>
                                                    <td>59</td>
                                                    <td>2012/08/06</td>
                                                    <td>$137,500</td>
                                                </tr>
                                                <tr>
                                                    <td>Rhona Davidson</td>
                                                    <td>Integration Specialist</td>
                                                    <td>Tokyo</td>
                                                    <td>55</td>
                                                    <td>2010/10/14</td>
                                                    <td>$327,900</td>
                                                </tr>
                                                <tr>
                                                    <td>Colleen Hurst</td>
                                                    <td>Javascript Developer</td>
                                                    <td>San Francisco</td>
                                                    <td>39</td>
                                                    <td>2009/09/15</td>
                                                    <td>$205,500</td>
                                                </tr>
                                                <tr>
                                                    <td>Sonya Frost</td>
                                                    <td>Software Engineer</td>
                                                    <td>Edinburgh</td>
                                                    <td>23</td>
                                                    <td>2008/12/13</td>
                                                    <td>$103,600</td>
                                                </tr>
                                                <tr>
                                                    <td>Jena Gaines</td>
                                                    <td>Office Manager</td>
                                                    <td>London</td>
                                                    <td>30</td>
                                                    <td>2008/12/19</td>
                                                    <td>$90,560</td>
                                                </tr>
                                                <tr>
                                                    <td>Quinn Flynn</td>
                                                    <td>Support Lead</td>
                                                    <td>Edinburgh</td>
                                                    <td>22</td>
                                                    <td>2013/03/03</td>
                                                    <td>$342,000</td>
                                                </tr>										
                                                <tr>
                                                    <td>Fiona Green</td>
                                                    <td>Chief Operating Officer (COO)</td>
                                                    <td>San Francisco</td>
                                                    <td>48</td>
                                                    <td>2010/03/11</td>
                                                    <td>$850,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Shou Itou</td>
                                                    <td>Regional Marketing</td>
                                                    <td>Tokyo</td>
                                                    <td>20</td>
                                                    <td>2011/08/14</td>
                                                    <td>$163,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Jonas Alexander</td>
                                                    <td>Developer</td>
                                                    <td>San Francisco</td>
                                                    <td>30</td>
                                                    <td>2010/07/14</td>
                                                    <td>$86,500</td>
                                                </tr>
                                                <tr>
                                                    <td>Shad Decker</td>
                                                    <td>Regional Director</td>
                                                    <td>Edinburgh</td>
                                                    <td>51</td>
                                                    <td>2008/11/13</td>
                                                    <td>$183,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Michael Bruce</td>
                                                    <td>Javascript Developer</td>
                                                    <td>Singapore</td>
                                                    <td>29</td>
                                                    <td>2011/06/27</td>
                                                    <td>$183,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Donna Snider</td>
                                                    <td>Customer Support</td>
                                                    <td>New York</td>
                                                    <td>27</td>
                                                    <td>2011/01/25</td>
                                                    <td>$112,000</td>
                                                </tr>
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
                                                    <th>Name</th>
                                                    <th>Position</th>
                                                    <th>Office</th>
                                                    <th>Age</th>
                                                    <th>Start date</th>
                                                    <th>Salary</th>
                                                </tr>
                                            </thead>													
                                            <tbody>
                                                <tr>
                                                    <td>Tiger Nixon</td>
                                                    <td>System Architect</td>
                                                    <td>Edinburgh</td>
                                                    <td>61</td>
                                                    <td>2011/04/25</td>
                                                    <td>$320,800</td>
                                                </tr>
                                                <tr>
                                                    <td>Garrett Winters</td>
                                                    <td>Accountant</td>
                                                    <td>Tokyo</td>
                                                    <td>63</td>
                                                    <td>2011/07/25</td>
                                                    <td>$170,750</td>
                                                </tr>
                                                <tr>
                                                    <td>Ashton Cox</td>
                                                    <td>Junior Technical Author</td>
                                                    <td>San Francisco</td>
                                                    <td>66</td>
                                                    <td>2009/01/12</td>
                                                    <td>$86,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Cedric Kelly</td>
                                                    <td>Senior Javascript Developer</td>
                                                    <td>Edinburgh</td>
                                                    <td>22</td>
                                                    <td>2012/03/29</td>
                                                    <td>$433,060</td>
                                                </tr>
                                                <tr>
                                                    <td>Airi Satou</td>
                                                    <td>Accountant</td>
                                                    <td>Tokyo</td>
                                                    <td>33</td>
                                                    <td>2008/11/28</td>
                                                    <td>$162,700</td>
                                                </tr>
                                                <tr>
                                                    <td>Brielle Williamson</td>
                                                    <td>Integration Specialist</td>
                                                    <td>New York</td>
                                                    <td>61</td>
                                                    <td>2012/12/02</td>
                                                    <td>$372,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Herrod Chandler</td>
                                                    <td>Sales Assistant</td>
                                                    <td>San Francisco</td>
                                                    <td>59</td>
                                                    <td>2012/08/06</td>
                                                    <td>$137,500</td>
                                                </tr>
                                                <tr>
                                                    <td>Rhona Davidson</td>
                                                    <td>Integration Specialist</td>
                                                    <td>Tokyo</td>
                                                    <td>55</td>
                                                    <td>2010/10/14</td>
                                                    <td>$327,900</td>
                                                </tr>
                                                <tr>
                                                    <td>Colleen Hurst</td>
                                                    <td>Javascript Developer</td>
                                                    <td>San Francisco</td>
                                                    <td>39</td>
                                                    <td>2009/09/15</td>
                                                    <td>$205,500</td>
                                                </tr>
                                                <tr>
                                                    <td>Sonya Frost</td>
                                                    <td>Software Engineer</td>
                                                    <td>Edinburgh</td>
                                                    <td>23</td>
                                                    <td>2008/12/13</td>
                                                    <td>$103,600</td>
                                                </tr>
                                                <tr>
                                                    <td>Jena Gaines</td>
                                                    <td>Office Manager</td>
                                                    <td>London</td>
                                                    <td>30</td>
                                                    <td>2008/12/19</td>
                                                    <td>$90,560</td>
                                                </tr>
                                                <tr>
                                                    <td>Quinn Flynn</td>
                                                    <td>Support Lead</td>
                                                    <td>Edinburgh</td>
                                                    <td>22</td>
                                                    <td>2013/03/03</td>
                                                    <td>$342,000</td>
                                                </tr>										
                                                <tr>
                                                    <td>Fiona Green</td>
                                                    <td>Chief Operating Officer (COO)</td>
                                                    <td>San Francisco</td>
                                                    <td>48</td>
                                                    <td>2010/03/11</td>
                                                    <td>$850,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Shou Itou</td>
                                                    <td>Regional Marketing</td>
                                                    <td>Tokyo</td>
                                                    <td>20</td>
                                                    <td>2011/08/14</td>
                                                    <td>$163,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Jonas Alexander</td>
                                                    <td>Developer</td>
                                                    <td>San Francisco</td>
                                                    <td>30</td>
                                                    <td>2010/07/14</td>
                                                    <td>$86,500</td>
                                                </tr>
                                                <tr>
                                                    <td>Shad Decker</td>
                                                    <td>Regional Director</td>
                                                    <td>Edinburgh</td>
                                                    <td>51</td>
                                                    <td>2008/11/13</td>
                                                    <td>$183,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Michael Bruce</td>
                                                    <td>Javascript Developer</td>
                                                    <td>Singapore</td>
                                                    <td>29</td>
                                                    <td>2011/06/27</td>
                                                    <td>$183,000</td>
                                                </tr>
                                                <tr>
                                                    <td>Donna Snider</td>
                                                    <td>Customer Support</td>
                                                    <td>New York</td>
                                                    <td>27</td>
                                                    <td>2011/01/25</td>
                                                    <td>$112,000</td>
                                                </tr>
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
