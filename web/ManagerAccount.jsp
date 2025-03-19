<%-- 
    Document   : Manager
    Created on : Feb 15, 2025, 11:24:22 PM
    Author     : hoan6
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Add redirect check - if accessed directly without data, redirect to the servlet
    if (request.getAttribute("listAccounts") == null) {
        response.sendRedirect("managerAccount?page=1");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Account Management</title>
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
</style>
<script>
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
	
	// Fix the edit functionality
	$(document).on('click', '.edit', function(){
		var row = $(this).closest('tr');
		var id = $(this).data('id');
		var username = row.find('td:eq(2)').text();
		var email = row.find('td:eq(3)').text();
		var phone = row.find('td:eq(4)').text();
		var address = row.find('td:eq(5)').text();
		var roleText = row.find('td:eq(6)').text().trim();
		var statusText = row.find('td:eq(7)').text().trim();
		
		// Set roleID based on text
		var roleID = 1; // Default to User
		if (roleText === "Seller") roleID = 2;
		if (roleText === "Admin") roleID = 3;
		
		// Set status based on text
		var status = statusText === "Active" ? 1 : 0;
		
		// Populate form
		$('#editUserID').val(id);
		$('#editUsername').val(username);
		$('#editEmail').val(email);
		$('#editPhoneNumber').val(phone);
		$('#editAddress').val(address);
		$('#editRoleID').val(roleID);
		$('#editStatus').val(status);
        
        // Clear password field for security reasons
        $('#editPassword').val('');
	});
	
	// Pass data to delete modal for single delete
	$(document).on('click', '.delete', function(){
        var id = $(this).data('id');
        $('#deleteUserID').val(id);
        $('#bulkDeleteIds').val(''); // Clear bulk IDs
        $('#deleteModalTitle').text('Deactivate Account');
        $('#deleteModalMessage').text('Are you sure you want to deactivate this account?');
        console.log("Delete ID: " + id);
    });
    
    // Handle the delete selected button
    $('a[href="#deleteAccountModal"].btn-danger').click(function(e){
        var selectedIds = [];
        $('table tbody input[type="checkbox"]:checked').each(function(){
            selectedIds.push($(this).val());
        });
        
        if(selectedIds.length === 0) {
            e.preventDefault();
            alert("Please select at least one account to deactivate");
            return;
        }
        
        $('#deleteUserID').val(''); // Clear single ID
        $('#bulkDeleteIds').val(selectedIds.join(','));
        $('#deleteModalTitle').text('Deactivate Selected Accounts');
        $('#deleteModalMessage').text('Are you sure you want to deactivate these ' + selectedIds.length + ' selected accounts?');
    });
});
</script>
<script>
    // ...existing code...
    
    // Add event listener for browser close to immediately update session count
    window.addEventListener('beforeunload', function(e) {
        // Send a synchronous request to invalidate session
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'invalidateSession', false);  // false makes it synchronous
        xhr.send();
    });
</script>
</body>
</html>
<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage <b>Accounts</b></h2>
					</div>
					<div class="col-sm-6 d-flex flex-column align-items-center">
						<!-- Hộp hiển thị số người đang truy cập -->
						<div class="d-flex align-items-center bg-primary text-white px-4 py-2 rounded mb-2 w-100 justify-content-center">
							<span>${applicationScope.activeSessions} người đang truy cập</span>
						</div>
						<!-- Nhóm nút bấm -->
						<div class="d-flex justify-content-center w-100">
							<a href="#deleteAccountModal" class="btn btn-danger me-2" data-toggle="modal">
								<i class="material-icons">&#xE15C;</i> <span>Delete</span>
							</a>
							<a href="#addAccountModal" class="btn btn-success me-2" data-toggle="modal">
								<i class="material-icons">&#xE147;</i> <span>Add New Account</span>
							</a>
							<a href="home" class="btn btn-primary">
								<i class="material-icons">&#xe88a;</i> <span>Home</span>
							</a>
						</div>
					</div>
				</div>
			</div>
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
						<th>Username</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Address</th>
						<th>Role</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listAccounts}" var="a">
						<tr>
							<td>
								<span class="custom-checkbox">
									<input type="checkbox" id="checkbox${a.userID}" name="options[]" value="${a.userID}">
									<label for="checkbox${a.userID}"></label>
								</span>
							</td>
							<td>${a.userID}</td>
							<td>${a.userName}</td>
							<td>${a.email}</td>
							<td>${a.phoneNumber}</td>
							<td>${a.address}</td>
							<td>
								<c:choose>
									<c:when test="${a.roleID == 1}">User</c:when>
									<c:when test="${a.roleID == 2}">Seller</c:when>
									<c:when test="${a.roleID == 3}">Admin</c:when>
									<c:otherwise>Unknown</c:otherwise>
								</c:choose>
							</td>
							<td>
								<span class="badge ${a.status == 1 ? 'badge-success' : 'badge-danger'}">
									${a.status == 1 ? 'Active' : 'Inactive'}
								</span>
							</td>
							<td>
								<a href="#editAccountModal" data-toggle="modal" class="edit" data-id="${a.userID}"><i class="material-icons" title="Edit">&#xE254;</i></a>
								<a href="#deleteAccountModal" class="delete" data-toggle="modal" data-id="${a.userID}"><i class="material-icons" title="Delete">&#xE872;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text">Showing <b>${listAccounts.size()}</b> out of <b>${totalAccounts}</b> entries</div>
				<ul class="pagination">
					<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
						<a href="managerAccount?page=${currentPage - 1}">Previous</a>
					</li>
					
					<c:forEach begin="1" end="${totalPages}" var="i">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a href="managerAccount?page=${i}" class="page-link">${i}</a>
						</li>
					</c:forEach>
					
					<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
						<a href="managerAccount?page=${currentPage + 1}" class="page-link">Next</a>
					</li>
				</ul>
			</div>
		</div>
	</div>        
