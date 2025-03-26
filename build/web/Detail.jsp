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
        <link rel="stylesheet" href="assets/css/main-color.css">
        <link rel="stylesheet" href="assets/css/main-color03-green.css">
        <style>
            /* Làm đẹp cho phần đánh giá sao */
            .comment-form-rating .stars {
                display: inline-block;
                margin: 0;
                padding: 0;
            }

            .comment-form-rating .stars a.btn-rating {
                display: inline-block;
                margin-right: 5px;
                font-size: 16px;
                color: #ccc;
                text-decoration: none;
            }

            .comment-form-rating .stars a.btn-rating .fa-star {
                color: #f9ba48; /* Màu của sao đầy đủ */
            }

            .comment-form-rating .stars a.btn-rating .fa-star-o {
                color: #ccc; /* Màu của sao rỗng */
            }

            .comment-form-rating .stars a.btn-rating:hover {
                transform: scale(1.2);
            }

            /* Hiệu ứng khi hover */
            .comment-form-rating .stars a.btn-rating:hover ~ a.btn-rating .fa {
                color: #ccc;
            }

            /* Cải thiện nút gửi đánh giá */
            .review-form-wrapper button[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .review-form-wrapper button[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
        <script>
    function addToCart(productId, quantity) {
        fetch("cart?action=add&id=" + productId + "&quantity=" + quantity, {
            method: "POST",
            credentials: 'same-origin'
        })
        .then(response => {
            if (response.redirected) {
                alert("Vui lòng đăng nhập để thêm sản phẩm vào giỏ hàng!");
                window.location.href = 'Login.jsp';
                return;
            }
            alert("Đã thêm sản phẩm vào giỏ hàng!");
        })
        .catch(error => {
            console.error("Lỗi:", error);
        });
    }
</script>
        <!-- filepath: d:\KI4\PRJ301\DuanNho\DuAnBanHang\DuAnBanHang\web\Category.jsp -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Danh sách tên danh mục
                var categoryMap = {
                    1: "Tinh dầu xông phòng",
                    2: "Tinh dầu xe hơi",
                    3: "Tinh dầu massage",
                    4: "Tinh dầu dạng xịt"
                };

                // Cập nhật tất cả các phần tử có class "categories"
                var categoryElements = document.querySelectorAll(".categories");
                categoryElements.forEach(function (element) {
                    // Lấy cateId từ data attribute của phần tử
                    var cateid = element.getAttribute('data-category-id');
                    if (cateid) {
                        element.textContent = categoryMap[cateid] || "Danh mục sản phẩm";
                    }
                });

                // Cập nhật tiêu đề danh mục trong breadcrumb nếu có
                var breadcrumbCategory = document.querySelector(".permal-link + li span");
                if (breadcrumbCategory) {
                    var cateid = breadcrumbCategory.getAttribute('data-category-id');
                    if (cateid) {
                        breadcrumbCategory.textContent = categoryMap[cateid] || "Danh mục sản phẩm";
                    }
                }
            });
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

            <!--    <header id="header" class="header-area style-01 layout-03">
                    <div class="header-top bg-main hidden-xs">
                        <div class="container">
                            <div class="top-bar left">
                                <ul class="horizontal-menu">
                                    <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i>Organic@company.com</a></li>
                                    <li><a href="#">Free Shipping for all Order of $99</a></li>
                                </ul>
                            </div>
                            <div class="top-bar right">
                                <ul class="social-list">
                                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                </ul>
                                <ul class="horizontal-menu">
                                    <li class="horz-menu-item currency">
                                        <select name="currency">
                                            <option value="eur">€ EUR (Euro)</option>
                                            <option value="usd" selected>$ USD (Dollar)</option>
                                            <option value="usd">£ GBP (Pound)</option>
                                            <option value="usd">¥ JPY (Yen)</option>
                                        </select>
                                    </li>
                                    <li class="horz-menu-item lang">
                                        <select name="language">
                                            <option value="fr">French (EUR)</option>
                                            <option value="en" selected>English (USD)</option>
                                            <option value="ger">Germany (GBP)</option>
                                            <option value="jp">Japan (JPY)</option>
                                        </select>
                                    </li>
                                    <li><a href="login.html" class="login-link"><i class="biolife-icon icon-login"></i>Login/Register</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="header-middle biolife-sticky-object ">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-2 col-md-6 col-xs-6">
                                    <a href="index-2.html" class="biolife-logo"><img src="assets/images/organic-3.png" alt="biolife logo" width="135" height="34"></a>
                                </div>
                                <div class="col-lg-6 col-md-7 hidden-sm hidden-xs">
                                    <div class="primary-menu">
                                        <ul class="menu biolife-menu clone-main-menu clone-primary-menu" id="primary-menu" data-menuname="main menu">
                                            <li class="menu-item"><a href="index-2.html">Home</a></li>
                                            <li class="menu-item menu-item-has-children has-megamenu">
                                                <a href="#" class="menu-name" data-title="Shop" >Shop</a>
                                                <div class="wrap-megamenu lg-width-900 md-width-750">
                                                    <div class="mega-content">
                                                        <div class="col-lg-3 col-md-3 col-xs-12 md-margin-bottom-0 xs-margin-bottom-25">
                                                            <div class="wrap-custom-menu vertical-menu">
                                                                <h4 class="menu-title">Fresh Berries</h4>
                                                                <ul class="menu">
                                                                    <li><a href="#">Fruit & Nut Gifts</a></li>
                                                                    <li><a href="#">Mixed Fruits</a></li>
                                                                    <li><a href="#">Oranges</a></li>
                                                                    <li><a href="#">Bananas & Plantains</a></li>
                                                                    <li><a href="#">Fresh Gala Apples</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-xs-12 md-margin-bottom-0 xs-margin-bottom-25">
                                                            <div class="wrap-custom-menu vertical-menu">
                                                                <h4 class="menu-title">Vegetables</h4>
                                                                <ul class="menu">
                                                                    <li><a href="#">Berries</a></li>
                                                                    <li><a href="#">Pears</a></li>
                                                                    <li><a href="#">Chili Peppers</a></li>
                                                                    <li><a href="#">Fresh Avocado</a></li>
                                                                    <li><a href="#">Grapes</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-xs-12 md-margin-bottom-0 xs-margin-bottom-25">
                                                            <div class="wrap-custom-menu vertical-menu ">
                                                                <h4 class="menu-title">Fresh Fruits</h4>
                                                                <ul class="menu">
                                                                    <li><a href="#">Basket of apples</a></li>
                                                                    <li><a href="#">Strawberry</a></li>
                                                                    <li><a href="#">Blueberry</a></li>
                                                                    <li><a href="#">Orange</a></li>
                                                                    <li><a href="#">Pineapple</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-xs-12 md-margin-bottom-0 xs-margin-bottom-25">
                                                            <div class="wrap-custom-menu vertical-menu">
                                                                <h4 class="menu-title">Featured Products</h4>
                                                                <ul class="menu">
                                                                    <li><a href="#">Coffee Creamers</a></li>
                                                                    <li><a href="#">Mayonnaise</a></li>
                                                                    <li><a href="#">Almond Milk</a></li>
                                                                    <li><a href="#">Fruit Jam</a></li>
                                                                    <li><a href="#">Beverages</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="menu-item menu-item-has-children has-child">
                                                <a href="#" class="menu-name" data-title="Products">Products</a>
                                                <ul class="sub-menu">
                                                    <li class="menu-item"><a href="#">Omelettes</a></li>
                                                    <li class="menu-item"><a href="#">Breakfast Scrambles</a></li>
                                                    <li class="menu-item menu-item-has-children has-child"><a href="#" class="menu-name" data-title="Eggs & other considerations">Eggs & other considerations</a>
                                                        <ul class="sub-menu">
                                                            <li class="menu-item"><a href="#">Classic Breakfast</a></li>
                                                            <li class="menu-item"><a href="#">Huevos Rancheros</a></li>
                                                            <li class="menu-item"><a href="#">Everything Egg Sandwich</a></li>
                                                            <li class="menu-item"><a href="#">Egg Sandwich</a></li>
                                                            <li class="menu-item"><a href="#">Vegan Burrito</a></li>
                                                            <li class="menu-item"><a href="#">Biscuits and Gravy</a></li>
                                                            <li class="menu-item"><a href="#">Bacon Avo Egg Sandwich</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="menu-item"><a href="#">Griddle</a></li>
                                                    <li class="menu-item menu-item-has-children has-child"><a href="#" class="menu-name" data-title="Sides & Extras">Sides & Extras</a>
                                                        <ul class="sub-menu">
                                                            <li class="menu-item"><a href="#">Breakfast Burrito</a></li>
                                                            <li class="menu-item"><a href="#">Crab Cake Benedict</a></li>
                                                            <li class="menu-item"><a href="#">Corned Beef Hash</a></li>
                                                            <li class="menu-item"><a href="#">Steak & Eggs</a></li>
                                                            <li class="menu-item"><a href="#">Oatmeal</a></li>
                                                            <li class="menu-item"><a href="#">Fruit & Yogurt Parfait</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="menu-item"><a href="#">Biscuits</a></li>
                                                    <li class="menu-item"><a href="#">Seasonal Fruit Plate</a></li>
                                                </ul>
                                            </li>
                                            <li class="menu-item menu-item-has-children has-megamenu">
                                                <a href="#" class="menu-name" data-title="Demo">Demo</a>
                                                <div class="wrap-megamenu lg-width-800 md-width-750">
                                                    <div class="mega-content">
                                                        <div class="col-lg-3 col-md-3 col-xs-12 md-margin-bottom-0 xs-margin-bottom-25">
                                                            <div class="wrap-custom-menu vertical-menu">
                                                                <h4 class="menu-title">Home Page</h4>
                                                                <ul class="menu">
                                                                    <li><a href="home-01.html">Home 01</a></li>
                                                                    <li><a href="home-02.html">Home 02</a></li>
                                                                    <li><a href="index-2.html">Home 03</a></li>
                                                                    <li><a href="home-03-green.html">Home 03 Green</a></li>
                                                                    <li><a href="home-04.html">Home 04</a></li>
                                                                    <li><a href="home-04-light.html">Home 04 Light</a></li>
                                                                    <li><a href="home-05.html">Home 05</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-xs-12 md-margin-bottom-0 xs-margin-bottom-25">
                                                            <div class="wrap-custom-menu vertical-menu">
                                                                <h4 class="menu-title">Inner Pages</h4>
                                                                <ul class="menu">
                                                                    <li class="menu-item" ><a class="menu-name" href="blog-post.html">Blog Single</a></li>
                                                                    <li class="menu-item" ><a class="menu-name" href="blog-v01.html">Blog Style 01</a></li>
                                                                    <li class="menu-item" ><a class="menu-name" href="blog-v02.html">Blog Style 02</a></li>
                                                                    <li class="menu-item" ><a class="menu-name" href="blog-v03.html">Blog Style 03</a></li>
                                                                    <li class="menu-item" ><a class="menu-name" href="contact.html">Contact Us</a></li>
                                                                    <li class="menu-item" ><a class="menu-name" href="about-us.html">About Us</a></li>
                                                                    <li class="menu-item" ><a class="menu-name" href="checkout.html">Checkout</a></li>
                                                                    <li class="menu-item" ><a class="menu-name" href="shopping-cart.html">Shopping Cart</a></li>
                                                                    <li class="menu-item" ><a class="menu-name" href="login.html">Login/Register</a></li>
                                                                    <li class="menu-item" ><a class="menu-name" href="404.html">404</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-xs-12 md-margin-bottom-0 xs-margin-bottom-25">
                                                            <div class="wrap-custom-menu vertical-menu">
                                                                <h4 class="menu-title">Category Pages</h4>
                                                                <ul class="menu">
                                                                    <li><a href="category-grid-3-cols.html">Grid 3 Cols</a></li>
                                                                    <li><a href="category-grid.html">Grid 4 Cols</a></li>
                                                                    <li><a href="category-grid-6-cols.html">Grid 6 Cols</a></li>
                                                                    <li><a href="category-grid-left-sidebar.html">Grid Left Sidebar</a></li>
                                                                    <li><a href="category-grid-right-sidebar.html">Grid Right Sidebar</a></li>
                                                                    <li><a href="category-list.html">List Full</a></li>
                                                                    <li><a href="category-list-left-sidebar.html">List Left Sidebar</a></li>
                                                                    <li><a href="category-list-right-sidebar.html">List Right Sidebar</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-xs-12 md-margin-bottom-0 xs-margin-bottom-25">
                                                            <div class="wrap-custom-menu vertical-menu">
                                                                <h4 class="menu-title">Product Types</h4>
                                                                <ul class="menu">
                                                                    <li><a href="single-product-simple.html">Simple</a></li>
                                                                    <li><a href="single-product-grouped.html">Grouped</a></li>
                                                                    <li><a href="single-product.html">Variable</a></li>
                                                                    <li><a href="single-product-external.html">External/Affiliate</a></li>
                                                                    <li><a href="single-product-onsale.html">Countdown</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="menu-item menu-item-has-children has-megamenu">
                                                <a href="#" class="menu-name" data-title="Blog">Blog</a>
                                                <div class="wrap-megamenu lg-width-800 md-width-750">
                                                    <div class="mega-content">
                                                        <div class="col-lg-3 col-md-3 col-xs-6">
                                                            <div class="wrap-custom-menu vertical-menu">
                                                                <h4 class="menu-title">Blog Categories</h4>
                                                                <ul class="menu">
                                                                    <li><a href="#">Beauty (30)</a></li>
                                                                    <li><a href="#">Fashion (50)</a></li>
                                                                    <li><a href="#">Food (10)</a></li>
                                                                    <li><a href="#">Life Style (60)</a></li>
                                                                    <li><a href="#">Travel (10)</a></li>
                                                                    <li><a href="#">Nutrition (35)</a></li>
                                                                    <li><a href="#">Food Decoration (45)</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-xs-6">
                                                            <div class="wrap-custom-menu vertical-menu">
                                                                <h4 class="menu-title">Featured Posts</h4>
                                                                <ul class="menu">
                                                                    <li><a href="#">Post example<sup>#1</sup></a></li>
                                                                    <li><a href="#">Post example<sup>#2</sup></a></li>
                                                                    <li><a href="#">Post example<sup>#3</sup></a></li>
                                                                    <li><a href="#">Post example<sup>#4</sup></a></li>
                                                                    <li><a href="#">Post example<sup>#5</sup></a></li>
                                                                    <li><a href="#">Post example<sup>#6</sup></a></li>
                                                                    <li><a href="#">Post example<sup>#7</sup></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-xs-12 md-margin-top-0 xs-margin-top-25px">
                                                            <div class="block-posts">
                                                                <h4 class="menu-title">Recent Posts</h4>
                                                                <ul class="posts">
                                                                    <li>
                                                                        <div class="block-post-item">
                                                                            <div class="thumb"><a href="#"><img src="assets/images/megamenu/thumb-05.jpg" width="100" height="73" alt=""></a></div>
                                                                            <div class="left-info">
                                                                                <h4 class="post-name"><a href="#">Ashwagandha: The #1 Herb in the World for Anxiety?</a></h4>
                                                                                <span class="p-date">Jan 05, 2019</span>
                                                                                <span class="p-comment">2 Comments</span>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="block-post-item">
                                                                            <div class="thumb"><a href="#"><img src="assets/images/megamenu/thumb-06.jpg" width="100" height="73" alt=""></a></div>
                                                                            <div class="left-info">
                                                                                <h4 class="post-name"><a href="#">Ashwagandha: The #1 Herb in the World for Anxiety?</a></h4>
                                                                                <span class="p-date">May 15, 2019</span>
                                                                                <span class="p-comment">8 Comments</span>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div class="block-post-item">
                                                                            <div class="thumb"><a href="#"><img src="assets/images/megamenu/thumb-07.jpg" width="100" height="73" alt=""></a></div>
                                                                            <div class="left-info">
                                                                                <h4 class="post-name"><a href="#">Ashwagandha: The #1 Herb in the World for Anxiety?</a></h4>
                                                                                <span class="p-date">Apr 26, 2019</span>
                                                                                <span class="p-comment">10 Comments</span>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="menu-item"><a href="contact.html">Contact</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-md-6 col-xs-6">
                                    <div class="biolife-cart-info">
                                        <div class="mobile-search">
                                            <a href="javascript:void(0)" class="open-searchbox"><i class="biolife-icon icon-search"></i></a>
                                            <div class="mobile-search-content">
                                                <form action="#" class="form-search" name="mobile-seacrh" method="get">
                                                    <a href="#" class="btn-close"><span class="biolife-icon icon-close-menu"></span></a>
                                                    <input type="text" name="s" class="input-text" value="" placeholder="Search here...">
                                                    <select name="category">
                                                        <option value="-1" selected>All Categories</option>
                                                        <option value="vegetables">Vegetables</option>
                                                        <option value="fresh_berries">Fresh Berries</option>
                                                        <option value="ocean_foods">Ocean Foods</option>
                                                        <option value="butter_eggs">Butter & Eggs</option>
                                                        <option value="fastfood">Fastfood</option>
                                                        <option value="fresh_meat">Fresh Meat</option>
                                                        <option value="fresh_onion">Fresh Onion</option>
                                                        <option value="papaya_crisps">Papaya & Crisps</option>
                                                        <option value="oatmeal">Oatmeal</option>
                                                    </select>
                                                    <button type="submit" class="btn-submit">go</button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="wishlist-block hidden-sm hidden-xs">
                                            <a href="#" class="link-to">
                                                <span class="icon-qty-combine">
                                                    <i class="icon-heart-bold biolife-icon"></i>
                                                    <span class="qty">4</span>
                                                </span>
                                            </a>
                                        </div>
                                        <div class="minicart-block">
                                            <div class="minicart-contain">
                                                <a href="javascript:void(0)" class="link-to">
                                                        <span class="icon-qty-combine">
                                                            <i class="icon-cart-mini biolife-icon"></i>
                                                            <span class="qty">8</span>
                                                        </span>
                                                    <span class="title">My Cart -</span>
                                                    <span class="sub-total">$0.00</span>
                                                </a>
                                                <div class="cart-content">
                                                    <div class="cart-inner">
                                                        <ul class="products">
                                                            <li>
                                                                <div class="minicart-item">
                                                                    <div class="thumb">
                                                                        <a href="#"><img src="assets/images/minicart/pr-01.jpg" width="90" height="90" alt="National Fresh"></a>
                                                                    </div>
                                                                    <div class="left-info">
                                                                        <div class="product-title"><a href="#" class="product-name">National Fresh Fruit</a></div>
                                                                        <div class="price">
                                                                            <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                            <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                        </div>
                                                                        <div class="qty">
                                                                            <label for="cart[id123][qty]">Qty:</label>
                                                                            <input type="number" class="input-qty" name="cart[id123][qty]" id="cart[id123][qty]" value="1" disabled>
                                                                        </div>
                                                                    </div>
                                                                    <div class="action">
                                                                        <a href="#" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                        <a href="#" class="remove"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="minicart-item">
                                                                    <div class="thumb">
                                                                        <a href="#"><img src="assets/images/minicart/pr-02.jpg" width="90" height="90" alt="National Fresh"></a>
                                                                    </div>
                                                                    <div class="left-info">
                                                                        <div class="product-title"><a href="#" class="product-name">National Fresh Fruit</a></div>
                                                                        <div class="price">
                                                                            <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                            <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                        </div>
                                                                        <div class="qty">
                                                                            <label for="cart[id124][qty]">Qty:</label>
                                                                            <input type="number" class="input-qty" name="cart[id124][qty]" id="cart[id124][qty]" value="1" disabled>
                                                                        </div>
                                                                    </div>
                                                                    <div class="action">
                                                                        <a href="#" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                        <a href="#" class="remove"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="minicart-item">
                                                                    <div class="thumb">
                                                                        <a href="#"><img src="assets/images/minicart/pr-03.jpg" width="90" height="90" alt="National Fresh"></a>
                                                                    </div>
                                                                    <div class="left-info">
                                                                        <div class="product-title"><a href="#" class="product-name">National Fresh Fruit</a></div>
                                                                        <div class="price">
                                                                            <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                            <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                        </div>
                                                                        <div class="qty">
                                                                            <label for="cart[id125][qty]">Qty:</label>
                                                                            <input type="number" class="input-qty" name="cart[id125][qty]" id="cart[id125][qty]" value="1" disabled>
                                                                        </div>
                                                                    </div>
                                                                    <div class="action">
                                                                        <a href="#" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                        <a href="#" class="remove"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="minicart-item">
                                                                    <div class="thumb">
                                                                        <a href="#"><img src="assets/images/minicart/pr-04.jpg" width="90" height="90" alt="National Fresh"></a>
                                                                    </div>
                                                                    <div class="left-info">
                                                                        <div class="product-title"><a href="#" class="product-name">National Fresh Fruit</a></div>
                                                                        <div class="price">
                                                                            <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                            <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                        </div>
                                                                        <div class="qty">
                                                                            <label for="cart[id126][qty]">Qty:</label>
                                                                            <input type="number" class="input-qty" name="cart[id126][qty]" id="cart[id126][qty]" value="1" disabled>
                                                                        </div>
                                                                    </div>
                                                                    <div class="action">
                                                                        <a href="#" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                        <a href="#" class="remove"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="minicart-item">
                                                                    <div class="thumb">
                                                                        <a href="#"><img src="assets/images/minicart/pr-05.jpg" width="90" height="90" alt="National Fresh"></a>
                                                                    </div>
                                                                    <div class="left-info">
                                                                        <div class="product-title"><a href="#" class="product-name">National Fresh Fruit</a></div>
                                                                        <div class="price">
                                                                            <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                            <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                        </div>
                                                                        <div class="qty">
                                                                            <label for="cart[id127][qty]">Qty:</label>
                                                                            <input type="number" class="input-qty" name="cart[id127][qty]" id="cart[id127][qty]" value="1" disabled>
                                                                        </div>
                                                                    </div>
                                                                    <div class="action">
                                                                        <a href="#" class="edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                        <a href="#" class="remove"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                        <p class="btn-control">
                                                            <a href="#" class="btn view-cart">view cart</a>
                                                            <a href="#" class="btn">checkout</a>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mobile-menu-toggle">
                                            <a class="btn-toggle" data-object="open-mobile-menu" href="javascript:void(0)">
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="header-bottom hidden-sm hidden-xs">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4">
                                    <div class="vertical-menu vertical-category-block">
                                        <div class="block-title">
                                            <span class="menu-icon">
                                                <span class="line-1"></span>
                                                <span class="line-2"></span>
                                                <span class="line-3"></span>
                                            </span>
                                            <span class="menu-title">All departments</span>
                                            <span class="angle" data-tgleclass="fa fa-caret-down"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                        </div>
                                        <div class="wrap-menu">
                                            <ul class="menu clone-main-menu">
                                                <li class="menu-item menu-item-has-children has-megamenu">
                                                    <a href="#" class="menu-name" data-title="Fruit & Nut Gifts"><i class="biolife-icon icon-fruits"></i>Fruit & Nut Gifts</a>
                                                    <div class="wrap-megamenu lg-width-900 md-width-640">
                                                        <div class="mega-content">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-12 xs-margin-bottom-25 md-margin-bottom-0">
                                                                    <div class="wrap-custom-menu vertical-menu">
                                                                        <h4 class="menu-title">Fresh Fuits</h4>
                                                                        <ul class="menu">
                                                                            <li><a href="#">Fruit & Nut Gifts</a></li>
                                                                            <li><a href="#">Mixed Fruits</a></li>
                                                                            <li><a href="#">Oranges</a></li>
                                                                            <li><a href="#">Bananas & Plantains</a></li>
                                                                            <li><a href="#">Fresh Gala Apples</a></li>
                                                                            <li><a href="#">Berries</a></li>
                                                                            <li><a href="#">Pears</a></li>
                                                                            <li><a href="#">Produce</a></li>
                                                                            <li><a href="#">Snack Foods</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-12 lg-padding-left-23 xs-margin-bottom-25 md-margin-bottom-0">
                                                                    <div class="wrap-custom-menu vertical-menu">
                                                                        <h4 class="menu-title">Nut Gifts</h4>
                                                                        <ul class="menu">
                                                                            <li><a href="#">Non-Dairy Coffee Creamers</a></li>
                                                                            <li><a href="#">Coffee Creamers</a></li>
                                                                            <li><a href="#">Mayonnaise</a></li>
                                                                            <li><a href="#">Almond Milk</a></li>
                                                                            <li><a href="#">Ghee</a></li>
                                                                            <li><a href="#">Beverages</a></li>
                                                                            <li><a href="#">Ranch Salad Dressings</a></li>
                                                                            <li><a href="#">Hemp Milk</a></li>
                                                                            <li><a href="#">Nuts & Seeds</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-4 col-sm-12 lg-padding-left-50 xs-margin-bottom-25 md-margin-bottom-0">
                                                                    <div class="biolife-products-block max-width-270">
                                                                        <h4 class="menu-title">Bestseller Products</h4>
                                                                        <ul class="products-list default-product-style biolife-carousel nav-none-after-1k2 nav-center" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":30,"slidesToShow":1, "responsive":[{"breakpoint":767, "settings":{ "arrows": false}}]}' >
                                                                            <li class="product-item">
                                                                                <div class="contain-product none-overlay">
                                                                                    <div class="product-thumb">
                                                                                        <a href="#" class="link-to-product">
                                                                                            <img src="assets/images/products/p-08.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                                                        </a>
                                                                                    </div>
                                                                                    <div class="info">
                                                                                        <b class="categories">Fresh Fruit</b>
                                                                                        <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                                                        <div class="price">
                                                                                            <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                                            <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                            <li class="product-item">
                                                                                <div class="contain-product none-overlay">
                                                                                    <div class="product-thumb">
                                                                                        <a href="#" class="link-to-product">
                                                                                            <img src="assets/images/products/p-11.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                                                        </a>
                                                                                    </div>
                                                                                    <div class="info">
                                                                                        <b class="categories">Fresh Fruit</b>
                                                                                        <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                                                        <div class="price">
                                                                                            <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                                            <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                            <li class="product-item">
                                                                                <div class="contain-product none-overlay">
                                                                                    <div class="product-thumb">
                                                                                        <a href="#" class="link-to-product">
                                                                                            <img src="assets/images/products/p-15.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                                                        </a>
                                                                                    </div>
                                                                                    <div class="info">
                                                                                        <b class="categories">Fresh Fruit</b>
                                                                                        <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                                                        <div class="price">
                                                                                            <ins><span class="price-amount"><span class="currencySymbol">£</span>85.00</span></ins>
                                                                                            <del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 md-margin-top-9">
                                                                    <div class="biolife-brand" >
                                                                        <ul class="brands">
                                                                            <li><a href="#"><img src="assets/images/megamenu/brand-organic.png" width="161" height="136" alt="organic"></a></li>
                                                                            <li><a href="#"><img src="assets/images/megamenu/brand-explore.png" width="160" height="136" alt="explore"></a></li>
                                                                            <li><a href="#"><img src="assets/images/megamenu/brand-organic-2.png" width="99" height="136" alt="organic 2"></a></li>
                                                                            <li><a href="#"><img src="assets/images/megamenu/brand-eco-teas.png" width="164"  height="136" alt="eco teas"></a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="menu-item menu-item-has-children has-megamenu">
                                                    <a href="#" class="menu-name" data-title="Vegetables"><i class="biolife-icon icon-broccoli-1"></i>Vegetables</a>
                                                    <div class="wrap-megamenu lg-width-900 md-width-640 background-mega-01">
                                                        <div class="mega-content">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-12 xs-margin-bottom-25 md-margin-bottom-0">
                                                                    <div class="wrap-custom-menu vertical-menu">
                                                                        <h4 class="menu-title">Vegetables</h4>
                                                                        <ul class="menu">
                                                                            <li><a href="#">Fruit & Nut Gifts</a></li>
                                                                            <li><a href="#">Mixed Fruits</a></li>
                                                                            <li><a href="#">Oranges</a></li>
                                                                            <li><a href="#">Bananas & Plantains</a></li>
                                                                            <li><a href="#">Fresh Gala Apples</a></li>
                                                                            <li><a href="#">Berries</a></li>
                                                                            <li><a href="#">Pears</a></li>
                                                                            <li><a href="#">Produce</a></li>
                                                                            <li><a href="#">Snack Foods</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-12 lg-padding-left-23 xs-margin-bottom-25 md-margin-bottom-0">
                                                                    <div class="wrap-custom-menu vertical-menu">
                                                                        <h4 class="menu-title">Gifts</h4>
                                                                        <ul class="menu">
                                                                            <li><a href="#">Non-Dairy Coffee Creamers</a></li>
                                                                            <li><a href="#">Coffee Creamers</a></li>
                                                                            <li><a href="#">Mayonnaise</a></li>
                                                                            <li><a href="#">Almond Milk</a></li>
                                                                            <li><a href="#">Ghee</a></li>
                                                                            <li><a href="#">Beverages</a></li>
                                                                            <li><a href="#">Ranch Salad Dressings</a></li>
                                                                            <li><a href="#">Hemp Milk</a></li>
                                                                            <li><a href="#">Nuts & Seeds</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-5 col-md-4 col-sm-12 lg-padding-left-57 md-margin-bottom-30">
                                                                    <div class="biolife-brand vertical md-boder-left-30">
                                                                        <h4 class="menu-title">Hot Brand</h4>
                                                                        <ul class="brands">
                                                                            <li><a href="#"><img src="assets/images/megamenu/v-brand-organic.png" width="167" height="74" alt="organic"></a></li>
                                                                            <li><a href="#"><img src="assets/images/megamenu/v-brand-explore.png" width="167" height="72" alt="explore"></a></li>
                                                                            <li><a href="#"><img src="assets/images/megamenu/v-brand-organic-2.png" width="167" height="99" alt="organic 2"></a></li>
                                                                            <li><a href="#"><img src="assets/images/megamenu/v-brand-eco-teas.png" width="167" height="67" alt="eco teas"></a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="menu-item menu-item-has-children has-megamenu">
                                                    <a href="#" class="menu-name" data-title="Fresh Berries"><i class="biolife-icon icon-grape"></i>Fresh Berries</a>
                                                    <div class="wrap-megamenu lg-width-900 md-width-640 background-mega-02">
                                                        <div class="mega-content">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 sm-col-12 md-margin-bottom-83 xs-margin-bottom-25">
                                                                    <div class="wrap-custom-menu vertical-menu">
                                                                        <h4 class="menu-title">Fresh Berries</h4>
                                                                        <ul class="menu">
                                                                            <li><a href="#">Fruit & Nut Gifts</a></li>
                                                                            <li><a href="#">Mixed Fruits</a></li>
                                                                            <li><a href="#">Oranges</a></li>
                                                                            <li><a href="#">Bananas & Plantains</a></li>
                                                                            <li><a href="#">Fresh Gala Apples</a></li>
                                                                            <li><a href="#">Berries</a></li>
                                                                            <li><a href="#">Pears</a></li>
                                                                            <li><a href="#">Produce</a></li>
                                                                            <li><a href="#">Snack Foods</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 sm-col-12 lg-padding-left-23 xs-margin-bottom-36px md-margin-bottom-0">
                                                                    <div class="wrap-custom-menu vertical-menu">
                                                                        <h4 class="menu-title">Gifts</h4>
                                                                        <ul class="menu">
                                                                            <li><a href="#">Non-Dairy Coffee Creamers</a></li>
                                                                            <li><a href="#">Coffee Creamers</a></li>
                                                                            <li><a href="#">Mayonnaise</a></li>
                                                                            <li><a href="#">Almond Milk</a></li>
                                                                            <li><a href="#">Ghee</a></li>
                                                                            <li><a href="#">Beverages</a></li>
                                                                            <li><a href="#">Ranch Salad Dressings</a></li>
                                                                            <li><a href="#">Hemp Milk</a></li>
                                                                            <li><a href="#">Nuts & Seeds</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-4 sm-col-12 lg-padding-left-25 md-padding-top-55">
                                                                    <div class="biolife-banner layout-01">
                                                                        <h3 class="top-title">Farm Fresh</h3>
                                                                        <p class="content"> All the Lorem Ipsum generators on the Internet tend.</p>
                                                                        <b class="bottomm-title">Berries Series</b>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="menu-item"><a href="#" class="menu-name" data-title="Ocean Foods"><i class="biolife-icon icon-fish"></i>Ocean Foods</a></li>
                                                <li class="menu-item menu-item-has-children has-child">
                                                    <a href="#" class="menu-name" data-title="Butter & Eggs"><i class="biolife-icon icon-honey"></i>Butter & Eggs</a>
                                                    <ul class="sub-menu">
                                                        <li class="menu-item"><a href="#">Omelettes</a></li>
                                                        <li class="menu-item"><a href="#">Breakfast Scrambles</a></li>
                                                        <li class="menu-item menu-item-has-children has-child"><a href="#" class="menu-name" data-title="Eggs & other considerations">Eggs & other considerations</a>
                                                            <ul class="sub-menu">
                                                                <li class="menu-item"><a href="#">Classic Breakfast</a></li>
                                                                <li class="menu-item"><a href="#">Huevos Rancheros</a></li>
                                                                <li class="menu-item"><a href="#">Everything Egg Sandwich</a></li>
                                                                <li class="menu-item"><a href="#">Egg Sandwich</a></li>
                                                                <li class="menu-item"><a href="#">Vegan Burrito</a></li>
                                                                <li class="menu-item"><a href="#">Biscuits and Gravy</a></li>
                                                                <li class="menu-item"><a href="#">Bacon Avo Egg Sandwich</a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="menu-item"><a href="#">Griddle</a></li>
                                                        <li class="menu-item menu-item-has-children has-child"><a href="#" class="menu-name" data-title="Sides & Extras">Sides & Extras</a>
                                                            <ul class="sub-menu">
                                                                <li class="menu-item"><a href="#">Breakfast Burrito</a></li>
                                                                <li class="menu-item"><a href="#">Crab Cake Benedict</a></li>
                                                                <li class="menu-item"><a href="#">Corned Beef Hash</a></li>
                                                                <li class="menu-item"><a href="#">Steak & Eggs</a></li>
                                                                <li class="menu-item"><a href="#">Oatmeal</a></li>
                                                                <li class="menu-item"><a href="#">Fruit & Yogurt Parfait</a></li>
                                                            </ul>
                                                        </li>
                                                        <li class="menu-item"><a href="#">Biscuits</a></li>
                                                        <li class="menu-item"><a href="#">Seasonal Fruit Plate</a></li>
                                                    </ul>
                                                </li>
                                                <li class="menu-item"><a href="#" class="menu-title"><i class="biolife-icon icon-fast-food"></i>Fastfood</a></li>
                                                <li class="menu-item"><a href="#" class="menu-title"><i class="biolife-icon icon-beef"></i>Fresh Meat</a></li>
                                                <li class="menu-item"><a href="#" class="menu-title"><i class="biolife-icon icon-onions"></i>Fresh Onion</a></li>
                                                <li class="menu-item"><a href="#" class="menu-title"><i class="biolife-icon icon-avocado"></i>Papaya & Crisps</a></li>
                                                <li class="menu-item"><a href="#" class="menu-title"><i class="biolife-icon icon-contain"></i>Oatmeal</a></li>
                                                <li class="menu-item"><a href="#" class="menu-title"><i class="biolife-icon icon-fresh-juice"></i>Fresh Bananas & Plantains</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 padding-top-2px">
                                    <div class="header-search-bar layout-01">
                                        <form action="#" class="form-search" name="desktop-seacrh" method="get">
                                            <input type="text" name="s" class="input-text" value="" placeholder="Search here...">
                                            <select name="category">
                                                <option value="-1" selected>All Categories</option>
                                                <option value="vegetables">Vegetables</option>
                                                <option value="fresh_berries">Fresh Berries</option>
                                                <option value="ocean_foods">Ocean Foods</option>
                                                <option value="butter_eggs">Butter & Eggs</option>
                                                <option value="fastfood">Fastfood</option>
                                                <option value="fresh_meat">Fresh Meat</option>
                                                <option value="fresh_onion">Fresh Onion</option>
                                                <option value="papaya_crisps">Papaya & Crisps</option>
                                                <option value="oatmeal">Oatmeal</option>
                                            </select>
                                            <button type="submit" class="btn-submit"><i class="biolife-icon icon-search"></i></button>
                                        </form>
                                    </div>
                                    <div class="live-info">
                                        <p class="telephone"><i class="fa fa-phone" aria-hidden="true"></i><b class="phone-number">(+900) 123 456 7891</b></p>
                                        <p class="working-time">Mon-Fri: 8:30am-7:30pm; Sat-Sun: 9:30am-4:30pm</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>-->

            <!--Hero Section-->
            <div class="hero-section hero-background">
                <h1 class="page-title">Details</h1>
            </div>

            <!--Navigation section-->
            <div class="container">
                <nav class="biolife-nav">
                    <ul>
                        <li class="nav-item"><a href="home" class="permal-link">Home</a></li>
                        <li class="nav-item"><a href="category?cid=${cid}" class="permal-link">${categoryName}</a></li>
                    <li class="nav-item"><span class="current-page">${productName}</span></li>
                </ul>
            </nav>
        </div>

        <div class="page-contain single-product">
            <div class="container">

                <!-- Main content -->
                <div id="main-content" class="main-content">

                    <!-- summary info -->
                    <div class="sumary-product single-layout"" >
                        <div class="media">
                            <ul class="biolife-carousel slider-for" data-slick='{"arrows":false,"dots":false,"slidesMargin":30,"slidesToShow":1,"slidesToScroll":1,"fade":true,"asNavFor":".slider-nav"}'>
                                <li><img src="${img}" alt=""  style="
                                         width: 400px;
                                         height: 350px;
                                         object-fit: contain;
                                         display: block;
                                         margin: 0 auto;
                                         border-radius: 8px;
                                         background-color: #f8f8f8;
                                         box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                                         transition: transform 0.3s ease;
                                         "
                                         onmouseover="this.style.transform = 'scale(1.05)'" 
                                         onmouseout="this.style.transform = 'scale(1)'"></li>
                                <!--                            <li><img src="assets/images/details-product/detail_02.jpg" alt="" width="500" height="500"></li>
                                                            <li><img src="assets/images/details-product/detail_03.jpg" alt="" width="500" height="500"></li>
                                                            <li><img src="assets/images/details-product/detail_04.jpg" alt="" width="500" height="500"></li>
                                                            <li><img src="assets/images/details-product/detail_05.jpg" alt="" width="500" height="500"></li>
                                                            <li><img src="assets/images/details-product/detail_06.jpg" alt="" width="500" height="500"></li>
                                                            <li><img src="assets/images/details-product/detail_07.jpg" alt="" width="500" height="500"></li>-->
                            </ul>
                            <ul class="biolife-carousel slider-nav" data-slick='{"arrows":false,"dots":false,"centerMode":false,"focusOnSelect":true,"slidesMargin":10,"slidesToShow":4,"slidesToScroll":1,"asNavFor":".slider-for"}'>
                                <li><img src="${img}" alt="" style="
                                         width: 88px;
                                         height: 88px;
                                         object-fit: contain;
                                         border-radius: 4px;
                                         border: 2px solid transparent;
                                         background-color: #f8f8f8;
                                         transition: all 0.3s ease;
                                         cursor: pointer;
                                         "
                                         onmouseover="this.style.borderColor = '#4CAF50'" 
                                         onmouseout="this.style.borderColor = 'transparent'"></li>
                                <!--                            <li><img src="assets/images/details-product/thumb_02.jpg" alt="" width="88" height="88"></li>
                                                            <li><img src="assets/images/details-product/thumb_03.jpg" alt="" width="88" height="88"></li>
                                                            <li><img src="assets/images/details-product/thumb_04.jpg" alt="" width="88" height="88"></li>
                                                            <li><img src="assets/images/details-product/thumb_05.jpg" alt="" width="88" height="88"></li>
                                                            <li><img src="assets/images/details-product/thumb_06.jpg" alt="" width="88" height="88"></li>
                                                            <li><img src="assets/images/details-product/thumb_07.jpg" alt="" width="88" height="88"></li>-->
                            </ul>
                        </div>
                        <div class="product-attribute">
                            <h3 class="title">${productName}</h3>
                            <div class="rating">
                                <p class="star-rating"><span class="width-80percent"></span></p>
                                <span class="review-count">(04 Reviews)</span>
                                <!--                                <span class="qa-text">Q&A</span>
                                                                <b class="category">By: Natural food</b>-->
                            </div>
                            <!--                            <span class="sku">Sku: #76584HH</span>
                                                        <p class="excerpt">${description}</p>-->
                            <div class="price">
                                <ins><span class="price-amount"><span class="currencySymbol"></span><fmt:formatNumber value="${price}" type="currency"/></span></ins>
                                <!--<del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>-->
                            </div>
                            <!--                            <div class="product-atts">
                                                            <div class="atts-item">
                                                                <span class="title">Color:</span>
                                                                <ul class="color-list">
                                                                    <li class="color-item"><a href="#" class="c-link"><span class="symbol img-color"></span>Multi</a></li>
                                                                    <li class="color-item"><a href="#" class="c-link"><span class="symbol hex-code color-01"></span>Red</a></li>
                                                                    <li class="color-item"><a href="#" class="c-link"><span class="symbol hex-code color-02"></span>Orrange</a></li>
                                                                    <li class="color-item"><a href="#" class="c-link"><span class="symbol hex-code color-03"></span>Other</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>-->
                            <!--                            <div class="shipping-info">
                                                            <p class="shipping-day">3-Day Shipping</p>
                                                            <p class="for-today">Pree Pickup Today</p>
                                                        </div>-->
                        </div>
                        <div class="action-form">
                            <div class="quantity-box">
                                <span class="title">Quantity:</span>
                                <div class="qty-input">
                                    <input type="text" 
                                           id="quantity" 
                                           name="quantity" 
                                           value="1" 
                                           data-max_value="${detail.stock}" 
                                           data-min_value="1" 
                                           data-step="1"
                                           oninput="this.value = this.value > ${detail.stock} ? ${detail.stock} : Math.abs(this.value)">
                                    <a  class="qty-btn btn-up" onclick="event.preventDefault();
                                        let q = document.getElementById('quantity'); if (parseInt(q.value) < ${detail.stock})
                                            q.value++;
                                        else
                                            alert('Số lượng vượt quá hàng tồn kho! (Còn ${detail.stock} sản phẩm)');"><i class="fa fa-caret-up" aria-hidden="true"></i>
                                    </a>
                                            <a  class="qty-btn btn-down" onclick="event.preventDefault(); let q = document.getElementById('quantity'); if (q.value > 1)q.value--;">
                                                <i class="fa fa-caret-down" aria-hidden="true"></i>
                                            </a>
                                </div>
                                <p class="stock-info">Còn lại: ${detail.stock} sản phẩm</p>
                            </div>

                            <div class="buttons">
                                <a onclick="addToCart(${detail.id}, document.getElementById('quantity').value)" class="btn add-to-cart-btn">
                                    <i class="fa fa-cart-plus"></i> Add to cart
                                </a>
                            </div>

                            <!--                            <input type="hidden" name="action" value="add">
                                                        <input type="hidden" name="id" value="${item.product.id}">
                                                        <input type="number" min="1" name="quantity" value="${item.quantity}" min="1" 
                                                               style="width:80px; height:35px; padding:0 10px; border:1px solid #e6e6e6;">
                                                        <button type="submit" class="btn btn-info" style="padding:5px 10px; margin-left:10px;">
                                                            <i class="fa fa-refresh"></i> add to cart
                                                        </button>-->


                            <!--                            <div class="location-shipping-to">
                                                            <span class="title">Ship to:</span>
                                                            <select name="shipping_to" class="country">
                                                                <option value="-1">Select Country</option>
                                                                <option value="america">America</option>
                                                                <option value="france">France</option>
                                                                <option value="germany">Germany</option>
                                                                <option value="japan">Japan</option>
                                                            </select>
                                                        </div>-->
                            <div class="social-media">
                                <ul class="social-list">
                                    <li><a href="#" class="social-link"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="social-link"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="social-link"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="social-link"><i class="fa fa-share-alt" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="social-link"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="acepted-payment-methods">
                                <ul class="payment-methods">
                                    <li><img src="assets/images/card1.jpg" alt="" width="51" height="36"></li>
                                    <li><img src="assets/images/card2.jpg" alt="" width="51" height="36"></li>
                                    <li><img src="assets/images/card3.jpg" alt="" width="51" height="36"></li>
                                    <li><img src="assets/images/card4.jpg" alt="" width="51" height="36"></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Tab info -->
                    <div class="product-tabs single-layout biolife-tab-contain">
                        <div class="tab-head">
                            <ul class="tabs">
                                <li class="tab-element active"><a href="#tab_1st" class="tab-link">Products Descriptions</a></li>
                                <!--                            <li class="tab-element" ><a href="#tab_2nd" class="tab-link">Addtional information</a></li>
                                                            <li class="tab-element" ><a href="#tab_3rd" class="tab-link">Shipping & Delivery</a></li>-->
                                <li class="tab-element" ><a href="#tab_4th" class="tab-link">Customer Reviews <sup>(3)</sup></a></li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div id="tab_1st" class="tab-contain desc-tab active">
                                <p class="desc">${description}</p>
                                <div class="desc-expand">
                                    <!--                                <span class="title">name</span>
                                                                    <ul class="list">
                                                                        <li>100% real fruit ingredients</li>
                                                                        <li>100 fresh fruit bags individually wrapped</li>
                                                                        <li>Blending Eastern & Western traditions, naturally</li>
                                                                    </ul>-->
                                </div>
                            </div>
                            <!--                        <div id="tab_2nd" class="tab-contain addtional-info-tab">
                                                        <table class="tbl_attributes">
                                                            <tbody>
                                                            <tr>
                                                                <th>Color</th>
                                                                <td><p>Black, Blue, Purple, Red, Yellow</p></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Size</th>
                                                                <td><p>S, M, L</p></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>-->
                            <!--                        <div id="tab_3rd" class="tab-contain shipping-delivery-tab">
                                                        <div class="accodition-tab biolife-accodition">
                                                            <ul class="tabs">
                                                                <li class="tab-item">
                                                                    <span class="title btn-expand">How long will it take to receive my order?</span>
                                                                    <div class="content">
                                                                        <p>Orders placed before 3pm eastern time will normally be processed and shipped by the following business day. For orders received after 3pm, they will generally be processed and shipped on the second business day. For example if you place your order after 3pm on Monday the order will ship on Wednesday. Business days do not include Saturday and Sunday and all Holidays. Please allow additional processing time if you order is placed on a weekend or holiday. Once an order is processed, speed of delivery will be determined as follows based on the shipping mode selected:</p>
                                                                        <div class="desc-expand">
                                                                            <span class="title">Shipping mode</span>
                                                                            <ul class="list">
                                                                                <li>Standard (in transit 3-5 business days)</li>
                                                                                <li>Priority (in transit 2-3 business days)</li>
                                                                                <li>Express (in transit 1-2 business days)</li>
                                                                                <li>Gift Card Orders are shipped via USPS First Class Mail. First Class mail will be delivered within 8 business days</li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="tab-item">
                                                                    <span class="title btn-expand">How is the shipping cost calculated?</span>
                                                                    <div class="content">
                                                                        <p>You will pay a shipping rate based on the weight and size of the order. Large or heavy items may include an oversized handling fee. Total shipping fees are shown in your shopping cart. Please refer to the following shipping table:</p>
                                                                        <p>Note: Shipping weight calculated in cart may differ from weights listed on product pages due to size and actual weight of the item.</p>
                                                                    </div>
                                                                </li>
                                                                <li class="tab-item">
                                                                    <span class="title btn-expand">Why Didn’t My Order Qualify for FREE shipping?</span>
                                                                    <div class="content">
                                                                        <p>We do not deliver to P.O. boxes or military (APO, FPO, PSC) boxes. We deliver to all 50 states plus Puerto Rico. Certain items may be excluded for delivery to Puerto Rico. This will be indicated on the product page.</p>
                                                                    </div>
                                                                </li>
                                                                <li class="tab-item">
                                                                    <span class="title btn-expand">Shipping Restrictions?</span>
                                                                    <div class="content">
                                                                        <p>We do not deliver to P.O. boxes or military (APO, FPO, PSC) boxes. We deliver to all 50 states plus Puerto Rico. Certain items may be excluded for delivery to Puerto Rico. This will be indicated on the product page.</p>
                                                                    </div>
                                                                </li>
                                                                <li class="tab-item">
                                                                    <span class="title btn-expand">Undeliverable Packages?</span>
                                                                    <div class="content">
                                                                        <p>Occasionally packages are returned to us as undeliverable by the carrier. When the carrier returns an undeliverable package to us, we will cancel the order and refund the purchase price less the shipping charges. Here are a few reasons packages may be returned to us as undeliverable:</p>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>-->
                            <div id="tab_4th" class="tab-contain review-tab">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
                                            <div class="rating-info">
                                                <!-- Debug output to see what's being passed -->
                                                <!-- Debug: ${averageRating} -->
                                                <p class="index"><strong class="rating">${averageRating != null && averageRating > 0 ? String.format("%.1f", averageRating) : "0.0"}</strong>out of 5</p>
                                                <div class="rating">
                                                    <p class="star-rating"><span class="width-${averageRating != null && averageRating > 0 ? (averageRating * 20) : 0}percent"></span></p>
                                                </div>
                                                <p class="see-all">See all ${reviewCount > 0 ? reviewCount : 0} reviews</p>
                                                <ul class="options">
                                                    <li>
                                                        <div class="detail-for">
                                                            <span class="option-name">5 stars</span>
                                                            <span class="progres">
                                                                <span class="line-100percent">
                                                                    <span class="percent width-${ratingDistribution != null && ratingDistribution[4] > 0 && reviewCount > 0 ? (ratingDistribution[4] * 100 / reviewCount) : 0}percent"></span>
                                                                </span>
                                                            </span>
                                                            <span class="number">${ratingDistribution != null ? ratingDistribution[4] : 0}</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="detail-for">
                                                            <span class="option-name">4 stars</span>
                                                            <span class="progres">
                                                                <span class="line-100percent">
                                                                    <span class="percent width-${ratingDistribution != null && ratingDistribution[3] > 0 ? (ratingDistribution[3] * 100 / reviewCount) : 0}percent"></span>
                                                                </span>
                                                            </span>
                                                            <span class="number">${ratingDistribution != null ? ratingDistribution[3] : 0}</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="detail-for">
                                                            <span class="option-name">3 stars</span>
                                                            <span class="progres">
                                                                <span class="line-100percent">
                                                                    <span class="percent width-${ratingDistribution != null && ratingDistribution[2] > 0 ? (ratingDistribution[2] * 100 / reviewCount) : 0}percent"></span>
                                                                </span>
                                                            </span>
                                                            <span class="number">${ratingDistribution != null ? ratingDistribution[2] : 0}</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="detail-for">
                                                            <span class="option-name">2 stars</span>
                                                            <span class="progres">
                                                                <span class="line-100percent">
                                                                    <span class="percent width-${ratingDistribution != null && ratingDistribution[1] > 0 ? (ratingDistribution[1] * 100 / reviewCount) : 0}percent"></span>
                                                                </span>
                                                            </span>
                                                            <span class="number">${ratingDistribution != null ? ratingDistribution[1] : 0}</span>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="detail-for">
                                                            <span class="option-name">1 star</span>
                                                            <span class="progres">
                                                                <span class="line-100percent">
                                                                    <span class="percent width-${ratingDistribution != null && ratingDistribution[0] > 0 ? (ratingDistribution[0] * 100 / reviewCount) : 0}percent"></span>
                                                                </span>
                                                            </span>
                                                            <span class="number">${ratingDistribution != null ? ratingDistribution[0] : 0}</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-6 col-xs-12">
                                            <div class="review-form-wrapper">
                                                <span class="title">Submit your review</span>
                                                <c:choose>
                                                    <c:when test="${sessionScope.acc != null}">
                                                        <form action="add-review" method="post" name="frm-review">
                                                            <input type="hidden" name="productId" value="${detail.id}">
                                                            <div class="comment-form-rating">
                                                                <label>1. Your rating of this product:</label>
                                                                <p class="stars">
                                                                    <span>
                                                                        <a class="btn-rating" data-value="star-1" href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                                        <a class="btn-rating" data-value="star-2" href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                                        <a class="btn-rating" data-value="star-3" href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                                        <a class="btn-rating" data-value="star-4" href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                                        <a class="btn-rating" data-value="star-5" href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                                    </span>
                                                                </p>
                                                                <input type="hidden" name="rating" id="selected-rating" value="5">
                                                            </div>
                                                            <p class="form-row">
                                                                <textarea name="reviewText" id="txt-comment" cols="30" rows="10" placeholder="Write your review here..." required></textarea>
                                                            </p>
                                                            <p class="form-row">
                                                                <button type="submit" name="submit">Submit Review</button>
                                                            </p>
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="login-request">
                                                            <p>Please <a href="login?returnUrl=detail?pid=${detail.id}">login</a> to submit a review.</p>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="comments">
                                        <h3 class="comment-title">${reviewCount} Reviews for ${productName}</h3>
                                        <ol class="commentlist">
                                            <c:if test="${reviews.size() == 0}">
                                                <li class="no-reviews">
                                                    <p>No reviews yet. Be the first to review this product!</p>
                                                </li>
                                            </c:if>
                                            <c:forEach var="review" items="${reviews}">
                                                <li class="review">
                                                    <div class="comment-container">
                                                        <div class="row">
                                                            <div class="comment-content col-lg-8 col-md-9 col-sm-8 col-xs-12">
                                                                <p class="comment-in">
                                                                    <span class="post-name">${review.reviewText}</span>
                                                                    <span class="post-date">
                                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${review.reviewDate}" />
                                                                    </span>
                                                                </p>
                                                                <div class="rating">
                                                                    <p class="star-rating">
                                                                        <span class="width-${review.rating * 20}percent"></span>
                                                                    </p>
                                                                </div>
                                                                <p class="author">by: <b>${review.userName}</b></p>
                                                            </div>
                                                            <div class="comment-review-form col-lg-3 col-lg-offset-1 col-md-3 col-sm-4 col-xs-12">
                                                                <span class="title">Was this review helpful?</span>
                                                                <ul class="actions">
                                                                    <li><a href="#" class="btn-act like" data-type="like"><i class="fa fa-thumbs-up" aria-hidden="true"></i>Yes</a></li>
                                                                    <li><a href="#" class="btn-act hate" data-type="dislike"><i class="fa fa-thumbs-down" aria-hidden="true"></i>No</a></li>
                                                                    <li><a href="#" class="btn-act report" data-type="dislike"><i class="fa fa-flag" aria-hidden="true"></i>Report</a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ol>
                                        <c:if test="${reviewCount > 5}">
                                            <div class="biolife-panigations-block version-2">
                                                <ul class="panigation-contain">
                                                    <li><span class="current-page">1</span></li>
                                                    <li><a href="#" class="link-page">2</a></li>
                                                        <c:if test="${reviewCount > 10}">
                                                        <li><a href="#" class="link-page">3</a></li>
                                                        <li><span class="sep">....</span></li>
                                                        <li><a href="#" class="link-page">${Math.ceil(reviewCount/5)}</a></li>
                                                        </c:if>
                                                    <li><a href="#" class="link-page next"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                                </ul>
                                                <div class="result-count">
                                                    <p class="txt-count"><b>1-5</b> of <b>${reviewCount}</b> reviews</p>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- related products -->
                    <div class="product-related-box single-layout">
                        <div class="biolife-title-box lg-margin-bottom-26px-im">
                            <span class="biolife-icon icon-organic"></span>
                            <span class="subtitle">All the best item for You</span>
                            <h3 class="main-title">Related Products</h3>
                        </div>
                        <ul class="products-list biolife-carousel nav-center-02 nav-none-on-mobile" data-slick='{"rows":1,"arrows":true,"dots":false,"infinite":false,"speed":400,"slidesMargin":0,"slidesToShow":5, "responsive":[{"breakpoint":1200, "settings":{ "slidesToShow": 4}},{"breakpoint":992, "settings":{ "slidesToShow": 3, "slidesMargin":20 }},{"breakpoint":768, "settings":{ "slidesToShow": 2, "slidesMargin":10}}]}'>
                            <c:forEach var="p" items="${listPP}">
                                <li class="product-item">
                                    <div class="contain-product layout-default">
                                        <div class="product-thumb">
                                            <a href="#" class="link-to-product">
                                                <img src="${p.img}" alt="dd" width="270" height="270" class="product-thumnail">
                                            </a>
                                        </div>
                                        <div class="info">
                                            <b class="categories" data-category-id="${cid}"></b>
                                            <h4 class="product-title"><a href="detail?pid=${p.id}" class="pr-name">${p.name}</a></h4>
                                            <div class="price">
                                                <ins><span class="price-amount"><span class="currencySymbol"></span><fmt:formatNumber value="${p.price}" type="currency"/></span></ins>
                                                <!--<del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>-->
                                            </div>
                                            <div class="slide-down-box">
                                                <p class="message">"Tinh dầu cao cấp, thuần khiết & an toàn."</p>
                                                <div class="buttons">
                                                    <!--                                            <a href="#" class="btn wishlist-btn"><i class="fa fa-heart" aria-hidden="true"></i></a>-->
                                                    <a href="#" class="btn add-to-cart-btn"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i>add to cart</a>
                                                    <a href="#" class="btn compare-btn"><i class="fa fa-random" aria-hidden="true"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                            <!--                        <li class="product-item">
                                                        <div class="contain-product layout-default">
                                                            <div class="product-thumb">
                                                                <a href="#" class="link-to-product">
                                                                    <img src="assets/images/products/p-14.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                                </a>
                                                            </div>
                                                            <div class="info">
                                                                <b class="categories">Fresh Fruit</b>
                                                                <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                                <div class="price">
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
                                                                    <img src="assets/images/products/p-15.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                                </a>
                                                            </div>
                                                            <div class="info">
                                                                <b class="categories">Fresh Fruit</b>
                                                                <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                                <div class="price">
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
                                                                    <img src="assets/images/products/p-10.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                                </a>
                                                            </div>
                                                            <div class="info">
                                                                <b class="categories">Fresh Fruit</b>
                                                                <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                                <div class="price">
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
                                                                    <img src="assets/images/products/p-08.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                                </a>
                                                            </div>
                                                            <div class="info">
                                                                <b class="categories">Fresh Fruit</b>
                                                                <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                                <div class="price">
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
                                                                    <img src="assets/images/products/p-21.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                                </a>
                                                            </div>
                                                            <div class="info">
                                                                <b class="categories">Fresh Fruit</b>
                                                                <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                                <div class="price">
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
                                                                    <img src="assets/images/products/p-18.jpg" alt="dd" width="270" height="270" class="product-thumnail">
                                                                </a>
                                                            </div>
                                                            <div class="info">
                                                                <b class="categories">Fresh Fruit</b>
                                                                <h4 class="product-title"><a href="#" class="pr-name">National Fresh Fruit</a></h4>
                                                                <div class="price">
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
                                                    </li>-->

                        </ul>
                    </div>

                </div>
            </div>
        </div>

        <!-- FOOTER -->
        <jsp:include page="Footer.jsp"></jsp:include>

        <!--    <footer id="footer" class="footer layout-03">
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
                                            <span>(700)  9001-1909  (900) 689 -66</span>
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

        <script>
                                        $(document).ready(function () {
                                            const ratingBtns = document.querySelectorAll('.btn-rating');
                                            const ratingInput = document.getElementById('selected-rating');

                                            ratingBtns.forEach((btn, index) => {
                                                btn.addEventListener('click', function (e) {
                                                    e.preventDefault();

                                                    // Set the rating value (index + 1 because stars are 1-based)
                                                    const ratingValue = index + 1;
                                                    ratingInput.value = ratingValue;

                                                    // Update the visual appearance
                                                    ratingBtns.forEach((b, i) => {
                                                        const star = b.querySelector('i');
                                                        if (i <= index) {
                                                            star.className = 'fa fa-star';
                                                        } else {
                                                            star.className = 'fa fa-star-o';
                                                        }
                                                    });
                                                });
                                            });

                                            // Check if hash contains tab=reviews to activate the reviews tab
                                            if (window.location.hash === '#tab_4th' || window.location.search.includes('tab=reviews')) {
                                                // Find the review tab link and trigger a click
                                                const reviewTabLink = document.querySelector('a[href="#tab_4th"]');
                                                if (reviewTabLink) {
                                                    setTimeout(() => {
                                                        reviewTabLink.click();
                                                    }, 100);
                                                }
                                            }
                                        });
                                        $(document).ready(function () {
                                            const ratingBtns = document.querySelectorAll('.btn-rating');
                                            const ratingInput = document.getElementById('selected-rating');

                                            // Hiển thị mặc định 5 sao khi trang được tải
                                            function initRating() {
                                                const defaultRating = ratingInput.value || 5;
                                                updateStarsDisplay(defaultRating);
                                            }

                                            // Cập nhật hiển thị sao dựa trên giá trị đánh giá
                                            function updateStarsDisplay(rating) {
                                                ratingBtns.forEach((btn, i) => {
                                                    const star = btn.querySelector('i');
                                                    if (i < rating) {
                                                        star.className = 'fa fa-star'; // Sao đầy đủ
                                                    } else {
                                                        star.className = 'fa fa-star-o'; // Sao rỗng
                                                    }
                                                });
                                            }

                                            // Sự kiện click cho các nút sao
                                            ratingBtns.forEach((btn, index) => {
                                                btn.addEventListener('click', function (e) {
                                                    e.preventDefault();

                                                    // Set the rating value (index + 1 because stars are 1-based)
                                                    const ratingValue = index + 1;
                                                    ratingInput.value = ratingValue;

                                                    // Update the visual appearance
                                                    updateStarsDisplay(ratingValue);
                                                });

                                                // Thêm hiệu ứng hover
                                                btn.addEventListener('mouseenter', function () {
                                                    // Hiển thị sao khi hover
                                                    ratingBtns.forEach((b, i) => {
                                                        const star = b.querySelector('i');
                                                        if (i <= index) {
                                                            star.className = 'fa fa-star';
                                                        } else {
                                                            star.className = 'fa fa-star-o';
                                                        }
                                                    });
                                                });
                                            });

                                            // Xử lý sự kiện khi chuột rời khỏi vùng sao
                                            const starsContainer = document.querySelector('.stars');
                                            if (starsContainer) {
                                                starsContainer.addEventListener('mouseleave', function () {
                                                    // Khôi phục trạng thái sao dựa trên giá trị đã chọn
                                                    const currentRating = parseInt(ratingInput.value) || 5;
                                                    updateStarsDisplay(currentRating);
                                                });
                                            }

                                            // Khởi tạo sao khi trang tải
                                            initRating();

                                            // Check if hash contains tab=reviews to activate the reviews tab
                                            if (window.location.hash === '#tab_4th' || window.location.search.includes('tab=reviews')) {
                                                // Find the review tab link and trigger a click
                                                const reviewTabLink = document.querySelector('a[href="#tab_4th"]');
                                                if (reviewTabLink) {
                                                    setTimeout(() => {
                                                        reviewTabLink.click();
                                                    }, 100);
                                                }
                                            }
                                        });
        </script>


    </body>

</html>