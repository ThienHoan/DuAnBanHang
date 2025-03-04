
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header" class="header-area style-01 layout-03">
    <div class="header-top bg-main hidden-xs">
        <div class="container">
            <div class="top-bar left">
                <ul class="horizontal-menu">
                    <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i>Organic@company.com</a></li>
                    <li><a href="#">Free Shipping for all Order of $99</a></li>
                </ul>
            </div>
            <div class="top-bar right" style="max-width: unset !important;">
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
                    <c:if test="${sessionScope.account != null}">  <!--gọi session acoount kiểm tra-->

                        <li style="min-width: unset !important;">
                            <a href="logout" class="login-link" style="min-width: unset !important; display: inline-block;"><i></i>Logout</a>
                        </li>
                        <li><a href="#" class="login-link"><i class="biolife-icon icon-login"></i>Hello ${sessionScope.account.user}</a></li>

                    </c:if>
                    <c:if test="${sessionScope.account == null}">
                        <li><a href="Login.jsp" class="login-link"><i class="biolife-icon icon-login"></i>Login/Register</a></li>
                        </c:if>

                </ul>
            </div>
        </div>
    </div>
    <div class="header-middle biolife-sticky-object ">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-2 col-md-6 col-xs-6">
                    <a href="home" class="biolife-logo"><img src="assets/images/organic-3-green.png" alt="biolife logo" width="135" height="36"></a>
                </div>
                <div class="col-lg-6 col-md-7 hidden-sm hidden-xs">
                    <div class="primary-menu">
                        <ul class="menu biolife-menu clone-main-menu clone-primary-menu" id="primary-menu" data-menuname="main menu">
                            <li class="menu-item"><a href="home">Home</a></li>
                            <li class="menu-item menu-item-has-children has-child">
                                <a href="#" class="menu-name" data-title="Product">Product</a>
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
<!--                            <li class="menu-item menu-item-has-children has-megamenu">
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
                            </li>-->
                            <li class="menu-item"><a href="contact.html">Contact</a></li>
                            
                            
                            <c:if test="${sessionScope.account.isAdmin == 1}">
                                <li class="menu-item"><a href="ManagerAccount.jsp">Manager Account</a></li>
                        </c:if>
                            <c:if test="${sessionScope.account.isSell == 1}">
                            <li class="menu-item"><a href="manager">Manager Product</a></li>
                        </c:if>
                        
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-md-6 col-xs-6">
                    <div class="biolife-cart-info">
                        <div class="mobile-search">
                            <a href="javascript:void(0)" class="open-searchbox"><i class="biolife-icon icon-search"></i></a>
                            <div class="mobile-search-content">
                                <form action="search" method="post" class="form-search" name="mobile-seacrh" method="get">
                                    <a href="#" class="btn-close"><span class="biolife-icon icon-close-menu"></span></a>
                                    <input type="text" name="txt" class="input-text" value="" placeholder="Search here...">
                                    <!--                                            <select name="category">
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
                                                                                </select>-->
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
                                <c:forEach items="${listCC}" var="o">
                                    <li class="list-group-item text-white"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                                    </c:forEach>
                                <li class="menu-item"><a href="#" class="menu-name" data-title="Ocean Foods"><i class="biolife-icon icon-fish"></i>Ocean Foods</a></li>

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
                        <form action="search"  class="form-search" name="desktop-seacrh" method="get">
                            <input type="text" name="txt" class="input-text" value="" placeholder="Search here...">
                            <!--                                    <select name="category">
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
                                                                </select>-->
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
</header>
