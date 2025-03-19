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
        <script>
            function addToCart(productId, quantity) {
                fetch("cart?action=add&id=" + productId + "&quantity=" + quantity, {method: "POST"})
                        .then(response => response.text())
                        .then(data => {
                            alert("Đã thêm sản phẩm vào giỏ hàng!");
                        })
                        .catch(error => console.error("Lỗi:", error));
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
             onmouseover="this.style.transform='scale(1.05)'" 
             onmouseout="this.style.transform='scale(1)'"></li>
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
             onmouseover="this.style.borderColor='#4CAF50'" 
             onmouseout="this.style.borderColor='transparent'"></li>
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
                                    <input type="text" id="quantity" name="qty12554" value="1" data-max_value="20" data-min_value="1" data-step="1">
                                    <a href="#" class="qty-btn btn-up"><i class="fa fa-caret-up" aria-hidden="true"></i></a>
                                    <a href="#" class="qty-btn btn-down"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
                                </div>
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
                                            <b class="categories">${categoryName}</b>
                                            <h4 class="product-title"><a href="detail?pid=${p.id}" class="pr-name">${p.name}</a></h4>
                                            <div class="price">
                                                <ins><span class="price-amount"><span class="currencySymbol"></span><fmt:formatNumber value="${p.price}" type="currency"/></span></ins>
                                                <!--<del><span class="price-amount"><span class="currencySymbol">£</span>95.00</span></del>-->
                                            </div>
                                            <div class="slide-down-box">
                                                <p class="message">"Tinh dầu cao cấp, thuần khiết & an toàn."</p>
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
    $(document).ready(function() {
        const ratingBtns = document.querySelectorAll('.btn-rating');
        const ratingInput = document.getElementById('selected-rating');
        
        ratingBtns.forEach((btn, index) => {
            btn.addEventListener('click', function(e) {
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
    </script>

</html>       
</body>

</html> 