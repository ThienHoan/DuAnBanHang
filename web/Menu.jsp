<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header" class="header-area style-01 layout-03">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    
    <!-- Thêm script trình phát nhạc -->
        <script src="assets/js/music-player.js"></script>
        <style>
            /* Kiểu dáng cho nút bật/tắt nhạc */
            .music-toggle-btn {
                background: none;
                border: none;
                cursor: pointer;
                padding: 8px 12px;
                color: #4CAF50;
                font-size: 18px;
            }
            .music-toggle-btn:focus {
                outline: none;
            }
        </style>
    <div class="header-top bg-main hidden-xs">
        <div class="container">
            <div class="top-bar left">
                <ul class="horizontal-menu">
                    <li>
                        <a href="mailto:hoan64735@gmail.com?subject=Phản Hồi Về Chất Lượng Sản phẩm email&body=Nội dung email">
                            <i class="fa fa-envelope" aria-hidden="true"></i>hoan64735@gmail.com
                        </a>
                    </li>
                    
                    <li><a href="https://www.facebook.com/Dautronghoa" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i>Công Ty Gia Truyền Hồng Đức</a></li>
                </ul>
            </div>
            <div class="top-bar right" style="max-width: unset !important;">
                <ul class="horizontal-menu">
                    <c:if test="${sessionScope.account != null}">
                        <li style="min-width: unset !important;">
                            <a href="logout" class="login-link" style="min-width: unset !important; display: inline-block;"><i></i>Logout</a>
                        </li>
                        <li><a href="#" class="login-link"><i class="biolife-icon icon-login"></i>Hello ${sessionScope.account.userName}</a></li>
                    </c:if>
                    <c:if test="${sessionScope.account == null}">
                        <li><a href="Login.jsp" class="login-link"><i class="biolife-icon icon-login"></i>Login/Register</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="header-middle biolife-sticky-object">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-2 col-md-6 col-xs-6">
                    <a href="home" class="biolife-logo"><img src="hinh anh/Logo/logo-gia-truyen-hong-duc1.png" alt="biolife logo" width="220" height="60"></a>
                </div>
                <div class="col-lg-6 col-md-7 hidden-sm hidden-xs">
                    <div class="primary-menu">
                        <ul class="menu biolife-menu clone-main-menu clone-primary-menu" id="primary-menu" data-menuname="main menu">
                            <li class="menu-item">
                                <button id="musicToggleBtn" class="music-toggle-btn" onclick="toggleMusic()" title="Tắt nhạc">
                                    <i class="fas fa-volume-up"></i>
                                </button>
                            </li>
                            <li class="menu-item"><a href="home">Home</a></li>
                            <li class="menu-item menu-item-has-children has-child">
                                <a href="#" class="menu-name" data-title="Product">Product</a>
                                <ul class="sub-menu">
                                    <c:forEach items="${listCC}" var="c">
                                        <li class="menu-item"><a href="category?cid=${c.cid}&cname=${c.cname}">${c.cname}</a></li>
                                        </c:forEach>
                                    <!--                                    <li class="menu-item"><a href="#">Tinh dầu xông phòng</a></li>
                                                                        <li class="menu-item"><a href="#">Tinh dầu xe hơi</a></li>
                                                                        <li class="menu-item"><a href="#">Tinh dầu massage</a></li>
                                                                        <li class="menu-item"><a href="#">Tinh dầu dạng xịt</a></li>-->



                                    <!--                                    <li class="menu-item menu-item-has-children has-child"><a href="#" class="menu-name" data-title="Eggs & other considerations">Eggs & other considerations</a>
                                                                            <ul class="sub-menu">
                                                                                <li class="menu-item"><a href="#">Classic Breakfast</a></li>
                                                                                <li class="menu-item"><a href="#">Huevos Rancheros</a></li>
                                                                                <li class="menu-item"><a href="#">Everything Egg Sandwich</a></li>
                                                                                <li class="menu-item"><a href="#">Egg Sandwich</a></li>
                                                                                <li class="menu-item"><a href="#">Vegan Burrito</a></li>
                                                                                <li class="menu-item"><a href="#">Biscuits and Gravy</a></li>
                                                                                <li class="menu-item"><a href="#">Bacon Avo Egg Sandwich</a></li>
                                                                            </ul>
                                                                        </li>-->
                                    <!--                                    <li class="menu-item"><a href="#">Griddle</a></li>
                                                                        <li class="menu-item menu-item-has-children has-child"><a href="#" class="menu-name" data-title="Sides & Extras">Sides & Extras</a>
                                                                            <ul class="sub-menu">
                                                                                <li class="menu-item"><a href="#">Breakfast Burrito</a></li>
                                                                                <li class="menu-item"><a href="#">Crab Cake Benedict</a></li>
                                                                                <li class="menu-item"><a href="#">Corned Beef Hash</a></li>
                                                                                <li class="menu-item"><a href="#">Steak & Eggs</a></li>
                                                                                <li class="menu-item"><a href="#">Oatmeal</a></li>
                                                                                <li class="menu-item"><a href="#">Fruit & Yogurt Parfait</a></li>
                                                                            </ul>
                                                                        </li>-->
                                    <!--                                    <li class="menu-item"><a href="#">Biscuits</a></li>
                                                                        <li class="menu-item"><a href="#">Seasonal Fruit Plate</a></li>-->
                                </ul>
                            </li>
                            <li class="menu-item"><a href="userprofile">Profile</a></li>
                            <!--<li class="menu-item"><a href="https://maps.app.goo.gl/Q7d33wn8c6E68J8W8" target="_blank">Contact</a></li>-->
                            
                            <c:if test="${sessionScope.account.roleID == 3}">
                                <li class="menu-item"><a href="ManagerAccount.jsp">Manager Account</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account.roleID == 2 or sessionScope.account.roleID == 3}">
                                <li class="menu-item"><a href="manager">Manager Product</a></li>
                            </c:if>
                                <li class="nav-item">
    <a class="nav-link" href="orders">Đơn hàng</a>
