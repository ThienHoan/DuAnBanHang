<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Danh sách yêu thích</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 10px;
            font-size: 28px;
            font-weight: 600;
        }
        .success {
            color: #28a745;
            text-align: center;
            margin-bottom: 15px;
            font-size: 16px;
            animation: fadeOut 3s forwards; /* Làm mờ dần sau 3 giây */
        }
        @keyframes fadeOut {
            0% { opacity: 1; }
            100% { opacity: 0; display: none; }
        }
        .error {
            color: #dc3545;
            text-align: center;
            margin-bottom: 15px;
            font-size: 16px;
        }
        .home-btn {
            display: block;
            width: fit-content;
            margin: 0 auto 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .home-btn:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 14px;
        }
        td {
            color: #555;
            font-size: 14px;
        }
        img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
        }
        .action-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 14px;
        }
        .action-btn:hover {
            background-color: #c82333;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .empty-message {
            text-align: center;
            color: #777;
            padding: 20px;
            font-style: italic;
        }
        .product-link {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s;
        }
        .product-link:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    
    <h2>Danh sách yêu thích của bạn</h2>

    <!-- Nút Trở về trang chủ -->
    <a href="home" class="home-btn">Trở về trang chủ</a>

    <!-- Hiển thị thông báo lỗi hoặc thành công -->
    <c:if test="${param.error != null}">
        <p class="error">${param.error}</p>
    </c:if>
    <c:if test="${param.success != null}">
        <p class="success">${param.success}</p>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Hình ảnh</th>
                <th>Ngày thêm</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty wishlist}">
                    <c:forEach var="item" items="${wishlist}">
                        <tr>
                            <td>
                                <a href="detail?pid=${item.productID}" class="product-link">${item.name}</a>
                            </td>
                            <td><img src="${pageContext.request.contextPath}/${item.img}" alt="${item.name}"></td>
                            <td>${item.addedDate}</td>
                            <td>
                                <form action="wishlist" method="post" style="margin: 0;">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="wishlistID" value="${item.wishlistID}">
                                    <input type="hidden" name="userID" value="${userID}">
                                    <button type="submit" class="action-btn">Xóa</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4" class="empty-message">Danh sách yêu thích của bạn đang trống.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</body>
</html>
