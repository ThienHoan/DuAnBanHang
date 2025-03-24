<%--
    Document   : Manager
    Created on : Feb 15, 2025, 11:24:22 PM
    Author     : hoan6
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Công Ty Gia Truyền Hồng Đức</title>
        <link rel="shortcut icon" type="image/x-icon" href="hinh anh/Logo/cropped-Favicon-1-32x32.png" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/css/bootstrap.min.css">

        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
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
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
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
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
            table.table td img {
                width: 80px; /* Đặt chiều rộng cố định */
                height: 80px; /* Đặt chiều cao cố định */
                object-fit: cover; /* Cắt hình ảnh để lấp đầy kích thước */
                border-radius: 5px; /* Bo góc nhẹ để đẹp hơn */
            }
            .pagination {
                display: flex; /* Hiển thị các nút theo hàng ngang */
                justify-content: center; /* Căn giữa */
                margin-top: 20px;
                gap: 5px; /* Khoảng cách giữa các nút */
            }

            .pagination a {
                padding: 8px 15px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                transition: background 0.3s ease;
                font-weight: bold;
            }

            .pagination a:hover {
                background-color: #19422D;
            }

            .pagination a.active {
                background-color: #007bff;
                color: white;
            }


        </style>
        <script>

            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <form id="deleteForm" action="delete" method="post">
                        <div class="table-title">
                            <div class="row align-items-center">
                                <div class="col-sm-6">
                                    <h2>Manage <b>Product</b></h2>
                                </div>
                                <div class="col-md-6 d-flex justify-content-end gap-2">
                                    <a href="home" class="btn btn-primary">
                                        <i class="material-icons">&#xe88a;</i> Home
                                    </a>
                                    
                                    <!-- Add this new button for product access data -->
                                    <a href="manager?action=productAccessData" class="btn btn-warning">
                                        <i class="fa fa-bar-chart"></i> Product Access Statistics
                                    </a>
                                    
                                    <a href="#addProductModal" class="btn btn-success" data-toggle="modal">
                                        <i class="material-icons">&#xE147;</i> Add New Product
                                    </a>
                                    <!-- Nút mở Modal Xác nhận xóa -->
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmDeleteModal">
                                        <i class="material-icons">&#xE15C;</i> Delete
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- Thiết lập thông tin phân trang -->
                        <c:set var="pageSize" value="5"/>
                        <c:set var="currentPage" value="${param.page != null ? param.page : 1}"/>
                        <c:set var="start" value="${(currentPage - 1) * pageSize}"/>
                        <c:set var="end" value="${start + pageSize}"/>
                        <c:set var="totalProducts" value="${listS.size()}"/>
                        <c:set var="totalPages" value="${(totalProducts % pageSize == 0) ? (totalProducts / pageSize) : (totalProducts / pageSize + 1)}"/>

                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="selectAll">
                                            <label for="selectAll"></label>
                                        </span>
                                    </th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Price</th>
                                    <th>Stock</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listS}" var="o" varStatus="status">
                                    <c:if test="${status.index >= start && status.index < end}">
                                        <tr>
                                            <td>
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" class="product-checkbox" name="selectedProducts" value="${o.id}">
                                                    <label></label>
                                                </span>
                                            </td>
                                            <td>${o.id}</td>
                                            <td>${o.name}</td>
                                            <td><img src="${o.img}" alt="alt"/></td>
                                            <td><fmt:formatNumber value="${o.price}" type="currency"/></span></td>
                                            <td>
                                                <c:if test="${o.stock == 0}">
                                                    <span class="badge badge-warning">Hết hàng</span>
                                                </c:if>
                                                <c:if test="${o.stock != 0}">
                                                    ${o.stock}
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${o.status == 0}">
                                                        <span class="badge badge-danger">Không khả dụng</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-success">Khả dụng</span>
                                                    </c:otherwise>
                                                </c:choose>
                                                <a href="#editProductModal" class="edit" 
                                                   data-toggle="modal"
                                                   data-id="${o.id}" 
                                                   data-name="${o.name}" 
                                                   data-image="${o.img}" 
                                                   data-price="${o.price}"  
                                                   data-description="${o.description}"
                                                   data-stock="${o.stock}"
                                                   data-status="${o.status}"
                                                   data-category="${o.cateID}">
                                                    <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                                </a>
                                                <a href="#deleteProductModal${o.id}" class="delete" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                                </a>
                                            </td>
                                        </tr>
                                        <!-- Modal Xóa từng sản phẩm -->
                                    <div id="deleteProductModal${o.id}" class="modal fade">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form action="delete" method="post">
                                                    <div class="modal-header">						
                                                        <h4 class="modal-title">Delete Product</h4>
                                                        <button type="button" class="close" data-dismiss="modal">&times;"></button>
                                                    </div>
                                                    <div class="modal-body">					
                                                        <p>Are you sure you want to delete this product?</p>
                                                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <input type="hidden" name="pid" value="${o.id}">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <button type="submit" class="btn btn-danger">Delete</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="pagination">
                            <c:if test="${currentPage > 1}">
                                <a href="manager?page=${currentPage - 1}#product-list" class="prev">&laquo; Previous</a>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <a href="manager?page=${i}#product-list" class="page-link ${i == currentPage ? 'active' : ''}">${i}</a>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <a href="manager?page=${currentPage + 1}#product-list" class="next">Next &raquo;</a>
                            </c:if>
                        </div>
                    </form>

                    <!-- Modal Xác Nhận Xóa Nhiều Sản Phẩm -->
                    <div id="confirmDeleteModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form id="bulkDeleteForm" action="delete" method="post">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Confirm Delete</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Are you sure you want to delete the selected products?</p>
                                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>



                    <script>
                        // Khi nhấn "Select All", chọn tất cả các ô checkbox
                        document.getElementById("selectAll").addEventListener("change", function () {
                            let checkboxes = document.querySelectorAll(".product-checkbox");
                            checkboxes.forEach(chk => chk.checked = this.checked);
                        });

                        // Khi nhấn nút "Delete" tổng, cập nhật danh sách sản phẩm đã chọn vào form xóa
                        document.getElementById("bulkDeleteForm").addEventListener("submit", function (event) {
                            let selectedProducts = document.querySelectorAll(".product-checkbox:checked");
                            let form = document.getElementById("bulkDeleteForm");

                            selectedProducts.forEach(chk => {
                                let input = document.createElement("input");
                                input.type = "hidden";
                                input.name = "selectedProducts";
                                input.value = chk.value;
                                form.appendChild(input);
                            });
                        });
                        $(document).ready(function () {
                            $(".edit").click(function () {
                                var id = $(this).data("id");
                                var name = $(this).data("name");
                                var image = $(this).data("image");
                                var price = $(this).data("price");
                                var title = $(this).data("title");
                                var description = $(this).data("description");
                                var category = $(this).data("category"); // ✅ Đổi từ "cid" thành "category"

                                // Gán dữ liệu vào form trong modal
                                $("#editProductModal input[name='id']").val(id);
                                $("#editProductModal input[name='name']").val(name);
                                $("#editProductModal input[name='image']").val(image);
                                $("#editProductModal input[name='price']").val(price);
                                $("#editProductModal textarea[name='title']").val(title);
                                $("#editProductModal textarea[name='description']").val(description);
                                console.log("ID sản phẩm:", id);
                                console.log("Category được truyền:", category);
                                $("#editProductModal select[name='category']").val(category);

                                // Thay đổi action của form để gửi dữ liệu update
                                $("#editProductModal form").attr("action", "update?id=" + id);
                            });
                        });

                    </script>




                </div>
            </div>
        </div>
        <!-- Add Modal HTML -->
        <div id="addProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="number"  min="0" class="form-control no-spinners" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Stock</label>
                                <input name="stock" type="number" class="form-control" value="1" min="0" required>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select name="status" class="form-control" required>
                                    <option value="1" selected>Khả dụng</option>
                                    <option value="0">Không khả dụng</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-control" required>
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="${o.cid}" ${o.cid == 1 ? 'selected' : ''}>${o.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Edit Modal HTML -->
        <div id="editProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="update" method="post">
                        <input type="hidden" name="id"> <!-- ID ẩn -->
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="number"  min="0" class="form-control no-spinners" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Stock</label>
                                <input name="stock" type="number" class="form-control" min="0" required>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select name="status" class="form-control" required>
                                    <option value="1">Khả dụng</option>
                                    <option value="0">Không khả dụng</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--        edit-->
        <script>
            $(document).ready(function () {
                $(".edit").click(function () {
                    var id = $(this).data("id");
                    var name = $(this).data("name");
                    var image = $(this).data("image");
                    var price = $(this).data("price");
                    var description = $(this).data("description");
                    var stock = $(this).data("stock");
                    var status = $(this).data("status");
                    var category = $(this).data("category");

                    // Gán dữ liệu vào form trong modal
                    $("#editProductModal input[name='id']").val(id);
                    $("#editProductModal input[name='name']").val(name);
                    $("#editProductModal input[name='image']").val(image);
                    $("#editProductModal input[name='price']").val(price);
                    $("#editProductModal textarea[name='description']").val(description);
                    $("#editProductModal input[name='stock']").val(stock);
                    $("#editProductModal select[name='status']").val(status);
                    $("#editProductModal select[name='category']").val(category);

                    // Thay đổi action của form để gửi dữ liệu update
                    $("#editProductModal form").attr("action", "update?id=" + id);
                });
            });
        </script>


    </body>
</html>