</div>
<!-- Add Modal HTML -->
<div id="addAccountModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="managerAccount" method="post">
				<input type="hidden" name="action" value="add">
				<input type="hidden" name="page" value="${currentPage}">
				<div class="modal-header">						
					<h4 class="modal-title">Add Account</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
				    <!-- Add error message display -->
				    <c:if test="${not empty errorMessage}">
				        <div class="alert alert-danger" role="alert">
				            ${errorMessage}
				        </div>
				    </c:if>
					<div class="form-group">
						<label>Username</label>
						<input type="text" name="userName" class="form-control" value="${userName}" required>
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" name="password" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Email</label>
						<input type="email" name="email" class="form-control" value="${email}" required>
					</div>
					<div class="form-group">
						<label>Address</label>
						<input type="text" name="address" class="form-control" value="${address}">
					</div>
					<div class="form-group">
						<label>Phone Number</label>
						<input type="text" name="phoneNumber" class="form-control" value="${phoneNumber}">
					</div>
					<div class="form-group">
						<label>Role</label>
						<select name="roleID" class="form-control">
							<option value="1" ${selectedRoleID == 1 ? 'selected' : ''}>User</option>
							<option value="2" ${selectedRoleID == 2 ? 'selected' : ''}>Seller</option>
							<option value="3" ${selectedRoleID == 3 ? 'selected' : ''}>Admin</option>
						</select>
					</div>
					<div class="form-group">
						<label>Status</label>
						<select name="status" class="form-control">
							<option value="1" ${selectedStatus == 1 || empty selectedStatus ? 'selected' : ''}>Active</option>
							<option value="0" ${selectedStatus == 0 ? 'selected' : ''}>Inactive</option>
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
<div id="editAccountModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="managerAccount" method="post">
				<input type="hidden" name="userID" id="editUserID">
				<input type="hidden" name="action" value="update">
				<div class="modal-header">						
					<h4 class="modal-title">Edit Account</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Username</label>
						<input type="text" name="userName" id="editUsername" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" name="password" id="editPassword" class="form-control" placeholder="Leave blank to keep current password">
					</div>
					<div class="form-group">
						<label>Email</label>
						<input type="email" name="email" id="editEmail" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Address</label>
						<input type="text" name="address" id="editAddress" class="form-control">
					</div>
					<div class="form-group">
						<label>Phone Number</label>
						<input type="text" name="phoneNumber" id="editPhoneNumber" class="form-control">
					</div>
					<div class="form-group">
						<label>Role</label>
						<select name="roleID" id="editRoleID" class="form-control">
							<option value="1">User</option>
							<option value="2">Seller</option>
							<option value="3">Admin</option>
						</select>
					</div>
					<div class="form-group">
						<label>Status</label>
						<select name="status" id="editStatus" class="form-control">
							<option value="1">Active</option>
							<option value="0">Inactive</option>
						</select>
					</div>				
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="Save">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Delete Modal HTML -->
<div id="deleteAccountModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="managerAccount" method="post">
				<input type="hidden" name="userID" id="deleteUserID">
                <input type="hidden" name="bulkDeleteIds" id="bulkDeleteIds">
				<input type="hidden" name="action" value="delete">
                <input type="hidden" name="page" value="${currentPage}">
				<div class="modal-header">						
					<h4 class="modal-title" id="deleteModalTitle">Delete Account</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p id="deleteModalMessage">Are you sure you want to deactivate this account?</p>
					<p class="text-warning"><small>This will set the account status to inactive.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Deactivate">
				</div>
			</form>
		</div>
	</div>
</div>

<script>
    // Show the Add Account modal if there was an error
    $(document).ready(function() {
        // Fix the syntax error in the if statement
        <c:if test="${showAddModal == true}">
            $('#addAccountModal').modal('show');
        </c:if>
        
        // Show success message if exists
        <c:if test="${not empty sessionScope.successMessage}">
            // Create alert element
            var alertDiv = $('<div class="alert alert-success alert-dismissible fade show" role="alert">' + 
                              '${sessionScope.successMessage}' +
                              '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
                              '<span aria-hidden="true">&times;</span></button></div>');
            
            // Add it to the top of the table wrapper
            $('.table-wrapper').prepend(alertDiv);
            
            // Remove the session attribute
            <% session.removeAttribute("successMessage"); %>
            
            // Auto-close after 5 seconds
            setTimeout(function() {
                $('.alert').alert('close');
            }, 5000);
        </c:if>
    });
</script>
</html>
