<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- ##### Right Side Cart Area ##### -->
<div class="cart-bg-overlay"></div>

<div class="right-side-cart-area">

    <!-- Cart Button -->
    <div class="cart-button">
        <a href="#" id="rightSideCart"><img src="../img/core-img/bag.svg" alt=""> <span>${sessionScope.CARTSIZE}</span></a>
    </div>

    <div class="cart-content d-flex">
        <!-- Cart List Area -->
        <div class="cart-list">
            <!-- Single Cart Item -->
            <c:set var="shop" value="${sessionScope.SHOP}"/>
            <c:if test="${not empty shop}">
                <c:set var="totalprice" value="${0}"/>
                <c:set var="totaldiscount" value="${0}"/>
                <c:forEach var="rows" items="${shop}">
                    <c:set var="totalprice" value="${totalprice + rows.value.sanpham.price * rows.value.quantity}"/>
                    <c:set var="totaldiscount" value="${totaldiscount + rows.value.sanpham.discount * rows.value.quantity}"/>
                    <div class="single-cart-item">
                        <div class="product-image">
                            <img src="../img/product-img/${rows.value.sanpham.img1}" class="cart-thumb" alt="">
                            <!-- Cart Item Desc -->
                                <div class="cart-item-desc">
                                    <a href="../cartbean/delete/${rows.value.sanpham.id}.htm" class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></a>
                                    <span class="badge">${rows.value.sanpham.brand}</span>
                                    <h6>${rows.value.sanpham.name}</h6>
                                    <p class="size">Quantity: ${rows.value.quantity}</p>
                                    <p class="size">Discount: <fmt:formatNumber value="${(rows.value.sanpham.discount/rows.value.sanpham.price)*100}" maxFractionDigits="0"/>%</p>
                                    <p class="price"><fmt:formatNumber type="number" value="${rows.value.sanpham.price}"/> &#8363</p>
                                </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>

        <!-- Cart Summary -->
        <c:if test="${sessionScope.SHOP != null}">
            <div class="cart-amount-summary">
                <h2>Summary</h2>
                <ul class="summary-table">
                    <li><span>subtotal:</span> <span><fmt:formatNumber type="number" value="${totalprice}"/> &#8363</span></li>
                    <li><span>delivery:</span> 
                        <c:if test="${totalprice >= 300000000}">
                            <span>Free</span>
                        </c:if>
                        <c:if test="${totalprice < 300000000}">
                            <span><fmt:formatNumber type="number" value="25000"/> &#8363</span>
                        </c:if>
                    </li>
                    <li><span>discount:</span> <span><fmt:formatNumber value="${(totaldiscount/totalprice)*100}" maxFractionDigits="0"/>%</span></li>
                    <li><span>total:</span> 
                        <c:if test="${totalprice >= 300000000}">
                            <span><fmt:formatNumber type="number" value="${totalprice - totaldiscount}"/> &#8363</span>
                        </c:if>
                        <c:if test="${totalprice < 300000000}">
                            <span><fmt:formatNumber type="number" value="${totalprice + 25000 - totaldiscount}"/> &#8363</span>
                        </c:if>
                    </li>
                </ul>
                <div class="checkout-btn mt-100">
                    <a href="../checkout/checkout.htm" class="btn essence-btn">check out</a>
                    <a href="../cartbean/viewcart.htm" class="btn essence-btn">view cart</a>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.SHOP == null}">
            <div class="cart-amount-summary">
                <h2>Cart is empty</h2>
            </div>
        </c:if>
    </div>
</div>
<!-- ##### Right Side Cart End ##### -->