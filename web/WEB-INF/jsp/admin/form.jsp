<%-- 
    Document   : form
    Created on : Oct 29, 2018, 5:09:43 PM
    Author     : tanks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">

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
        <link href="../admin/assets/plugins/trumbowyg/plugins/table/ui/trumbowyg.table.css" rel="stylesheet"/>
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
                                    <h1 class="main-title float-left">WYSIWYG text editor</h1>
                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item">Home</li>
                                        <li class="breadcrumb-item active">WYSIWYG text editor</li>
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
                                        <h3><i class="fa fa-file-o"></i> WYSIWYG editor example</h3>
                                        Editor and generated code are optimized for HTML5 support. Compatible with all recents browsers like IE9+, Chrome, Opera and Firefox.
                                    </div>

                                    <div class="card-body">
                                        <form action="../news/add_news.htm" method="post"/>
                                        <input type="text" name="txtTitle" placeholder="title"/>
                                        <textarea rows="3" class="form-control editor" name="txtContent"></textarea>
                                        <button type="submit">submit</button>
                                        </form>
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
