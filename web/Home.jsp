<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="assets/css/main-color03-green.css">
        <script>
        function addToCart(productId) {
    fetch("cart?action=add&id=" + productId , { method: "POST" })
        .then(response => response.text())
        .then(data => { alert("Đã thêm sản phẩm vào giỏ hàng!"); }) 
        .catch(error => console.error("Lỗi:", error));
}
    </script>
    </head>
    <body class="biolife-body">

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

            <!-- Page Contain -->
            <div class="page-contain">
            <!-- Page Contain -->
            <div class="page-contain">

                <!-- Main content -->
                <div id="main-content" class="main-content">
                <!-- Main content -->
                <div id="main-content" class="main-content">

                    <!--Block 01: Main Slide-->
                    <div class="main-slide block-slider nav-change">
                        <ul class="biolife-carousel" data-slick='{"arrows": true, "dots": false, "slidesMargin": 0, "slidesToShow": 1, "infinite": false, "speed": 800}' >
                            <li>
                                <div class="slide-contain slider-opt03__layout02 slide_animation type_02">
                                    <div class="media background-geen-01"></div>
                                    <div class="text-content">
                                        <i class="first-line">Pomegranate</i>
                                        <h3 class="second-line">Vegetables 100% Organic</h3>
                                        <p class="third-line">A blend of freshly squeezed green apple & fruits</p>
                                        <p class="buttons">
                                            <a href="#" class="btn btn-bold">Shop now</a>
                                            <a href="#" class="btn btn-thin">View lookbook</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <!--                            <li>
                                                            <div class="slide-contain slider-opt03__layout02 slide_animation type_02">
                                                                <div class="media background-geen-02"></div>
                                                                <div class="text-content">
                                                                    <i class="first-line">Pomegranate</i>
                                                                    <h3 class="second-line">Vegetables 100% Organic</h3>
                                                                    <p class="third-line">A blend of freshly squeezed green apple & fruits</p>
                                                                    <p class="buttons">
                                                                        <a href="#" class="btn btn-bold">Shop now</a>
                                                                        <a href="#" class="btn btn-thin">View lookbook</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="slide-contain slider-opt03__layout02 slide_animation type_02">
                                                                <div class="media background-geen-01"></div>
                                                                <div class="text-content">
                                                                    <i class="first-line">Pomegranate</i>
                                                                    <h3 class="second-line">Vegetables 100% Organic</h3>
                                                                    <p class="third-line">A blend of freshly squeezed green apple & fruits</p>
                                                                    <p class="buttons">
                                                                        <a href="#" class="btn btn-bold">Shop now</a>
                                                                        <a href="#" class="btn btn-thin">View lookbook</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="slide-contain slider-opt03__layout02 slide_animation type_02">
                                                                <div class="media background-geen-02"></div>
                                                                <div class="text-content">
                                                                    <i class="first-line">Pomegranate</i>
                                                                    <h3 class="second-line">Vegetables 100% Organic</h3>
                                                                    <p class="third-line">A blend of freshly squeezed green apple & fruits</p>
                                                                    <p class="buttons">
                                                                        <a href="#" class="btn btn-bold">Shop now</a>
                                                                        <a href="#" class="btn btn-thin">View lookbook</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="slide-contain slider-opt03__layout02 slide_animation type_02">
                                                                <div class="media background-geen-01"></div>
                                                                <div class="text-content">
                                                                    <i class="first-line">Pomegranate</i>
                                                                    <h3 class="second-line">Vegetables 100% Organic</h3>
                                                                    <p class="third-line">A blend of freshly squeezed green apple & fruits</p>
                                                                    <p class="buttons">
                                                                        <a href="#" class="btn btn-bold">Shop now</a>
                                                                        <a href="#" class="btn btn-thin">View lookbook</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="slide-contain slider-opt03__layout02 slide_animation type_02">
                                                                <div class="media background-geen-02"></div>
                                                                <div class="text-content">
                                                                    <i class="first-line">Pomegranate</i>
                                                                    <h3 class="second-line">Vegetables 100% Organic</h3>
                                                                    <p class="third-line">A blend of freshly squeezed green apple & fruits</p>
                                                                    <p class="buttons">
                                                                        <a href="#" class="btn btn-bold">Shop now</a>
                                                                        <a href="#" class="btn btn-thin">View lookbook</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="slide-contain slider-opt03__layout02 slide_animation type_02">
                                                                <div class="media background-geen-01"></div>
                                                                <div class="text-content">
                                                                    <i class="first-line">Pomegranate</i>
                                                                    <h3 class="second-line">Vegetables 100% Organic</h3>
                                                                    <p class="third-line">A blend of freshly squeezed green apple & fruits</p>
                                                                    <p class="buttons">
                                                                        <a href="#" class="btn btn-bold">Shop now</a>
                                                                        <a href="#" class="btn btn-thin">View lookbook</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="slide-contain slider-opt03__layout02 slide_animation type_02">
                                                                <div class="media background-geen-02"></div>
                                                                <div class="text-content">
                                                                    <i class="first-line">Pomegranate</i>
                                                                    <h3 class="second-line">Vegetables 100% Organic</h3>
                                                                    <p class="third-line">A blend of freshly squeezed green apple & fruits</p>
                                                                    <p class="buttons">
                                                                        <a href="#" class="btn btn-bold">Shop now</a>
                                                                        <a href="#" class="btn btn-thin">View lookbook</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="slide-contain slider-opt03__layout02 slide_animation type_02">
                                                                <div class="media background-geen-01"></div>
                                                                <div class="text-content">
                                                                    <i class="first-line">Pomegranate</i>
                                                                    <h3 class="second-line">Vegetables 100% Organic</h3>
                                                                    <p class="third-line">A blend of freshly squeezed green apple & fruits</p>
                                                                    <p class="buttons">
                                                                        <a href="#" class="btn btn-bold">Shop now</a>
                                                                        <a href="#" class="btn btn-thin">View lookbook</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="slide-contain slider-opt03__layout02 slide_animation type_02">
                                                                <div class="media background-geen-02"></div>
                                                                <div class="text-content">
                                                                    <i class="first-line">Pomegranate</i>
                                                                    <h3 class="second-line">Vegetables 100% Organic</h3>
                                                                    <p class="third-line">A blend of freshly squeezed green apple & fruits</p>
                                                                    <p class="buttons">
                                                                        <a href="#" class="btn btn-bold">Shop now</a>
                                                                        <a href="#" class="btn btn-thin">View lookbook</a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </li>-->
                        </ul>
                    </div>

                    <!--Block 02: Banners-->
                    <div class="special-slide">
                        <div class="container">
                            <ul class="biolife-carousel dots_ring_style" data-slick='{"arrows": false, "dots": true, "slidesMargin": 30, "slidesToShow": 1, "infinite": true, "speed": 800, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 1}},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":20, "dots": false}},{"breakpoint":480, "settings":{ "slidesToShow": 1}}]}' >
                            <c:forEach var="p" items="${listTop5Newsest}">
                                <li>
                                    <div class="slide-contain biolife-banner__special">
                                        <div class="banner-contain">
                                            <div class="media">
                                                <a href="#" class="bn-link">
                                                    <figure><img src="${p.img}" width="616" height="450" alt="${p.name}"></figure>
                                            </a>
                                        </div>  
                                        <div class="text-content">
                                            <b class="first-line"></b>
                                            <!--<span class="second-line">${p.name}</span>-->
                                            <span class="third-line"><i>${p.name}</i></span>
                                            <h3>${p.description}</h3>
                                            <div class="product-detail">
                                                
                                                <h4 class="product-name"></h4>
                                                <div class="price price-contain">
                                                    <ins><span class="price-amount"><span class="currencySymbol"></span><fmt:formatNumber value="${p.price}" type="currency"/></span></ins>
                                                </div>
                                                <div class="buttons">
                                                    <a onclick="addToCart(${p.id})" class="btn add-to-cart-btn">add to cart</a>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                            <!--                            <li>
                                                            <div class="slide-contain biolife-banner__special">
                                                                <div class="banner-contain">
                                                                    <div class="media">
                                                                        <a href="#" class="bn-link">
                                                                            <figure><img src="assets/images/home-03/bn_special_org.jpg" width="616" height="483" alt=""></figure>
                                                                        </a>
                                                                    </div>
                                                                    <div class="text-content">
                                                                        <b class="first-line">Pomegranate</b>
                                                                        <span class="second-line">Organic Heaven Made</span>
                                                                        <span class="third-line">Easy <i>Healthy, Happy Life</i></span>
                                                                        <div class="product-detail">
                                                                            <h4 class="product-name">National Fresh Fruit Production</h4>
                                                                            <div class="price price-contain">
                                                                                <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                                <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                            </div>
                                                                            <div class="buttons">
                                                                                <a href="#" class="btn add-to-cart-btn"></i>add to cart</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="slide-contain biolife-banner__special">
                                                                <div class="banner-contain">
                                                                    <div class="media">
                                                                        <a href="#" class="bn-link">
                                                                            <figure><img src="assets/images/home-03/bn_special_org.jpg" width="616" height="483" alt=""></figure>
                                                                        </a>
                                                                    </div>
                                                                    <div class="text-content">
                                                                        <b class="first-line">Pomegranate</b>
                                                                        <span class="second-line">Organic Heaven Made</span>
                                                                        <span class="third-line">Easy <i>Healthy, Happy Life</i></span>
                                                                        <div class="product-detail">
                                                                            <h4 class="product-name">National Fresh Fruit Production</h4>
                                                                            <div class="price price-contain">
                                                                                <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                                <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                            </div>
                                                                            <div class="buttons">
                                                                                <a href="#" class="btn add-to-cart-btn">add to cart</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div class="slide-contain biolife-banner__special">
                                                                <div class="banner-contain">
                                                                    <div class="media">
                                                                        <a href="#" class="bn-link">
                                                                            <figure><img src="assets/images/home-03/bn_special_org.jpg" width="616" height="483" alt=""></figure>
                                                                        </a>
                                                                    </div>
                                                                    <div class="text-content">
                                                                        <b class="first-line">Pomegranate</b>
                                                                        <span class="second-line">Organic Heaven Made</span>
                                                                        <span class="third-line">Easy <i>Healthy, Happy Life</i></span>
                                                                        <div class="product-detail">
                                                                            <h4 class="product-name">National Fresh Fruit Production</h4>
                                                                            <div class="price price-contain">
                                                                                <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                                <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                            </div>
                                                                            <div class="buttons">
                                                                                <a href="#" class="btn add-to-cart-btn">add to cart</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>-->
                        </ul>
                        <div class="biolife-service type01 biolife-service__type01 sm-margin-top-0 xs-margin-top-45px">
                            <b class="txt-show-01" >100%Nature</b>
                            <i class="txt-show-02" >Essential Oils</i>
                            <i class="txt-show-02" >Essential Oils</i>
                            <ul class="services-list">
                                <li>
                                    <div class="service-inner color-reverse">
                                        <span class="number">1</span>
                                        <span class="biolife-icon icon-beer"></span>
                                        <a class="srv-name" href="#">Sản phẩm chính hãng</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="service-inner color-reverse">
                                        <span class="number">2</span>
                                        <span class="biolife-icon icon-schedule"></span>
                                        <a class="srv-name" href="#">Đặt hàng dễ dàng</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="service-inner color-reverse">
                                        <span class="number">3</span>
                                        <span class="biolife-icon icon-car"></span>
                                        <a class="srv-name" href="#">Miễn phí giao hàng nội thành</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!--Block 03: Product Tabs-->
                <div class="product-tab z-index-20 sm-margin-top-193px xs-margin-top-30px" id="product-list">
                    <div class="container" >
                        <div class="biolife-title-box" >
                <div class="product-tab z-index-20 sm-margin-top-193px xs-margin-top-30px" id="product-list">
                    <div class="container" >
                        <div class="biolife-title-box" >
                            <span class="subtitle">All the best item for You</span>
                            <h3 class="main-title">Related Products</h3>
                        </div>
                        <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                            <div class="tab-head tab-head__icon-top-layout icon-top-layout">
                                <ul class="tabs md-margin-bottom-35-im xs-margin-bottom-40-im">
                                    <li class="tab-element active">
                                        <a href="#tab01_1st" class="tab-link"><span class="biolife-icon icon-lemon"></span>Oranges</a>
                                    </li>
                                    <li class="tab-element" >
                                        <a href="#tab01_2nd" class="tab-link"><span class="biolife-icon icon-grape2"></span>Grapes</a>
                                    </li>
                                    <li class="tab-element" >
                                        <a href="#tab01_3rd" class="tab-link"><span class="biolife-icon icon-blueberry"></span>Blueberries</a>
                                    </li>
                                    <li class="tab-element" >
                                        <a href="#tab01_4th" class="tab-link"><span class="biolife-icon icon-orange"></span>Lemon</a>
                                    </li>
                                    <li class="tab-element" >
                                        <a href="#tab01_5th" class="tab-link"><span class="biolife-icon icon-broccoli"></span>Vegetables</a>
                                    </li>
                                </ul>
                            </div>

                            <%-- Thiết lập thông tin phân trang --%>

                            <c:set var="pageSize" value="9"/>
                            <c:set var="currentPage" value="${param.page != null ? param.page : 1}"/>
                            <c:set var="start" value="${(currentPage - 1) * pageSize}"/>
                            <c:set var="end" value="${start + pageSize}"/>
                            <c:set var="totalProducts" value="${listP.size()}"/>
                            <c:set var="totalPages" value="${(totalProducts % pageSize == 0) ? (totalProducts / pageSize) : (totalProducts / pageSize + 1)}"/>

                            <div class="row">
                                <c:forEach var="o" items="${listP}" varStatus="status">
                                    <c:if test="${status.index >= start && status.index < end}">
                                        <div class="col-12 col-md-6 col-lg-4">
                                            <div class="product-item">
                                                <div class="contain-product layout-default">
                                                    <div class="product-thumb">
                                                        <a href="detail?pid=${o.id}" class="link-to-product">
                                                            <img src="${o.img}" alt="${o.name}" width="270" height="250" class="product-thumnail">
                                                        </a> 
                                                        <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>
                                                    </div>
                                                    <div class="info">
                                                        <h4 class="product-title"><a href="detail?pid=${o.id}" class="pr-name">${o.name}</a></h4>
                                                        <div class="price">
                                                            <ins><span class="price-amount"><span class="currencySymbol"></span> <fmt:formatNumber value="${o.price}" type="currency"/></span></ins>
                                                        </div>
                                                        <div class="slide-down-box">
                                                        <p class="message">"Tinh dầu cao cấp, thuần khiết & an toàn."</p>
                                                        <div class="buttons">
                                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                            <a onclick="addToCart(${o.id})" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                            <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>



                            </div>
                            <%-- PHÂN TRANG --%>
                            <div class="pagination">
                                <c:if test="${currentPage > 1}">
                                    <a href="home?page=${currentPage - 1}#product-list" class="prev">&laquo; Previous</a>
                                </c:if>

                                
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <a href="home?page=${i}#product-list" class="page-link ${i == currentPage ? 'active' : ''}">${i}</a>
                                </c:forEach>

                                <c:if test="${currentPage < totalPages}">
                                    <a href="home?page=${currentPage + 1}#product-list" class="next">Next &raquo;</a>
                                </c:if>
                            </div>

                                <c:if test="${currentPage < totalPages}">
                                    <a href="home?page=${currentPage + 1}#product-list" class="next">Next &raquo;</a>
                                </c:if>
                            </div>



                           
                            <%-- CSS CHO PHÂN TRANG --%>
                            <style>
                                .pagination {
                                    text-align: center;
                                    margin-top: 20px;
                                }
                                .pagination a {
                                    padding: 8px 16px;
                                    margin: 4px;
                                    border: 1px solid #ddd;
                                    text-decoration: none;
                                    color: #333;
                                    border-radius: 4px;
                                }
                                .pagination a:hover, .pagination a.active {
                                    background-color: #4CAF50;
                                    color: white;
                                }
                                .pagination a.prev, .pagination a.next {
                                    font-weight: bold;
                                }
                            </style>





                            <!--<div class="tab-content">
                                 <div id="tab01_1st" class="tab-contain active">
                                     <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain" data-slick='{"rows":2 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":20}},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>
                                         <li class="product-item">
                                             <div class="contain-product layout-default">
                                                 <div class="product-thumb">
                                                     <a href="#" class="link-to-product">
                                                         <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">
                                                     </a> 
                                                     <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>
                                                 </div>
                                                 <div class="info">
                                                     <b class="categories">Vegetables</b>
                                                     <h4 class="product-title"><a href="#" class="pr-name">Organic Hass Avocado, Large</a></h4>
                                                     <div class="price ">
                                                         <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                         <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                     </div>
                                                     <div class="slide-down-box">
                                                         <p class="message">All products are carefully selected to ensure food safety.</p>
                                                         <div class="buttons">
                                                             <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                             <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                             <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </li>
                                         
                                         <li class="product-item">
                                             <div class="contain-product layout-default">
                                                 <div class="product-thumb">
                                                     <a href="#" class="link-to-product">
                                                         <img src="assets/images/products/p-07.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">
                                                     </a>
                                                     <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>
                                                 </div>
                                                 <div class="info">
                                                     <b class="categories">Vegetables</b>
                                                     <h4 class="product-title"><a href="#" class="pr-name">13 Healing Powers of Lemons</a></h4>
                                                     <div class="price ">
                                                         <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                         <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                     </div>
                                                     <div class="slide-down-box">
                                                         <p class="message">All products are carefully selected to ensure food safety.</p>
                                                         <div class="buttons">
                                                             <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                             <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                             <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </li>
                                     </ul>
                                 </div>
                                 <div id="tab01_2nd" class="tab-contain ">
                                     <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain" data-slick='{"rows":2 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":20}},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>
                                         <li class="product-item">
                                             <div class="contain-product layout-default">
                                                 <div class="product-thumb">
                                                     <a href="#" class="link-to-product">
                                                         <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">
                                                     </a>
                                                     <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>
                                                 </div>
                                                 <div class="info">
                                                     <b class="categories">Vegetables</b>
                                                     <h4 class="product-title"><a href="#" class="pr-name">Organic Hass Avocado, Large</a></h4>
                                                     <div class="price ">
                                                         <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                         <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                     </div>
                                                     <div class="slide-down-box">
                                                         <p class="message">All products are carefully selected to ensure food safety.</p>
                                                         <div class="buttons">
                                                             <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                             <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                             <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </li>
                                         <li class="product-item">
                                             <div class="contain-product layout-default">
                                                 <div class="product-thumb">
                                                     <a href="#" class="link-to-product">
                                                         <img src="assets/images/products/p-07.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">
                                                     </a>
                                                     <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>
                                                 </div>
                                                 <div class="info">
                                                     <b class="categories">Vegetables</b>
                                                     <h4 class="product-title"><a href="#" class="pr-name">13 Healing Powers of Lemons</a></h4>
                                                     <div class="price ">
                                                         <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                         <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                     </div>
                                                     <div class="slide-down-box">
                                                         <p class="message">All products are carefully selected to ensure food safety.</p>
                                                         <div class="buttons">
                                                             <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                             <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                             <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </li>
                                         
                                       
                                         <li class="product-item">
                                             <div class="contain-product layout-default">
                                                 <div class="product-thumb">
                                                     <a href="#" class="link-to-product">
                                                         <img src="assets/images/products/p-22.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">
                                                     </a>
                                                     <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>
                                                 </div>
                                                 <div class="info">
                                                     <b class="categories">Vegetables</b>
                                                     <h4 class="product-title"><a href="#" class="pr-name">Cherry Tomato Seeds</a></h4>
                                                     <div class="price ">
                                                         <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                         <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                     </div>
                                                     <div class="slide-down-box">
                                                         <p class="message">All products are carefully selected to ensure food safety.</p>
                                                         <div class="buttons">
                                                             <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                             <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                             <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </li>
                                     </ul>
                                 </div>
                                 <div id="tab01_3rd" class="tab-contain ">
                                     <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile eq-height-contain" data-slick='{"rows":2 ,"arrows":true,"dots":false,"infinite":true,"speed":400,"slidesMargin":10,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":20}},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":15}}]}'>
                                         <li class="product-item">
                                             <div class="contain-product layout-default">
                                                 <div class="product-thumb">
                                                     <a href="#" class="link-to-product">
                                                         <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">
                                                     </a>
                                                     <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>
                                                 </div>
                                                 <div class="info">
                                                     <b class="categories">Vegetables</b>
                                                     <h4 class="product-title"><a href="#" class="pr-name">Organic Hass Avocado, Large</a></h4>
                                                     <div class="price ">
                                                         <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                         <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                     </div>
                                                     <div class="slide-down-box">
                                                         <p class="message">All products are carefully selected to ensure food safety.</p>
                                                         <div class="buttons">
                                                             <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                             <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                             <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </li>
                                         <li class="product-item">
                                             <div class="contain-product layout-default">
                                                 <div class="product-thumb">
                                                     <a href="#" class="link-to-product">
                                                         <img src="assets/images/products/p-03.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">
                                                     </a>
                                                     <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>
                                                 </div>
                                                 <div class="info">
                                                     <b class="categories">Vegetables</b>
                                                     <h4 class="product-title"><a href="#" class="pr-name">Passover Cauliflower Kugel</a></h4>
                                                     <div class="price ">
                                                         <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                         <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                     </div>
                                                     <div class="slide-down-box">
                                                         <p class="message">All products are carefully selected to ensure food safety.</p>
                                                         <div class="buttons">
                                                             <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                             <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                             <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </li>
                                         <li class="product-item">
                                             <div class="contain-product layout-default">
                                                 <div class="product-thumb">
                                                     <a href="#" class="link-to-product">
                                                         <img src="assets/images/products/p-05.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">
                                                     </a>
                                                     <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>
                                                 </div>
                                                 <div class="info">
                                                     <b class="categories">Vegetables</b>
                                                     <h4 class="product-title"><a href="#" class="pr-name">Organic Hass Avocado</a></h4>
                                                     <div class="price ">
                                                         <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                         <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                     </div>
                                                     <div class="slide-down-box">
                                                         <p class="message">All products are carefully selected to ensure food safety.</p>
                                                         <div class="buttons">
                                                             <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                             <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                             <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </li>
                                         
                                         <li class="product-item">
                                             <div class="contain-product layout-default">
                                                 <div class="product-thumb">
                                                     <a href="#" class="link-to-product">
                                                         <img src="assets/images/products/p-18.jpg" alt="Vegetables" width="270" height="270" class="product-thumnail">
                                                     </a>
                                                     <a class="lookup btn_call_quickview" href="#"><i class="biolife-icon icon-search"></i></a>
                                                 </div>
                                                 <div class="info">
                                                     <b class="categories">Vegetables</b>
                                                     <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                     <div class="price ">
                                                         <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                         <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                     </div>
                                                     <div class="slide-down-box">
                                                         <p class="message">All products are carefully selected to ensure food safety.</p>
                                                         <div class="buttons">
                                                             <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                             <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                             <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </li>
                                     </ul>
                                 </div>
                             </div>-->
                        </div>
                    </div>
                </div>

                <!--Block 04: Banner Promotion 01-->
                <div class="banner-promotion-01 xs-margin-top-50px sm-margin-top-70px">
                    <div class="biolife-banner promotion3 biolife-banner__promotion3 green-style">
                        <div class="banner-contain">
                            <div class="media">
                                <div class="img-moving position-1">
                                    <img src="assets/images/home-03/img-moving-pst-1-geen.png" width="149" height="139" alt="img msv">
                                </div>
                            </div>
                            <div class="text-content">
                                <div class="container text-wrap">
                                    <span class="first-line">Healthy Food</span>
                                    <b class="second-line">Vegetable Always fresh</b>
                                    <p class="third-line">Food Heaven Made Easy sounds like the name of an amazingly delicious food delivery service, but don't be fooled...</p>
                                    <div class="product-detail">
                                        <p class="txt-price"><span>Only:</span>$8.00</p>
                                        <a href="#" class="btn add-to-cart-btn">add to cart</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Block 05: Banner promotion 02-->
                <div class="banner-promotion-02 z-index-20">
                    <div class="biolife-banner promotion2 biolife-banner__promotion2 advance">
                        <div class="banner-contain">
                            <div class="container">
                                <div class="media"></div>
                                <div class="text-content">
                                    <b class="first-line">Food Heaven Made</b>
                                    <span class="second-line">Easy <i>Healthy, Happy Life</i></span>
                                    <p class="third-line">Food Heaven Made Easy sounds like the name of an amazingly delicious food delivery service, but don't be fooled. The blog is actually a compilation of recipes, cooking videos, and nutrition tips.</p>
                                    <p class="buttons">
                                        <a href="#" class="btn btn-bold">Read More</a>
                                        <a href="#" class="btn btn-thin">View Menu Now</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Block 06: Products-->
                <div class="Product-box sm-margin-top-96px">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-5 col-sm-6">
                                <div class="advance-product-box">
                                    <div class="biolife-title-box bold-style biolife-title-box__bold-style">
                                        <h3 class="title">Deals of the day</h3>
                                    </div>
                                    <ul class="products biolife-carousel nav-top-right nav-none-on-mobile" data-slick='{"arrows":true, "dots":false, "infinite":false, "speed":400, "slidesMargin":30, "slidesToShow":1}'>
                                        <li class="product-item">
                                            <div class="contain-product deal-layout contain-product__deal-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/home-03/product_deal_330x330.jpg" alt="dd" width="330" height="330" class="product-thumnail">
                                                    </a>
                                                    <div class="labels">
                                                        <span class="sale-label">-50%</span>
                                                    </div>
                                                </div>
                                                <div class="info">
                                                    <div class="biolife-countdown" data-datetime="2020-01-18 00:00 +00:00"></div>
                                                    <b class="categories">Fresh Fruit</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="slide-down-box">
                                                        <p class="message">All products are carefully selected to ensure food safety.</p>
                                                        <div class="buttons">
                                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                            <a href="#" class="btn add-to-cart-btn">add to cart</a>
                                                            <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="product-item">
                                            <div class="contain-product deal-layout contain-product__deal-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/home-03/product_deal-02_330x330.jpg" alt="dd" width="330" height="330" class="product-thumnail">
                                                    </a>
                                                    <div class="labels">
                                                        <span class="sale-label">-50%</span>
                                                    </div>
                                                </div>
                                                <div class="info">
                                                    <div class="biolife-countdown" data-datetime="2020-01-03 00:00 +00:00"></div>
                                                    <b class="categories">Fresh Fruit</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="slide-down-box">
                                                        <p class="message">All products are carefully selected to ensure food safety.</p>
                                                        <div class="buttons">
                                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                            <a href="#" class="btn add-to-cart-btn">add to cart</a>
                                                            <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="product-item">
                                            <div class="contain-product deal-layout contain-product__deal-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/home-03/product_deal-03_330x330.jpg" alt="dd" width="330" height="330" class="product-thumnail">
                                                    </a>
                                                    <div class="labels">
                                                        <span class="sale-label">-50%</span>
                                                    </div>
                                                </div>
                                                <div class="info">
                                                    <div class="biolife-countdown" data-datetime="2020-02-05 00:00 +00:00"></div>
                                                    <b class="categories">Fresh Fruit</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="slide-down-box">
                                                        <p class="message">All products are carefully selected to ensure food safety.</p>
                                                        <div class="buttons">
                                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                            <a href="#" class="btn add-to-cart-btn">add to cart</a>
                                                            <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-7 col-sm-6">
                                <div class="advance-product-box">
                                    <div class="biolife-title-box bold-style biolife-title-box__bold-style">
                                        <h3 class="title">Top Rated Products</h3>
                                    </div>
                                    <ul class="products biolife-carousel nav-center-03 nav-none-on-mobile row-space-29px" data-slick='{"rows":2,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":2,"responsive":[{"breakpoint":1200,"settings":{ "rows":2, "slidesToShow": 2}},{"breakpoint":992, "settings":{ "rows":2, "slidesToShow": 1}},{"breakpoint":768, "settings":{ "rows":2, "slidesToShow": 2}},{"breakpoint":500, "settings":{ "rows":2, "slidesToShow": 1}}]}'>
                                        <li class="product-item">
                                            <div class="contain-product right-info-layout contain-product__right-info-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/products/p-19.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <b class="categories">Vegetables</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">Pumpkins Fairytale</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="rating">
                                                        <p class="star-rating"><span class="width-80percent"></span></p>
                                                        <span class="review-count">(05 Reviews)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="product-item">
                                            <div class="contain-product right-info-layout contain-product__right-info-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/products/p-03.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <b class="categories">Vegetables</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">Passover Cauliflower</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="rating">
                                                        <p class="star-rating"><span class="width-80percent"></span></p>
                                                        <span class="review-count">(05 Reviews)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="product-item">
                                            <div class="contain-product right-info-layout contain-product__right-info-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/products/p-02.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <b class="categories">Vegetables</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">Hot Chili Peppers</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="rating">
                                                        <p class="star-rating"><span class="width-80percent"></span></p>
                                                        <span class="review-count">(05 Reviews)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="product-item">
                                            <div class="contain-product right-info-layout contain-product__right-info-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/products/p-22.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <b class="categories">Vegetables</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">Cherry Tomato Seeds</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="rating">
                                                        <p class="star-rating"><span class="width-80percent"></span></p>
                                                        <span class="review-count">(05 Reviews)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="product-item">
                                            <div class="contain-product right-info-layout contain-product__right-info-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/products/p-20.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <b class="categories">Vegetables</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="rating">
                                                        <p class="star-rating"><span class="width-80percent"></span></p>
                                                        <span class="review-count">(05 Reviews)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="product-item">
                                            <div class="contain-product right-info-layout contain-product__right-info-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/products/p-05.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <b class="categories">Vegetables</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">Organic Hass Avocado</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="rating">
                                                        <p class="star-rating"><span class="width-80percent"></span></p>
                                                        <span class="review-count">(05 Reviews)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="product-item">
                                            <div class="contain-product right-info-layout contain-product__right-info-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/products/p-06.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <b class="categories">Vegetables</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">Packham's Pears</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="rating">
                                                        <p class="star-rating"><span class="width-80percent"></span></p>
                                                        <span class="review-count">(05 Reviews)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="product-item">
                                            <div class="contain-product right-info-layout contain-product__right-info-layout">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="assets/images/products/p-20.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <b class="categories">Vegetables</b>
                                                    <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                    <div class="price ">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="rating">
                                                        <p class="star-rating"><span class="width-80percent"></span></p>
                                                        <span class="review-count">(05 Reviews)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="biolife-banner style-01 biolife-banner__style-01 sm-margin-top-30px xs-margin-top-80px">
                                        <div class="banner-contain">
                                            <a href="#" class="bn-link"></a>
                                            <div class="text-content">
                                                <span class="first-line">Daily Fresh</span>
                                                <b class="second-line">Natural</b>
                                                <i class="third-line">Fresh Food</i>
                                                <span class="fourth-line">Premium Quality</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Block 07: Brands-->
                <div class="brand-slide sm-margin-top-100px background-fafafa xs-margin-top-80px xs-margin-bottom-80px">
                    <div class="container">
                        <ul class="biolife-carousel nav-center-bold nav-none-on-mobile" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":4, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3}},{"breakpoint":768, "settings":{ "slidesToShow": 1}}]}'>
                            <li>
                                <div class="biolife-brd-container">
                                    <a href="#" class="link">
                                        <figure><img src="assets/images/home-03/brd-01.jpg" width="214" height="163" alt=""></figure>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="biolife-brd-container">
                                    <a href="#" class="link">
                                        <figure><img src="assets/images/home-03/brd-02.jpg" width="214" height="163" alt=""></figure>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="biolife-brd-container">
                                    <a href="#" class="link">
                                        <figure><img src="assets/images/home-03/brd-03.jpg" width="153" height="163" alt=""></figure>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="biolife-brd-container">
                                    <a href="#" class="link">
                                        <figure><img src="assets/images/home-03/brd-04.jpg" width="224" height="163" alt=""></figure>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="biolife-brd-container">
                                    <a href="#" class="link">
                                        <figure><img src="assets/images/home-03/brd-01.jpg" width="214" height="163" alt=""></figure>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="biolife-brd-container">
                                    <a href="#" class="link">
                                        <figure><img src="assets/images/home-03/brd-02.jpg" width="214" height="163" alt=""></figure>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="biolife-brd-container">
                                    <a href="#" class="link">
                                        <figure><img src="assets/images/home-03/brd-03.jpg" width="153" height="163" alt=""></figure>
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="biolife-brd-container">
                                    <a href="#" class="link">
                                        <figure><img src="assets/images/home-03/brd-04.jpg" width="224" height="163" alt=""></figure>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>



                <!--Block 08: Blog Posts-->
                <div class="blog-posts sm-margin-top-93px sm-padding-top-72px xs-padding-bottom-50px">
                    <div class="container">
                        <div class="biolife-title-box">
                            <span class="subtitle">The freshest and most exciting news</span>
                            <h3 class="main-title">From the Blog</h3>
                        </div>
                        <ul class="biolife-carousel nav-center nav-none-on-mobile xs-margin-top-36px" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":3, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 3}},{"breakpoint":992, "settings":{ "slidesToShow": 2}},{"breakpoint":768, "settings":{ "slidesToShow": 2}},{"breakpoint":600, "settings":{ "slidesToShow": 1}}]}'>
                            <li>
                                <div class="post-item style-bottom-info layout-02 ">
                                    <div class="thumbnail">
                                        <a href="#" class="link-to-post"><img src="assets/images/our-blog/post-thumb-01.jpg" width="370" height="270" alt=""></a>
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <span class="month">dec</span>
                                        </div>
                                    </div>
                                    <div class="post-content">
                                        <h4 class="post-name"><a href="#" class="linktopost">Ashwagandha: The #1 Herb in the World for Anxiety?</a></h4>
                                        <div class="post-meta">
                                            <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>
                                            <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>
                                            <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>
                                            <div class="post-meta__item post-meta__item-social-box">
                                                <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>
                                                <div class="inner-content">
                                                    <ul class="socials">
                                                        <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="excerpt">Did you know that red-staining foods are excellent lymph-movers? In fact, many plants that were historically used as dyes...</p>
                                        <div class="group-buttons">
                                            <a href="#" class="btn readmore">continue reading</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="post-item style-bottom-info layout-02">
                                    <div class="thumbnail">
                                        <a href="#" class="link-to-post"><img src="assets/images/our-blog/post-thumb-02.jpg" width="370" height="270" alt=""></a>
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <span class="month">dec</span>
                                        </div>
                                    </div>
                                    <div class="post-content">
                                        <h4 class="post-name"><a href="#" class="linktopost">Ashwagandha: The #1 Herb in the World for Anxiety?</a></h4>
                                        <div class="post-meta">
                                            <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>
                                            <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>
                                            <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>
                                            <div class="post-meta__item post-meta__item-social-box">
                                                <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>
                                                <div class="inner-content">
                                                    <ul class="socials">
                                                        <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="excerpt">Did you know that red-staining foods are excellent lymph-movers? In fact, many plants that were historically used as dyes...</p>
                                        <div class="group-buttons">
                                            <a href="#" class="btn readmore">continue reading</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="post-item style-bottom-info layout-02">
                                    <div class="thumbnail">
                                        <a href="#" class="link-to-post"><img src="assets/images/our-blog/post-thumb-04.jpg" width="370" height="270" alt=""></a>
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <span class="month">dec</span>
                                        </div>
                                    </div>
                                    <div class="post-content">
                                        <h4 class="post-name"><a href="#" class="linktopost">Ashwagandha: The #1 Herb in the World for Anxiety?</a></h4>
                                        <div class="post-meta">
                                            <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>
                                            <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>
                                            <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>
                                            <div class="post-meta__item post-meta__item-social-box">
                                                <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>
                                                <div class="inner-content">
                                                    <ul class="socials">
                                                        <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="excerpt">Did you know that red-staining foods are excellent lymph-movers? In fact, many plants that were historically used as dyes...</p>
                                        <div class="group-buttons">
                                            <a href="#" class="btn readmore">continue reading</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="post-item style-bottom-info layout-02">
                                    <div class="thumbnail">
                                        <a href="#" class="link-to-post"><img src="assets/images/our-blog/post-thumb-03.jpg" width="370" height="270" alt=""></a>
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <span class="month">dec</span>
                                        </div>
                                    </div>
                                    <div class="post-content">
                                        <h4 class="post-name"><a href="#" class="linktopost">Ashwagandha: The #1 Herb in the World for Anxiety?</a></h4>
                                        <div class="post-meta">
                                            <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>
                                            <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>
                                            <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>
                                            <div class="post-meta__item post-meta__item-social-box">
                                                <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>
                                                <div class="inner-content">
                                                    <ul class="socials">
                                                        <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="excerpt">Did you know that red-staining foods are excellent lymph-movers? In fact, many plants that were historically used as dyes...</p>
                                        <div class="group-buttons">
                                            <a href="#" class="btn readmore">continue reading</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="post-item style-bottom-info layout-02">
                                    <div class="thumbnail">
                                        <a href="#" class="link-to-post"><img src="assets/images/our-blog/post-thumb-05.jpg" width="370" height="270" alt=""></a>
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <span class="month">dec</span>
                                        </div>
                                    </div>
                                    <div class="post-content">
                                        <h4 class="post-name"><a href="#" class="linktopost">Ashwagandha: The #1 Herb in the World for Anxiety?</a></h4>
                                        <div class="post-meta">
                                            <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>
                                            <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>
                                            <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>
                                            <div class="post-meta__item post-meta__item-social-box">
                                                <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>
                                                <div class="inner-content">
                                                    <ul class="socials">
                                                        <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="excerpt">Did you know that red-staining foods are excellent lymph-movers? In fact, many plants that were historically used as dyes...</p>
                                        <div class="group-buttons">
                                            <a href="#" class="btn readmore">continue reading</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="post-item style-bottom-info layout-02">
                                    <div class="thumbnail">
                                        <a href="#" class="link-to-post"><img src="assets/images/our-blog/post-thumb-06.jpg" width="370" height="270" alt=""></a>
                                        <div class="post-date">
                                            <span class="date">26</span>
                                            <span class="month">dec</span>
                                        </div>
                                    </div>
                                    <div class="post-content">
                                        <h4 class="post-name"><a href="#" class="linktopost">Ashwagandha: The #1 Herb in the World for Anxiety?</a></h4>
                                        <div class="post-meta">
                                            <a href="#" class="post-meta__item author"><img src="assets/images/home-03/post-author.png" width="28" height="28" alt=""><span>Admin</span></a>
                                            <a href="#" class="post-meta__item btn liked-count">2<span class="biolife-icon icon-comment"></span></a>
                                            <a href="#" class="post-meta__item btn comment-count">6<span class="biolife-icon icon-like"></span></a>
                                            <div class="post-meta__item post-meta__item-social-box">
                                                <span class="tbn"><i class="fa fa-share-alt" aria-hidden="true"></i></span>
                                                <div class="inner-content">
                                                    <ul class="socials">
                                                        <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                                        <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="excerpt">Did you know that red-staining foods are excellent lymph-movers? In fact, many plants that were historically used as dyes...</p>
                                        <div class="group-buttons">
                                            <a href="#" class="btn readmore">continue reading</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>

        <!-- FOOTER -->
        <jsp:include page="Footer.jsp"></jsp:include>

        <!--        <footer id="footer" class="footer layout-03">
                    <div class="footer-content background-footer-03">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-9">
                                    <section class="footer-item">
                                        <a href="home-03-green.html" class="logo footer-logo"><img src="hinh anh/Logo/logo-gia-truyen-hong-duc1.png" alt="biolife logo" width="220" height="60"></a>
                                        <div class="footer-phone-info">
                                            <i class="biolife-icon icon-head-phone"></i>
                                            <p class="r-info">
                                                <span>Got Questions ?</span>
                                                <span>0914 145 788</span>
                                            </p>
                                        </div>
                                        <div class="newsletter-block layout-01">
                                            <h4 class="title">Newsletter Signup</h4>
                                            <div class="form-content">
                                                <form action="#" name="new-letter-foter">
                                                    <input type="email" class="input-text email" value="" placeholder="Your email here...">
                                                    <button type="submit" class="bnt-submit" name="ok">Sign up</button>
                                                </form>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 md-margin-top-5px sm-margin-top-50px xs-margin-top-40px">
                                    <section class="footer-item">
                                        <h3 class="section-title">Thông tin cần thiết</h3>
                                        <div class="row">
                                            <div class="col-lg-6 col-sm-6 col-xs-6">
                                                <div class="wrap-custom-menu vertical-menu-2">
                                                    <ul class="menu">
                                                        <li><a href="#">About Us</a></li>
                                                        <li><a href="#">Giới thiệu cửa hàng</a></li>
                                                        <li><a href="#">Mua sắm an toàn</a></li>
                                                        <li><a href="#">Thông tin giao hàng</a></li>
                                                        <li><a href="#">Chính sách bảo mật</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-sm-6 col-xs-6">
                                                <div class="wrap-custom-menu vertical-menu-2">
                                                    <ul class="menu">
                                                        <li><a href="#">Liên hệ với chúng tôi</a></li>
                                                        <li><a href="#">Đổi mới sáng tạo</a></li>
                                                        <li><a href="#">Khách hàng đánh giá</a></li>
                                                        <li><a href="#">Điều khoản sử dụng</a></li>
                                                        <li><a href="#">Chính sách đổi trả</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 md-margin-top-5px sm-margin-top-50px xs-margin-top-40px">
                                    <section class="footer-item">
                                        <h3 class="section-title">Chi nhánh trung tâm</h3>
                                        <div class="contact-info-block footer-layout xs-padding-top-10px">
                                            <ul class="contact-lines">
                                                <li>
                                                    <p class="info-item">
                                                        <i class="biolife-icon icon-location"></i>
                                                        <b class="desc">67 Nguyễn Phúc Thái - Phường Kim Long - Thành Phố Thừa Thiên Huế . , Hue, Vietnam</b>
                                                    </p>
                                                </li>
                                                <li>
                                                    <p class="info-item">
                                                        <i class="biolife-icon icon-phone"></i>
                                                        <b class="desc">Phone: 0914 145 788</b>
                                                    </p>
                                                </li>
                                                <li>
                                                    <p class="info-item">
                                                        <i class="biolife-icon icon-letter"></i>
                                                        <b class="desc">Email:  hoan64735@gmail.com</b>
                                                    </p>
                                                </li>
                                                <li>
                                                    <p class="info-item">
                                                        <i class="biolife-icon icon-clock"></i>
                                                        <b class="desc">Works: 7 am - 5.30 pm</b>
                                                    </p>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="biolife-social inline">
                                            <ul class="socials">
                                                <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                                <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                                <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                    </section>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="separator sm-margin-top-62px xs-margin-top-40px"></div>
                                </div>
                                                        <div class="col-lg-6 col-sm-6 col-xs-12">
                                                            <div class="copy-right-text"><p><a href="templateshub.net">Templates Hub</a></p></div>
                                                        </div>
                                <div class="col-lg-6 col-sm-6 col-xs-12">
                                                                <div class="payment-methods">
                                                                    <ul>
                                                                        <li><a href="#" class="payment-link"><img src="assets/images/card1.jpg" width="51" height="36" alt=""></a></li>
                                                                        <li><a href="#" class="payment-link"><img src="assets/images/card2.jpg" width="51" height="36" alt=""></a></li>
                                                                        <li><a href="#" class="payment-link"><img src="assets/images/card3.jpg" width="51" height="36" alt=""></a></li>
                                                                        <li><a href="#" class="payment-link"><img src="assets/images/card4.jpg" width="51" height="36" alt=""></a></li>
                                                                        <li><a href="#" class="payment-link"><img src="assets/images/card5.jpg" width="51" height="36" alt=""></a></li>
                                                                    </ul>
                                                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>-->

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


        <div id="biolife-quickview-block" class="biolife-quickview-block">
            <div class="quickview-container">
                <a href="#" class="btn-close-quickview" data-object="open-quickview-block"><span class="biolife-icon icon-close-menu"></span></a>
                <div class="biolife-quickview-inner">
                    <div class="media">
                        <ul class="biolife-carousel quickview-for" data-slick='{"arrows":false,"dots":false,"slidesMargin":30,"slidesToShow":1,"slidesToScroll":1,"fade":true,"asNavFor":".quickview-nav"}'>
                            <li><img src="assets/images/details-product/detail_01.jpg" alt="" width="500" height="500"></li>
                            <li><img src="assets/images/details-product/detail_02.jpg" alt="" width="500" height="500"></li>
                            <li><img src="assets/images/details-product/detail_03.jpg" alt="" width="500" height="500"></li>
                            <li><img src="assets/images/details-product/detail_04.jpg" alt="" width="500" height="500"></li>
                            <li><img src="assets/images/details-product/detail_05.jpg" alt="" width="500" height="500"></li>
                            <li><img src="assets/images/details-product/detail_06.jpg" alt="" width="500" height="500"></li>
                            <li><img src="assets/images/details-product/detail_07.jpg" alt="" width="500" height="500"></li>
                        </ul>
                        <ul class="biolife-carousel quickview-nav" data-slick='{"arrows":true,"dots":false,"centerMode":false,"focusOnSelect":true,"slidesMargin":10,"slidesToShow":3,"slidesToScroll":1,"asNavFor":".quickview-for"}'>
                            <li><img src="assets/images/details-product/thumb_01.jpg" alt="" width="88" height="88"></li>
                            <li><img src="assets/images/details-product/thumb_02.jpg" alt="" width="88" height="88"></li>
                            <li><img src="assets/images/details-product/thumb_03.jpg" alt="" width="88" height="88"></li>
                            <li><img src="assets/images/details-product/thumb_04.jpg" alt="" width="88" height="88"></li>
                            <li><img src="assets/images/details-product/thumb_05.jpg" alt="" width="88" height="88"></li>
                            <li><img src="assets/images/details-product/thumb_06.jpg" alt="" width="88" height="88"></li>
                            <li><img src="assets/images/details-product/thumb_07.jpg" alt="" width="88" height="88"></li>
                        </ul>
                    </div>
                    <div class="product-attribute">
                        <h4 class="title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                        <div class="rating">
                            <p class="star-rating"><span class="width-80percent"></span></p>
                        </div>

                        <div class="price price-contain">
                            <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                            <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                        </div>
                        <p class="excerpt">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel maximus lacus. Duis ut mauris eget justo dictum tempus sed vel tellus.</p>
                        <div class="from-cart">
                            <div class="qty-input">
                                <input type="text" name="qty12554" value="1" data-max_value="20" data-min_value="1" data-step="1">
                                <a href="#" class="qty-btn btn-up"><i class="fa fa-caret-up" aria-hidden="true"></i></a>
                                <a href="#" class="qty-btn btn-down"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
                            </div>
                            <div class="buttons">
                                <a href="#" class="btn add-to-cart-btn btn-bold">add to cart</a>
                            </div>
                        </div>

                        <div class="product-meta">
                            <div class="product-atts">
                                <div class="product-atts-item">
                                    <b class="meta-title">Categories:</b>
                                    <ul class="meta-list">
                                        <li><a href="#" class="meta-link">Milk & Cream</a></li>
                                        <li><a href="#" class="meta-link">Fresh Meat</a></li>
                                        <li><a href="#" class="meta-link">Fresh Fruit</a></li>
                                    </ul>
                                </div>
                                <div class="product-atts-item">
                                    <b class="meta-title">Tags:</b>
                                    <ul class="meta-list">
                                        <li><a href="#" class="meta-link">food theme</a></li>
                                        <li><a href="#" class="meta-link">organic food</a></li>
                                        <li><a href="#" class="meta-link">organic theme</a></li>
                                    </ul>
                                </div>
                                <div class="product-atts-item">
                                    <b class="meta-title">Brand:</b>
                                    <ul class="meta-list">
                                        <li><a href="#" class="meta-link">Fresh Fruit</a></li>
                                    </ul>
                                </div>
                            </div>
                            <span class="sku">SKU: N/A</span>
                            <div class="biolife-social inline add-title">
                                <span class="fr-title">Share:</span>
                                <ul class="socials">
                                    <li><a href="#" title="twitter" class="socail-btn"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#" title="facebook" class="socail-btn"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#" title="pinterest" class="socail-btn"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                    <li><a href="#" title="youtube" class="socail-btn"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                    <li><a href="#" title="instagram" class="socail-btn"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
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
         <!-- Replace your entire chat widget implementation with this code -->
