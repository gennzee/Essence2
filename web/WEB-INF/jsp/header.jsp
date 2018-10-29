<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header_area">
    <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
        <!-- Classy Menu -->
        <nav class="classy-navbar" id="essenceNav">
            <!-- Logo -->
            <a class="nav-brand" href="../products/productsIndex.htm"><img src="../img/core-img/logo.png" alt=""></a>
            <!-- Navbar Toggler -->
            <div class="classy-navbar-toggler">
                <span class="navbarToggler"><span></span><span></span><span></span></span>
            </div>
            <!-- Menu -->
            <div class="classy-menu">
                <!-- close btn -->
                <div class="classycloseIcon">
                    <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                </div>
                <!-- Nav Start -->
                <div class="classynav">
                    <ul>
                        <li>

                            <a href="#">Shop</a>

                            <div class="megamenu">
                                <c:forEach var="rows" items="${sessionScope.list_Nav}">
                                    <ul class="single-mega cn-col-4">
                                        <li class="title"><b>${rows.name}</b></li>
                                                <c:forEach var="rowss" items="${sessionScope.list_Catalog}">
                                                    <c:if test="${rows.id == rowss.navid}">
                                                <li><a href="<s:url value="../products/${rowss.id}.htm"/>">${rowss.name}</a></li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </c:forEach>
                                <c:if test="${sessionScope.nav_Size <= 3}">
                                    <div class="single-mega cn-col-4">
                                        <img src="../img/bg-img/bg-98.jpg" alt="">
                                    </div>
                                </c:if>
                            </div>

                        </li>
                        <li><a href="../sale/sale.htm">Sales</a>

                        </li>
                        <li><a href="../news/news.htm">News</a></li>
                        <li><a href="../contact/contact.htm">Contact</a></li>
                        <li><a href="#">Languages</a>
                            <ul class="dropdown">
                                <li><a href="?lang=en"><s:message code="label.nav.en"/></a></li>
                                <li><a href="?lang=vi"><s:message code="label.nav.vi"/></a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- Nav End -->
            </div>
        </nav>

        <!-- Header Meta Data -->
        <div class="header-meta d-flex clearfix justify-content-end">
            <!-- Search Area -->
            <div class="search-area">
                <form action="../products/search.htm" method="get">
                    <input type="search" name="txtSearch" id="headerSearch" placeholder="Type for search">
                    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                </form>
            </div>
            <!-- Favourite Area -->
            <c:choose>
                <c:when test="${sessionScope.WISHLIST_SIZE > 0}">
                    <div class="favourite-area">
                        <a href="#" data-toggle="modal" data-target="#wishlistModal"><img src="../img/core-img/heart.svg" alt=""><span>${sessionScope.WISHLIST_SIZE}</span></a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="favourite-area">
                        <a href="#" data-toggle="modal" data-target="#wishlistModal"><img src="../img/core-img/heart.svg" alt=""><span></span></a>
                    </div>
                </c:otherwise>
            </c:choose>
            <!-- User Login Info -->
            <c:if test="${sessionScope.USER == null}">
                <div class="user-login-info">
                    <a href="#" data-toggle="modal" data-target="#loginModal"><img src="../img/core-img/user.svg" alt=""></a>
                </div>
            </c:if>
            <c:if test="${sessionScope.USER != null}">
                <div class="user-login-info">
                    <a href="#" data-toggle="modal" data-target="#userInfo"><img src="../img/users-img/${sessionScope.IMGUSER}" alt="Error" style="border-radius: 50%;max-width: 100%;height: 90%;"></a>
                </div>
            </c:if>

            <!-- Shipping Area -->
            <c:if test="${sessionScope.USER != null}">
                <div class="favourite-area">
                    <a href="#" data-toggle="modal" data-target="#history_shipping_status"><img style="max-width: 25px;" src="../img/core-img/img_571294.png" alt=""><span></span></a>
                </div>
            </c:if>

            <!-- Cart Area -->
            <div class="cart-area">
                <a href="#" id="essenceCartBtn"><img src="../img/core-img/bag.svg" alt=""> <span>${sessionScope.CARTSIZE}</span></a>
            </div>
        </div>
    </div>
    <style>
        .hoverrr:hover{
            background-color: black;
            color: white;
        }
    </style>
</header>
<div>
    <c:if test="${login_error != null}">
        <div class="container" style="max-width: 100%;padding: 0;">
            <div class="alert alert-danger alert-dismissible" style="margin: 0;text-align: center;">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>${login_error}</strong>
            </div>
        </div>
    </c:if>
    <c:if test="${login_success != null}">
        <div class="container" style="max-width: 100%;padding: 0;">
            <div class="alert alert-success alert-dismissible" style="margin: 0;text-align: center;">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>${login_success}</strong>
            </div>
        </div>
    </c:if>
</div>
