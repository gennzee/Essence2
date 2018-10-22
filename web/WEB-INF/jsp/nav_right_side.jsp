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
                <c:set var="count" value="0"/>
                <c:forEach var="rows" items="${shop}">
                    <div class="single-cart-item">
                        <div class="product-image">
                            <img src="../img/product-img/${rows.value.sanpham.img1}" class="cart-thumb" alt="">
                            <!-- Cart Item Desc -->
                            <form action="../cartbean/remove.htm" method="get">
                                <div class="cart-item-desc">
                                    <button type="submit" class="product-remove" style="background-color: transparent;border: 0;"><input type="hidden" name="rmv" value="${rows.value.sanpham.id}"><i class="fa fa-close" aria-hidden="true"></i></button>
                                    <span class="badge">${rows.value.sanpham.brand}</span>
                                    <h6>${rows.value.sanpham.name}</h6>
                                    <p class="size">Quantity: ${rows.value.quantity}</p>
                                    <p class="size">Discount: <fmt:formatNumber value="${(rows.value.sanpham.discount/rows.value.sanpham.price)*100}" maxFractionDigits="0"/>%</p>
                                    <p class="price">${rows.value.sanpham.price} VND</p>
                                </div>
                            </form>
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
                    <li><span>subtotal:</span> <span>$274.00</span></li>
                    <li><span>delivery:</span> <span>Free</span></li>
                    <li><span>discount:</span> <span>-15%</span></li>
                    <li><span>total:</span> <span>$232.00</span></li>
                </ul>
                <div class="checkout-btn mt-100">
                    <a href="../checkout/checkout.htm" class="btn essence-btn">check out</a>
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