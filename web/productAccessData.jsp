<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Công Ty Gia Truyền Hồng Đức</title>
    <link rel="shortcut icon" type="image/x-icon" href="hinh anh/Logo/cropped-Favicon-1-32x32.png" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
            padding-top: 20px;
        }
        .table-responsive {
            margin: 30px 0;
        }
        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            min-width: 1000px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            min-width: 100%;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }
        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }
        .table-title .btn-group {
            float: right;
        }
        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }
        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }
        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }
        table.table tr th:first-child {
            width: 60px;
        }
        table.table tr th:last-child {
            width: 100px;
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }
        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }
        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }
        .pagination {
            float: right;
            margin: 0 0 5px;
        }
        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }
        .pagination li a:hover {
            color: #666;
        }
        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }
        .pagination li.active a:hover {
            background: #0397d6;
        }
        .pagination li.disabled i {
            color: #ccc;
        }
        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }
        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }
        
        /* Product specific styles */
        .rank-badge {
            display: inline-block;
            width: 30px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            border-radius: 50%;
            font-weight: bold;
            color: white;
        }
        .rank-1 { background-color: #FFD700; } /* Gold */
        .rank-2 { background-color: #C0C0C0; } /* Silver */
        .rank-3 { background-color: #CD7F32; } /* Bronze */
        .other-rank { background-color: #6c757d; } /* Gray for other ranks */
        
        .product-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
        }
        
        .card {
            border: none;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        
        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #eee;
        }
        
        .alert {
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <div class="container-xl">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Product <b>Access Statistics</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="manager" class="btn btn-primary">
                                <i class="material-icons">&#xe88a;</i> <span>Back to Manager</span>
                            </a>
                        </div>
                    </div>
                </div>

                <%-- Retrieve the most clicked products using the ProductClick table --%>
                <jsp:useBean id="dao" class="dao.DAO"></jsp:useBean>
                
                <% 
                    try {
                        // Initialize product clicks
                        dao.initializeProductClicks();
                        
                        // Get the products sorted by clicks for display
                        java.util.List products = dao.getProductsSortedByClicksWithPaging(1, 10);
                        pageContext.setAttribute("mostClickedProducts", products);
                        
                    } catch(Exception e) {
                        pageContext.setAttribute("dbError", e.getMessage());
                    }
                %>
                
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Rank</th>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Clicks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${mostClickedProducts}" var="p" varStatus="loop">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${loop.index == 0}">
                                            <span class="rank-badge rank-1">1</span>
                                        </c:when>
                                        <c:when test="${loop.index == 1}">
                                            <span class="rank-badge rank-2">2</span>
                                        </c:when>
                                        <c:when test="${loop.index == 2}">
                                            <span class="rank-badge rank-3">3</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="rank-badge other-rank">${loop.index + 1}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <img src="${p.img}" alt="${p.name}" class="product-img">
                                </td>
                                <td>${p.name}</td>
                                <td><fmt:formatNumber value="${p.price}" type="currency"/></td>
                                <td>
                                    <span class="badge badge-info">${p.clickCount}</span>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty mostClickedProducts}">
                            <tr>
                                <td colspan="5" class="text-center py-4">
                                    <div class="alert alert-info mb-0">
                                        <i class="fa fa-info-circle mr-2"></i>
                                        No product click data available yet. Product views will be recorded when users visit product pages.
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
                
                <div class="card mt-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Analytics Information</h5>
                    </div>
                    <div class="card-body">
                        <p>
                            This page displays products ordered by the number of times they have been viewed by users.
                            The data is collected through the ProductClick tracking system which monitors user interactions with products.
                        </p>
                        <p class="mb-0">
                            <i class="fa fa-lightbulb-o text-warning"></i> <strong>Tip:</strong>
                            Products with high click counts but low sales might need price adjustments or improved descriptions.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>