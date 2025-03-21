<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý đơn hàng</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <style>
        .order-status-pending {
            background-color: #ffecb3;
        }
        .order-status-shipping {
            background-color: #bbdefb;
        }
        .order-status-delivered {
            background-color: #c8e6c9;
        }
    </style>
</head>
<body>
    <c:if test="${empty orders}">
    <tr><td colspan="5">Không có đơn hàng nào!</td></tr>
</c:if>

   
    
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý đơn hàng</h2>
                
                <c:if test="${not empty message}">
                    <div class="alert alert-success">${message}</div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>
                
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table mr-1"></i>
                        Danh sách đơn hàng
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Mã đơn hàng</th>
                                        <th>Ngày đặt</th>
                                        <th>Tổng tiền</th>
                                        <th>Trạng thái</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                        <c:forEach items="${orders}" var="o">
                                        <tr class="order-status-${o.status}">
                                            <td>${o.id}</td>
                                            <td>${o.orderDate}</td>
                                            <td>${o.totalPrice} đ</td>
                                            <td>
                                                <span class="badge 
                                                    ${o.status == 'pending' ? 'badge-warning' : ''}
                                                    ${o.status == 'shipping' ? 'badge-info' : ''}
                                                    ${o.status == 'delivered' ? 'badge-success' : ''}">
                                                    ${o.status == 'pending' ? 'Chờ xử lý' : ''}
                                                    ${o.status == 'shipping' ? 'Đang giao hàng' : ''}
                                                    ${o.status == 'delivered' ? 'Đã giao hàng' : ''}
                                                </span>
                                            </td>
                                            <td>
                                                <a href="order-detail?id=${o.id}" class="btn btn-sm btn-info">Chi tiết</a>
                                                
                                                <!-- Nút chỉ hiển thị cho người mua và trạng thái phải là 'shipping' -->
                                                <c:if test="${!isAdmin && !isSeller && o.status == 'shipping'}">
                                                    <form action="confirm-order" method="post" style="display: inline">
                                                        <input type="hidden" name="orderId" value="${o.id}" />
                                                        <button type="submit" class="btn btn-sm btn-success">
                                                            Xác nhận đã nhận hàng
                                                        </button>
                                                    </form>
                                                </c:if>
                                                
                                                <!-- Phần cập nhật trạng thái chỉ dành cho Admin và Seller -->
                                                <c:if test="${isAdmin || isSeller}">
                                                    <button type="button" class="btn btn-sm btn-primary" 
                                                            data-toggle="modal" data-target="#updateStatusModal${o.id}">
                                                        Cập nhật trạng thái
                                                    </button>
                                                    
                                                    <!-- Modal cập nhật trạng thái -->
                                                    <div class="modal fade" id="updateStatusModal${o.id}" tabindex="-1" role="dialog" 
                                                         aria-labelledby="updateStatusModalLabel${o.id}" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="updateStatusModalLabel${o.id}">
                                                                        Cập nhật trạng thái đơn hàng #${o.id}
                                                                    </h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form action="update-order-status" method="post">
                                                                        <input type="hidden" name="orderId" value="${o.id}" />
                                                                        <div class="form-group">
                                                                            <label for="status${o.id}">Trạng thái mới:</label>
                                                                            <select class="form-control" id="status${o.id}" name="status">
                                                                                <option value="pending" ${o.status == 'pending' ? 'selected' : ''}>
                                                                                    Chờ xử lý
                                                                                </option>
                                                                                <option value="shipping" ${o.status == 'shipping' ? 'selected' : ''}>
                                                                                    Đang giao hàng
                                                                                </option>
                                                                                <option value="delivered" ${o.status == 'delivered' ? 'selected' : ''}>
                                                                                    Đã giao hàng
                                                                                </option>
                                                                            </select>
                                                                        </div>
                                                                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
                