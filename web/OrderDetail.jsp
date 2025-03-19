<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết đơn hàng</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <h2>Chi tiết đơn hàng #${order.id}</h2>
                
                <div class="card mb-4">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-md-6">
                                <h5>Thông tin đơn hàng</h5>
                            </div>
                            <div class="col-md-6 text-right">
                                <span class="badge 
                                    ${order.status == 'pending' ? 'badge-warning' : ''}
                                    ${order.status == 'shipping' ? 'badge-info' : ''}
                                    ${order.status == 'delivered' ? 'badge-success' : ''}">
                                    ${order.status == 'pending' ? 'Chờ xử lý' : ''}
                                    ${order.status == 'shipping' ? 'Đang giao hàng' : ''}
                                    ${order.status == 'delivered' ? 'Đã giao hàng' : ''}
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <p><strong>Mã đơn hàng:</strong> #${order.id}</p>
                                <p><strong>Ngày đặt hàng:</strong> ${order.orderDate}</p>
                                <p><strong>Trạng thái:</strong> 
                                    ${order.status == 'pending' ? 'Chờ xử lý' : ''}
                                    ${order.status == 'shipping' ? 'Đang giao hàng' : ''}
                                    ${order.status == 'delivered' ? 'Đã giao hàng' : ''}
                                </p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Tổng tiền:</strong> ${order.totalPrice} đ</p>
                                <!-- Thông tin thanh toán nếu có -->
                            </div>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th>Đơn giá</th>
                                        <th>Số lượng</th>
                                        <th>Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${orderDetails}" var="od">
                                        <tr>
                                            <td>${od.productName}</td>
                                            <td>${od.price} đ</td>
                                            <td>${od.quantity}</td>
                                            <td>${od.subtotall} đ</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="3" class="text-right">Tổng cộng:</th>
                                        <th>${order.totalPrice} đ</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        
                        <!-- Hiển thị nút xác nhận nếu đơn hàng đang giao và người dùng là khách hàng -->
                        <c:if test="${!isAdmin && !isSeller && order.status == 'shipping'}">
                            <div class="text-center mt-4">
                                <form action="confirm-order" method="post">
                                    <input type="hidden" name="orderId" value="${order.id}" />
                                    <button type="submit" class="btn btn-success">
                                        Xác nhận đã nhận hàng
                                    </button>
                                </form>
                            </div>
                        </c:if>
                        
                        <!-- Phần cập nhật trạng thái nếu là admin hoặc seller -->
                        <c:if test="${role == 2 || role == 3}">
                            <div class="card mt-4">
                                <div class="card-header">
                                    <h5>Cập nhật trạng thái đơn hàng</h5>
                                </div>
                                <div class="card-body">
                                    <form action="update-order-status" method="post">
                                        <input type="hidden" name="orderId" value="${order.id}" />
                                        <div class="form-group">
                                            <label for="status">Trạng thái mới:</label>
                                            <select class="form-control" id="status" name="status">
                                                <option value="pending" ${order.status == 'pending' ? 'selected' : ''}>
                                                    Chờ xử lý
                                                </option>
                                                <option value="shipping" ${order.status == 'shipping' ? 'selected' : ''}>
                                                    Đang giao hàng
                                                </option>
                                                <option value="delivered" ${order.status == 'delivered' ? 'selected' : ''}>
                                                    Đã giao hàng
                                                </option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Cập nhật trạng thái</button>
                                    </form>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                
                <div class="text-center mb-4">
                    <a href="orders" class="btn btn-secondary">Quay lại danh sách đơn hàng</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>