<style>
    #chat-button {
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background-color: #4CAF50;
        box-shadow: 0 3px 10px rgba(0,0,0,0.3);
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 9999;
        transition: transform 0.3s;
    }
    
    #chat-button:hover {
        transform: scale(1.05);
    }
    
    #chat-container {
        position: fixed;
        bottom: 90px;
        right: 20px;
        width: 350px;
        height: 500px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        z-index: 9998;
        display: none;
        overflow: hidden;
        flex-direction: column;
    }
    
    .chat-header {
        background: #4CAF50;
        color: white;
        padding: 15px;
        text-align: center;
        font-size: 18px;
        display: flex;
        justify-content: space-between;
    }
    
    .chat-close {
        cursor: pointer;
        font-weight: bold;
        font-size: 20px;
    }
    
    .chat-messages {
        padding: 15px;
        height: 380px;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
    }
    
    .message {
        margin-bottom: 15px;
        clear: both;
        max-width: 80%;
    }
    
    .user-message {
        background: #e0e0e0;
        color: #333;
        padding: 10px 15px;
        border-radius: 18px;
        float: right;
        align-self: flex-end;
    }
    
    .bot-message {
        background: #4CAF50;
        color: white;
        padding: 10px 15px;
        border-radius: 18px;
        float: left;
        align-self: flex-start;
    }
    
    .chat-input {
        display: flex;
        padding: 10px;
        border-top: 1px solid #e0e0e0;
    }
    
    .chat-input input {
        flex: 1;
        padding: 10px;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        margin-right: 10px;
    }
    
    .chat-input button {
        background: #4CAF50;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 4px;
        cursor: pointer;
    }
