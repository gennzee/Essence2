<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!-- top bar navigation -->
<div class="headerbar">

    <!-- LOGO -->
    <div class="headerbar-left">
        <a href="../admin/dashboard.htm" class="logo"><img alt="Logo" src="../admin/assets/images/logo.png" /> <span>Admin</span></a>
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
                            <img src="../admin/assets/images/avatars/avatar2.png" alt="img" class="rounded-circle img-fluid">
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
                            <img src="../admin/assets/images/avatars/avatar3.png" alt="img" class="rounded-circle img-fluid">
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
                            <img src="../admin/assets/images/avatars/avatar4.png" alt="img" class="rounded-circle img-fluid">
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
                    <img src="../img/users-img/${sessionScope.IMGUSER}" alt="Profile image" class="avatar-rounded">
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
                    <a href="#" class="dropdown-item notify-item">
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