</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-md-6 col-xs-6">
                    <div class="biolife-cart-info">
                        <!-- Mobile search -->
                        <div class="mobile-search">
                            <a href="javascript:void(0)" class="open-searchbox"><i class="biolife-icon icon-search"></i></a>
                            <div class="mobile-search-content">
<!--                                <form action="search" method="post" class="form-search" name="mobile-seacrh" method="get">
                                    <a href="#" class="btn-close"><span class="biolife-icon icon-close-menu"></span></a>
                                    <input type="text" name="txt" class="input-text" value="" placeholder="Search here">
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
                                </form>-->
                            </div>
                        </div>
                        
<!-- Wishlist -->
<div class="wishlist-block hidden-sm hidden-xs">
    <a href="wishlist?userID=<%= session.getAttribute("userID") %>" class="link-to">
        <span class="icon-qty-combine">
            <i class="icon-heart-bold biolife-icon"></i>
            <span class="qty">
                <%= session.getAttribute("wishlistCount") != null ? session.getAttribute("wishlistCount") : "0" %>
            </span>
        </span>
    </a>
</div>

                        
                        <!-- User account -->
                        <div class="minicart-block">
                            <div class="minicart-contain">
                                <c:if test="${sessionScope.account != null}">
<!--                                    <a href="userprofile" class="login-link">
                                        <i class="biolife-icon icon-login"></i>Hello ${sessionScope.account.userName}
                                    </a>-->
                                </c:if>
                                
                            </div>
                        </div>
                        <!-- Wishlist -->
                
                        
                        <!-- Shopping cart -->
                        <div class="minicart-block">
                            <div class="minicart-contain">
                                <a href="cart" class="link-to">
                                    <span class="icon-qty-combine">
                                        <i class="icon-cart-mini biolife-icon"></i>
                                    </span>
                                    <span class="title">Giỏ hàng </span>
                                    
                                </a>
<!--                                <div class="cart-content">
                                    <div class="cart-inner">
                                        <ul class="products">
                                             Cart items would go here 
                                        </ul>
                                        <p class="btn-control">
                                            <a href="#" class="btn view-cart">view cart</a>
                                            <a href="#" class="btn">checkout</a>
                                        </p>
                                    </div>
                                </div>-->
                            </div>
                        </div>
                        
                        <!-- Mobile menu toggle -->
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
                                <c:forEach items="${listCC}" var="o">
                                    <li class="list-group-item text-white"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 padding-top-2px">
                    <div class="header-search-bar layout-01">
                        <form action="search" class="form-search" name="desktop-seacrh" method="get">
                            <input type="text" name="txt" class="input-text" value="" placeholder="Search here...">
                            <select name="category">
                                <option value="-1" selected>All Categories</option>
                                <c:forEach items="${listCC}" var="c">
                                    <option value="${c.cid}" ${c.cid == selectedCid ? 'selected' : ''}>${c.cname}</option>
                                </c:forEach>
                            </select>

                           
                            <button type="submit" class="btn-submit"><i class="biolife-icon icon-search"></i></button>
                        </form>
                    </div>
                    <div class="live-info">
                        <p class="telephone"><i class="fa fa-phone" aria-hidden="true"></i><b class="phone-number">0914 145 788</b></p>
                        <p class="working-time">7 am - 5 pm</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</header>