</style>

<!-- Chat Button -->
<div id="chat-button">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
    </svg>
</div>

<!-- Chat Container (Replaces iframe with direct interface) -->
<div id="chat-container">
    <div class="chat-header">
        <span>Wiish - Hỗ trợ mua tinh dầu</span>
        <span class="chat-close" id="chat-close">&times;</span>
    </div>
    <div class="chat-messages" id="chat-messages">
        <!-- Messages will be added here dynamically -->
    </div>
    <div class="chat-input">
        <input type="text" id="user-input" placeholder="Nhập câu hỏi của bạn...">
        <button id="send-button">Gửi</button>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const chatButton = document.getElementById('chat-button');
    const chatContainer = document.getElementById('chat-container');
    const chatClose = document.getElementById('chat-close');
    const messagesContainer = document.getElementById('chat-messages');
    const userInput = document.getElementById('user-input');
    const sendButton = document.getElementById('send-button');
    
    // Add welcome message when chat is first opened
    let isFirstOpen = true;
    
    // Open chat
    chatButton.addEventListener('click', function() {
        chatContainer.style.display = 'flex';
        
        if (isFirstOpen) {
            addBotMessage("Xin chào! Mình là Wiish - trợ lý ảo của shop tinh dầu. Bạn cần hỗ trợ gì nào?");
            isFirstOpen = false;
        }
        
        userInput.focus();
    });
    
    // Close chat
    chatClose.addEventListener('click', function() {
        chatContainer.style.display = 'none';
    });
    
    // Send message
    function sendMessage() {
        const message = userInput.value.trim();
        if (message === '') return;
        
        // Add user message to chat
        addUserMessage(message);
        userInput.value = '';
        
        // Show typing indicator
        const typingIndicator = document.createElement('div');
        typingIndicator.className = 'message bot-message';
        typingIndicator.id = 'typing-indicator';
        typingIndicator.innerText = 'Đang trả lời...';
        messagesContainer.appendChild(typingIndicator);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
        
        // Send request to Flask backend
        fetch('http://localhost:5000/chat', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ message: message })
        })
        .then(response => response.json())
        .then(data => {
            // Remove typing indicator
            const indicator = document.getElementById('typing-indicator');
            if (indicator) messagesContainer.removeChild(indicator);
            
            // Add bot response
            addBotMessage(data.response);
        })
        .catch(error => {
            // Remove typing indicator
            const indicator = document.getElementById('typing-indicator');
            if (indicator) messagesContainer.removeChild(indicator);
            
            // Show error message
            addBotMessage("Xin lỗi, có lỗi khi kết nối với máy chủ. Vui lòng thử lại sau.");
            console.error('Error:', error);
        });
    }
    
    // Add event listeners for sending
    sendButton.addEventListener('click', sendMessage);
    userInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            sendMessage();
        }
    });
    
    // Function to add user message to chat
    function addUserMessage(message) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'message user-message';
        messageDiv.innerText = message;
        messagesContainer.appendChild(messageDiv);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
    
    // Function to add bot message to chat
    function addBotMessage(message) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'message bot-message';
        
        // Handle markdown-like formatting from Python
        message = message.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');
        message = message.replace(/\n/g, '<br>');
        
        messageDiv.innerHTML = message;
        messagesContainer.appendChild(messageDiv);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
});
</script>
    </body>

</html>