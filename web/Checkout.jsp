<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>


<!DOCTYPE html>
<html class="no-js" lang="en">


    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Công Ty Gia Truyền Hồng Đức</title>
        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" type="image/x-icon" href="hinh anh/Logo/cropped-Favicon-1-32x32.png" />
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/slick.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/main-color.css">
        <link rel="stylesheet" href="assets/css/main-color03-green.css">
        <style>
            /* Tổng quan */
            .page-contain.checkout {
                background-color: #f8f9fa;
                padding: 30px 0;
            }

            .main-content {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }

            /* Checkout progress box */
            .checkout-progress-wrap {
                background-color: #ffffff;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .checkout-progress-wrap .steps {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .checkout-progress-wrap .steps li {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            /* Order Summary */
            .order-summary {
                background-color: #ffffff;
                border: 1px solid #e0e0e0;
                border-radius: 8px;
                padding: 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .order-summary .title-block {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .order-summary .title-block h3 {
                font-size: 20px;
                font-weight: bold;
                color: #333;
            }

            .order-summary .title-block .link-forward {
                font-size: 14px;
                color: #007bff;
                text-decoration: none;
            }

            .order-summary .title-block .link-forward:hover {
                text-decoration: underline;
            }

            /* Cart list */
            .cart-list-box {
                margin-bottom: 20px;
            }

            .cart-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
                padding-bottom: 15px;
                border-bottom: 1px solid #e0e0e0;
            }

            .cart-item:last-child {
                border-bottom: none;
            }

            .product-thumbnail {
                display: flex;
                align-items: center;
            }

            .product-thumbnail .prd-thumb {
                margin-right: 10px;
            }

            .product-thumbnail .prd-name {
                font-size: 16px;
                color: #333;
                text-decoration: none;
            }

            .product-thumbnail .prd-name:hover {
                text-decoration: underline;
            }

            .product-price,
            .product-quantity,
            .product-subtotal {
                font-size: 16px;
                color: #666;
            }

            /* Subtotal */
            .subtotal {
                list-style: none;
                padding: 0;
                margin-top: 20px;
            }

            .subtotal-line {
                display: flex;
                justify-content: space-between;
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            /* Checkout button */
            .checkout-buttons {
                text-align: right;
            }

            .checkout-buttons .checkout-btn {
                background-color: #28a745;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .checkout-buttons .checkout-btn:hover {
                background-color: #218838;
            }
        </style>

        <script>
            function confirmPayment() {
                fetch("<%= request.getContextPath() %>/checkout", {
                    method: "POST",
                    headers: {"Content-Type": "application/json"}
                })
                        .then(response => response.json())
                        .then(data => {

                            alert("⚠:️ " + data.message);

                        })
                        .catch(error => {
                            console.error("Lỗi thanh toán:", error);
                            alert("❌ Đã xảy ra lỗi trong quá trình thanh toán.");
                        });
            }
        </script>
    </head>
    <body class="biolife-body">

        <!-- Preloader -->
        <div id="biof-loading">
            <div class="biof-loading-center">
                <div class="biof-loading-center-absolute">
                    <div class="dot dot-one"></div>
                    <div class="dot dot-two"></div>
                    <div class="dot dot-three"></div>
                </div>
            </div>
        </div>

        <!-- HEADER -->
        <jsp:include page="Menu.jsp"></jsp:include>

            <!--Hero Section-->
            <div class="hero-section hero-background">
                <h1 class="page-title">Checkout</h1>
            </div>

            <!--Navigation section-->
            <div class="container">
                <nav class="biolife-nav">
                    <ul>
                        <li class="nav-item"><a href="home" class="permal-link">Home</a></li>
                        <li class="nav-item"><span class="current-page">Shopping Cart</span></li>
                    </ul>
                </nav>
            </div>

            <div class="page-contain checkout">
                <div class="checkout-container">
                    <div class="order-wrapper">
                        <div class="order-summary">
                            <div class="order-header">
                                <h3>Order Summary</h3>
                                <a href="cart" class="edit-link">Edit cart</a>
                            </div>

                            <div class="cart-items">
                                <div class="items-count">${sessionScope.cart.items.size()} items</div>

                            <c:forEach items="${sessionScope.cart.items}" var="item">
                                <div class="cart-item">
                                    <div class="item-image">
                                        <img src="${item.product.img}" alt="${item.product.name}">
                                    </div>
                                    <div class="item-details">
                                        <h4>${item.product.name}</h4>
                                        <div class="item-price"><fmt:formatNumber value="${item.product.price}" type="currency"/></div>
                                        <div class="item-quantity">Số lượng: ${item.quantity}</div>
                                        <div class="item-total">Tổng: <fmt:formatNumber value="${item.product.price * item.quantity}" type="currency"/></div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="order-total">
                            <span>Tổng tiền:</span>
                            <span class="total-amount"><fmt:formatNumber value="${sessionScope.cart.totalAmount}" type="currency"/></span>
                        </div>

                        <button class="checkout-button" onclick="confirmPayment()">
                            Đặt hàng
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <style>
            .page-contain.checkout {
                padding: 40px 0;
                background: #f5f5f5;
            }

            .checkout-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
            }

            .order-wrapper {
                max-width: 800px;
                margin: 0 auto;
            }

            .order-summary {
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                padding: 24px;
            }

            .order-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 24px;
                border-bottom: 1px solid #eee;
                padding-bottom: 16px;
            }

            .order-header h3 {
                font-size: 24px;
                color: #333;
                margin: 0;
            }

            .edit-link {
                color: #4CAF50;
                text-decoration: none;
            }

            .cart-items {
                margin-bottom: 24px;
            }

            .items-count {
                color: #666;
                margin-bottom: 16px;
            }

            .cart-item {
                display: flex;
                gap: 20px;
                padding: 16px 0;
                border-bottom: 1px solid #eee;
            }

            .item-image {
                width: 100px;
                height: 100px;
            }

            .item-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 4px;
            }

            .item-details {
                flex: 1;
            }

            .item-details h4 {
                margin: 0 0 8px 0;
                color: #333;
            }

            .item-price {
                font-weight: bold;
                color: #4CAF50;
            }

            .item-quantity {
                color: #666;
                margin: 4px 0;
            }

            .item-total {
                font-weight: bold;
                color: #333;
            }

            .order-total {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 20px;
                font-weight: bold;
                margin: 24px 0;
                padding-top: 16px;
                border-top: 2px solid #eee;
            }

            .total-amount {
                color: #4CAF50;
            }

            .checkout-button {
                width: 100%;
                padding: 16px;
                background: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .checkout-button:hover {
                background: #45a049;
            }
        </style>

    </div>

    <!-- FOOTER -->
    <jsp:include page="Footer.jsp"></jsp:include>

    <!--Footer For Mobile-->
    <div class="mobile-footer">
        <div class="mobile-footer-inner">
            <div class="mobile-block block-menu-main">
                <a class="menu-bar menu-toggle btn-toggle" data-object="open-mobile-menu" href="javascript:void(0)">
                    <span class="fa fa-bars"></span>
                    <span class="text">Menu</span>
                </a>
            </div>
            <div class="mobile-block block-sidebar">
                <a class="menu-bar filter-toggle btn-toggle" data-object="open-mobile-filter" href="javascript:void(0)">
                    <i class="fa fa-sliders" aria-hidden="true"></i>
                    <span class="text">Sidebar</span>
                </a>
            </div>
            <div class="mobile-block block-minicart">
                <a class="link-to-cart" href="#">
                    <span class="fa fa-shopping-bag" aria-hidden="true"></span>
                    <span class="text">Cart</span>
                </a>
            </div>
            <div class="mobile-block block-global">
                <a class="menu-bar myaccount-toggle btn-toggle" data-object="global-panel-opened" href="javascript:void(0)">
                    <span class="fa fa-globe"></span>
                    <span class="text">Global</span>
                </a>
            </div>
        </div>
    </div>

    <div class="mobile-block-global">
        <div class="biolife-mobile-panels">
            <span class="biolife-current-panel-title">Global</span>
            <a class="biolife-close-btn" data-object="global-panel-opened" href="#">&times;</a>
        </div>
        <div class="block-global-contain">
            <div class="glb-item my-account">
                <b class="title">My Account</b>
                <ul class="list">
                    <li class="list-item"><a href="#">Login/register</a></li>
                    <li class="list-item"><a href="#">Wishlist <span class="index">(8)</span></a></li>
                    <li class="list-item"><a href="#">Checkout</a></li>
                </ul>
            </div>
            <div class="glb-item currency">
                <b class="title">Currency</b>
                <ul class="list">
                    <li class="list-item"><a href="#">? EUR (Euro)</a></li>
                    <li class="list-item"><a href="#">$ USD (Dollar)</a></li>
                    <li class="list-item"><a href="#">£ GBP (Pound)</a></li>
                    <li class="list-item"><a href="#">¥ JPY (Yen)</a></li>
                </ul>
            </div>
            <div class="glb-item languages">
                <b class="title">Language</b>
                <ul class="list inline">
                    <li class="list-item"><a href="#"><img src="assets/images/languages/us.jpg" alt="flag" width="24" height="18"></a></li>
                    <li class="list-item"><a href="#"><img src="assets/images/languages/fr.jpg" alt="flag" width="24" height="18"></a></li>
                    <li class="list-item"><a href="#"><img src="assets/images/languages/ger.jpg" alt="flag" width="24" height="18"></a></li>
                    <li class="list-item"><a href="#"><img src="assets/images/languages/jap.jpg" alt="flag" width="24" height="18"></a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Scroll Top Button -->
    <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

    <script src="assets/js/jquery-3.4.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.countdown.min.js"></script>
    <script src="assets/js/jquery.nice-select.min.js"></script>
    <script src="assets/js/jquery.nicescroll.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/biolife.framework.js"></script>
    <script src="assets/js/functions.js"></script>
</body>

</html>