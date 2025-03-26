<%-- 
    Document   : ShoppingCart
    Created on : Feb 16, 2025, 6:30:52 PM
    Author     : hoan6
--%>
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
            .btn-remove {
                background: none;
                border: none;
                color: #666;
                cursor: pointer;
                font-size: 16px;
            }
            .btn-remove:hover {
                color: #e74c3c;
            }
            .fa-trash-o {
                font-size: 18px;
            }
        </style>


    </head>
    <body class="biolife-body">
        <div>

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
                    <h1 class="page-title">Cart</h1>
                </div>

                <!--Navigation section-->
                <div class="container">
                    <nav class="biolife-nav">
                        <ul>
                            <li class="nav-item"><a href="home" class="permal-link">Home</a></li>
                            <li class="nav-item"><span class="current-page">ShoppingCart</span></li>
                        </ul>
                    </nav>
                </div>
            </div>

            <div class="page-contain shopping-cart">

                <!-- Main content -->
                <div id="main-content" class="main-content">
                    <div class="container">



                        <!--Cart Table-->
                        <div class="shopping-cart-container">
                            <div class="row">
                                <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                                    <h3 class="box-title">Your cart items</h3>
                                    <form class="shopping-cart-form" action="#" method="post">
                                        <table class="shop_table cart-form">
                                            <thead>
                                                <tr>
                                                    <th class="product-name">Product Name</th>
                                                    <th class="product-price">Price</th>
                                                    <th class="product-quantity">Quantity</th>
                                                    <th class="product-subtotal">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:choose>
        <%-- Kiểm tra nếu giỏ hàng trống --%>
        <c:when test="${empty sessionScope.cart.items}">
            <tr>
                <td colspan="4" class="text-center">
                    <div class="empty-cart-container" style="padding: 30px; text-align: center;">

                        
                        <%-- Thông báo giỏ hàng trống --%>
                        <h3 style="color: #666; margin-bottom: 15px;">
                            Giỏ hàng của bạn đang trống
                        </h3>
                        
                        <%-- Gợi ý cho người dùng --%>
                        <p style="color: #999; margin-bottom: 20px;">
                            Hãy thêm sản phẩm vào giỏ hàng để tiếp tục mua sắm
                        </p>
                        
                        <%-- Nút quay lại trang chủ để mua hàng --%>
                        <a href="home" class="btn btn-primary">
                            Tiếp tục mua sắm
                        </a>
                    </div>
                </td>
            </tr>
        </c:when>
            <c:otherwise>
                                            <c:forEach items="${sessionScope.cart.items}" var="item">
                                                <tr class="cart_item">
                                                    <td class="product-thumbnail" data-title="Product Name">
                                                        <a class="prd-thumb" href="#">
                                                            <figure><img width="113" height="113" src="${item.product.img}" alt="shipping cart"></figure>
                                                        </a>
                                                        <a class="prd-name" href="#">${item.product.name}</a>
                                                        <div class="action">

                                                            <div class="action">
                                                                <form action="cart" method="POST" style="display: inline;">
                                                                    <input type="hidden" name="action" value="remove">
                                                                    <input type="hidden" name="id" value="${item.product.id}">
                                                                    <button type="submit" class="btn-remove" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">
                                                                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="product-price" data-title="Price">
                                                        <div class="price price-contain">
                                                            <ins><span class="price-amount"><span class="currencySymbol"></span><fmt:formatNumber value="${item.product.price}" type="currency"/></span></ins>
                                                        </div>
                                                    </td>
                                                    <td class="product-quantity" data-title="Quantity">
                                                        <div class="quantity-box type1">
                                                            <div class="qty-input">
                                                                <form action="cart?action=update" method="POST" style="display:flex;align-items:center;">
                                                                    <input type="hidden" name="action" value="update">
                                                                    <input type="hidden" name="id" value="${item.product.id}">
                                                                    <input type="number" 
                                                                           name="quantity" 
                                                                           value="${item.quantity}" 
                                                                           min="1"
                                                                           max="${item.product.stock}"
                                                                           style="width:80px; height:35px; padding:0 10px; border:1px solid #e6e6e6;"
                                                                           oninput="this.value = this.value > ${item.product.stock} ? ${item.product.stock} : Math.abs(this.value || 1)">

                                                                    <button type="submit" class="btn btn-info" style="padding:5px 10px; margin-left:10px;">
                                                                        <i class="fa fa-refresh"></i> Update
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="product-subtotal" data-title="Total">
                                                        <div class="price price-contain">
                                                            <ins><span class="price-amount"><span class="currencySymbol"></span><fmt:formatNumber value="${item.product.price * item.quantity}" type="currency"/></span></ins>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                                </c:otherwise>
    </c:choose>
                                        <p style="font-size: 24px; color: #7FAF51; font-weight: bold;">Total: <fmt:formatNumber value="${sessionScope.cart.totalAmount}" type="currency"/></p>
                                        <tr class="cart_item wrap-buttons">
                                            <td class="wrap-btn-control" colspan="4">
                                                <a href="home" class="btn back-to-shop">Back to Shop</a>
                                                <form action="cart?action=clear" method="post" style="display: inline;">
                                                    <button type="submit" class="btn btn-clear">Clear Cart</button>
                                                </form>
                                                <a  href="checkoutBefor" class="btn btn-update">Checkout</a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>

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
                                <li class="list-item"><a href="#">€ EUR (Euro)</a></li>
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