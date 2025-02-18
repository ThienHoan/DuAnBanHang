
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Biolife - Organic Food</title>
        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/slick.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/main-color.css">
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
        <jsp:include page="Menu.jsp" ></jsp:include>

        <!--Hero Section-->
        <div class="hero-section hero-background">
            <h1 class="page-title">Organic Fruits</h1>
        </div>

        <!--Navigation section-->
        <div class="container">
            <nav class="biolife-nav">
                <ul>
                    <li class="nav-item"><a href="index-2.html" class="permal-link">Home</a></li>
                    <li class="nav-item"><a href="#" class="permal-link">Natural Organic</a></li>
                    <li class="nav-item"><span class="current-page">Fresh Fruit</span></li>
                </ul>
            </nav>
        </div>

        <div class="page-contain category-page left-sidebar">
            <div class="container">
                <div class="row">
                    <!-- Main content -->
                    <div id="main-content" class="main-content col-lg-9 col-md-8 col-sm-12 col-xs-12">

                        <div class="block-item recently-products-cat md-margin-bottom-39">
                            <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":0,"slidesToShow":5, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 3}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":30}},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":10}}]}' >
                                <c:forEach items="${listPP}" var="o">
                                    <li class="product-item">
                                        <div class="contain-product layout-02">
                                            <div class="product-thumb">
                                                <a href="#" class="link-to-product">
                                                    <img src="${o.image}" alt="${o.name}" width="270" height="270" class="product-thumnail">
                                                </a>
                                            </div>
                                            <div class="info">
                                                <b class="categories">Fresh Fruit</b>
                                                <h4 class="product-title"><a href="detail?pid=${o.id}" class="pr-name">${o.name}</a></h4>
                                                <div class="price">
                                                    <ins><span class="price-amount"><span class="currencySymbol">£</span>${o.price}</span></ins>
                                                    <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                </div>
                                            </div>
                                        </div>
                                    </li></c:forEach>
                                </ul>
                            </div>

                            <div class="product-category grid-style">

                                <div id="top-functions-area" class="top-functions-area" >
                                    <div class="flt-item to-left group-on-mobile">
                                        <span class="flt-title">Refine</span>
                                        <a href="#" class="icon-for-mobile">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </a>
                                        <div class="wrap-selectors">
                                            <form action="#" name="frm-refine" method="get">
                                                <span class="title-for-mobile">Refine Products By</span>
                                                <div data-title="Price:" class="selector-item">
                                                    <select name="price" class="selector">
                                                        <option value="all">Price</option>
                                                        <option value="class-1st">Less than 5$</option>
                                                        <option value="class-2nd">$5-10$</option>
                                                        <option value="class-3rd">$10-20$</option>
                                                        <option value="class-4th">$20-45$</option>
                                                        <option value="class-5th">$45-100$</option>
                                                        <option value="class-6th">$100-150$</option>
                                                        <option value="class-7th">More than 150$</option>
                                                    </select>
                                                </div>
                                                <div data-title="Brand:" class="selector-item">
                                                    <select name="brad" class="selector">
                                                        <option value="all">Top brands</option>
                                                        <option value="br2">Brand first</option>
                                                        <option value="br3">Brand second</option>
                                                        <option value="br4">Brand third</option>
                                                        <option value="br5">Brand fourth</option>
                                                        <option value="br6">Brand fiveth</option>
                                                    </select>
                                                </div>
                                                <div data-title="Avalability:" class="selector-item">
                                                    <select name="ability" class="selector">
                                                        <option value="all">Availability</option>
                                                        <option value="vl2">Availability 1</option>
                                                        <option value="vl3">Availability 2</option>
                                                        <option value="vl4">Availability 3</option>
                                                        <option value="vl5">Availability 4</option>
                                                        <option value="vl6">Availability 5</option>
                                                    </select>
                                                </div>
                                                <p class="btn-for-mobile"><button type="submit" class="btn-submit">Go</button></p>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="flt-item to-right">
                                        <span class="flt-title">Sort</span>
                                        <div class="wrap-selectors">
                                            <div class="selector-item orderby-selector">
                                                <select name="orderby" class="orderby" aria-label="Shop order">
                                                    <option value="menu_order" selected="selected">Default sorting</option>
                                                    <option value="popularity">popularity</option>
                                                    <option value="rating">average rating</option>
                                                    <option value="date">newness</option>
                                                    <option value="price">price: low to high</option>
                                                    <option value="price-desc">price: high to low</option>
                                                </select>
                                            </div>
                                            <div class="selector-item viewmode-selector">
                                                <a href="category-grid-left-sidebar.html" class="viewmode grid-mode active"><i class="biolife-icon icon-grid"></i></a>
                                                <a href="category-list-left-sidebar.html" class="viewmode detail-mode"><i class="biolife-icon icon-list"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <ul class="products-list">
                                    <c:forEach items="${listP}" var="o">
                                        <li class="product-item col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                            <div class="contain-product layout-default">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product">
                                                        <img src="${o.image}" alt="dd" width="270" height="270" class="product-thumnail">
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <b class="categories">Fresh Fruit</b>
                                                    <h4 class="product-title"><a href="detail?pid=${o.id}" class="pr-name">${o.name}</a></h4>
                                                    <div class="price">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>${o.price}</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                    <div class="shipping-info">
                                                        <p class="shipping-day">3-Day Shipping</p>
                                                        <p class="for-today">Pree Pickup Today</p>
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
                                    </c:forEach>
                                </ul>
                            </div>

                            <div class="biolife-panigations-block">
                                <ul class="panigation-contain">
                                    <li><span class="current-page">1</span></li>
                                    <li><a href="#" class="link-page">2</a></li>
                                    <li><a href="#" class="link-page">3</a></li>
                                    <li><span class="sep">....</span></li>
                                    <li><a href="#" class="link-page">20</a></li>
                                    <li><a href="#" class="link-page next"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>

                        </div>

                    </div>
                    <!-- Sidebar -->
                    <aside id="sidebar" class="sidebar col-lg-3 col-md-4 col-sm-12 col-xs-12">
                        <div class="biolife-mobile-panels">
                            <span class="biolife-current-panel-title">Sidebar</span>
                            <a class="biolife-close-btn" href="#" data-object="open-mobile-filter">&times;</a>
                        </div>
                        <div class="sidebar-contain">
                            <div class="widget biolife-filter">
                                <!--<h4 class="wgt-title" >Departments</h4>-->
                                <a class="wgt-title" href="category">Departments</a>
                                <div class="wgt-content">
                                    <ul class="cat-list">
                                        <c:forEach items="${listCC}" var="o">
                                            <li class=" text-white ${tag == o.cid ? "tab-head__icon-top-layout":""} "><a href="category?cid=${o.cid}">${o.cname}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </div>

                            <div class="widget biolife-filter">
                                <h4 class="wgt-title">Shipping & Pickup</h4>
                                <div class="wgt-content">
                                    <ul class="cat-list">
                                        <li class="cat-list-item"><a href="#" class="cat-link">Show all</a></li>
                                        <li class="cat-list-item"><a href="#" class="cat-link">2- Day shipping</a></li>
                                        <li class="cat-list-item"><a href="#" class="cat-link">Shop to Home</a></li>
                                        <li class="cat-list-item"><a href="#" class="cat-link">Free Pickup</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="widget price-filter biolife-filter">
                                <h4 class="wgt-title">Price</h4>
                                <div class="wgt-content">
                                    <div class="frm-contain">
                                        <form action="#" name="price-filter" id="price-filter" method="get">
                                            <p class="f-item">
                                                <label for="pr-from">$</label>
                                                <input class="input-number" type="number" id="pr-from" value="" name="price-from">
                                            </p>
                                            <p class="f-item">
                                                <label for="pr-to">to $</label>
                                                <input class="input-number" type="number" id="pr-to" value="" name="price-from">
                                            </p>
                                            <p class="f-item"><button class="btn-submit" type="submit">go</button></p>
                                        </form>
                                    </div>
                                    <ul class="check-list bold single">
                                        <li class="check-list-item"><a href="#" class="check-link">$0 - $5</a></li>
                                        <li class="check-list-item"><a href="#" class="check-link">$5 - $10</a></li>
                                        <li class="check-list-item"><a href="#" class="check-link">$15 - $20</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="widget biolife-filter">
                                <h4 class="wgt-title">Brand</h4>
                                <div class="wgt-content">
                                    <ul class="check-list multiple">
                                        <li class="check-list-item"><a href="#" class="check-link">Great Value Organic</a></li>
                                        <li class="check-list-item"><a href="#" class="check-link">Plum Organic</a></li>
                                        <li class="check-list-item"><a href="#" class="check-link">Shop to Home</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="widget biolife-filter">
                                <h4 class="wgt-title">Color</h4>
                                <div class="wgt-content">
                                    <ul class="color-list">
                                        <li class="color-item"><a href="#" class="c-link"><span class="symbol img-color"></span>Multi</a></li>
                                        <li class="color-item"><a href="#" class="c-link"><span class="symbol hex-code color-01"></span>Red</a></li>
                                        <li class="color-item"><a href="#" class="c-link"><span class="symbol hex-code color-02"></span>Orrange</a></li>
                                        <li class="color-item"><a href="#" class="c-link"><span class="symbol hex-code color-03"></span>Other</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="widget biolife-filter">
                                <h4 class="wgt-title">Popular Size</h4>
                                <div class="wgt-content">
                                    <ul class="check-list bold multiple">
                                        <li class="check-list-item"><a href="#" class="check-link">8oz</a></li>
                                        <li class="check-list-item"><a href="#" class="check-link">15oz</a></li>
                                        <li class="check-list-item"><a href="#" class="check-link">6oz</a></li>
                                        <li class="check-list-item"><a href="#" class="check-link">30oz</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="widget biolife-filter">
                                <h4 class="wgt-title">Number of Pieces</h4>
                                <div class="wgt-content">
                                    <ul class="check-list bold">
                                        <li class="check-list-item"><a href="#" class="check-link">1 to 9</a></li>
                                        <li class="check-list-item"><a href="#" class="check-link">10 to 15</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="widget biolife-filter">
                                <h4 class="wgt-title">Recently Viewed</h4>
                                <div class="wgt-content">
                                    <ul class="products">
                                        
                                           <li class="pr-item">
                                            <div class="contain-product style-widget">
                                                <div class="product-thumb">
                                                    <a href="#" class="link-to-product" tabindex="0">
                                                        <img src="${p.image}" alt="${p.name}" width="270" height="270" class="product-thumnail">
                                                    </a>
                                                </div>
                                                <div class="info">
                                                    <b class="categories">Fresh Fruit</b>
                                                    <h4 class="product-title"><a href="${p.name}" class="pr-name" tabindex="0">Fresh Fruit</a></h4>
                                                    <div class="price">
                                                        <ins><span class="price-amount"><span class="currencySymbol">£</span>${p.price}</span></ins>
                                                        <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                    </div>
                                                </div>
                                            </div>
                                        </li> 
                                        
                                        
                                    </ul>
                                </div>
                            </div>

                            <div class="widget biolife-filter">
                                <h4 class="wgt-title">Product Tags</h4>
                                <div class="wgt-content">
                                    <ul class="tag-cloud">
                                        <li class="tag-item"><a href="#" class="tag-link">Fresh Fruit</a></li>
                                        <li class="tag-item"><a href="#" class="tag-link">Natural Food</a></li>
                                        <li class="tag-item"><a href="#" class="tag-link">Hot</a></li>
                                        <li class="tag-item"><a href="#" class="tag-link">Organics</a></li>
                                        <li class="tag-item"><a href="#" class="tag-link">Dried Organic</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </aside>
                </div>
            </div>
        </div>

        <!-- FOOTER -->
        <footer id="footer" class="footer layout-03">
            <div class="footer-content background-footer-03">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-9">
                            <section class="footer-item">
                                <a href="#" class="logo footer-logo"><img src="assets/images/organic-3.png" alt="biolife logo" width="135" height="34"></a>
                                <div class="footer-phone-info">
                                    <i class="biolife-icon icon-head-phone"></i>
                                    <p class="r-info">
                                        <span>Got Questions ?</span>
                                        <span>(700)  9001-1909  (900) 689 -66</span>
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
                                <h3 class="section-title">Useful Links</h3>
                                <div class="row">
                                    <div class="col-lg-6 col-sm-6 col-xs-6">
                                        <div class="wrap-custom-menu vertical-menu-2">
                                            <ul class="menu">
                                                <li><a href="#">About Us</a></li>
                                                <li><a href="#">About Our Shop</a></li>
                                                <li><a href="#">Secure Shopping</a></li>
                                                <li><a href="#">Delivery infomation</a></li>
                                                <li><a href="#">Privacy Policy</a></li>
                                                <li><a href="#">Our Sitemap</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-sm-6 col-xs-6">
                                        <div class="wrap-custom-menu vertical-menu-2">
                                            <ul class="menu">
                                                <li><a href="#">Who We Are</a></li>
                                                <li><a href="#">Our Services</a></li>
                                                <li><a href="#">Projects</a></li>
                                                <li><a href="#">Contacts Us</a></li>
                                                <li><a href="#">Innovation</a></li>
                                                <li><a href="#">Testimonials</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 md-margin-top-5px sm-margin-top-50px xs-margin-top-40px">
                            <section class="footer-item">
                                <h3 class="section-title">Transport Offices</h3>
                                <div class="contact-info-block footer-layout xs-padding-top-10px">
                                    <ul class="contact-lines">
                                        <li>
                                            <p class="info-item">
                                                <i class="biolife-icon icon-location"></i>
                                                <b class="desc">7563 St. Vicent Place, Glasgow, Greater Newyork NH7689, UK </b>
                                            </p>
                                        </li>
                                        <li>
                                            <p class="info-item">
                                                <i class="biolife-icon icon-phone"></i>
                                                <b class="desc">Phone: (+067) 234 789  (+068) 222 888</b>
                                            </p>
                                        </li>
                                        <li>
                                            <p class="info-item">
                                                <i class="biolife-icon icon-letter"></i>
                                                <b class="desc">Email:  contact@company.com</b>
                                            </p>
                                        </li>
                                        <li>
                                            <p class="info-item">
                                                <i class="biolife-icon icon-clock"></i>
                                                <b class="desc">Hours: 7 Days a week from 10:00 am</b>
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
                            <div class="separator sm-margin-top-70px xs-margin-top-40px"></div>
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
        </footer>

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