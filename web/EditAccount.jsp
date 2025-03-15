<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Account</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="accountForm" action="managerAccount" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Account</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${account.userID}" name="userID" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Username</label>
                                    <input value="${account.userName}" name="userName" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input placeholder="Leave blank to keep current password" name="password" type="password" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${account.email}" name="email" type="email" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Phone Number</label>
                                    <input value="${account.phoneNumber}" name="phoneNumber" type="text" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input value="${account.address}" name="address" type="text" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Role</label>
                                    <select name="roleID" class="form-control">
                                        <option value="1" ${account.roleID == 1 ? "selected" : ""}>User</option>
                                        <option value="2" ${account.roleID == 2 ? "selected" : ""}>Seller</option>
                                        <option value="3" ${account.roleID == 3 ? "selected" : ""}>Admin</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <select name="status" class="form-control">
                                        <option value="0" ${account.status == 0 ? "selected" : ""}>Inactive</option>
                                        <option value="1" ${account.status == 1 ? "selected" : ""}>Active</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="managerAccount" class="btn btn-default">Cancel</a>
                                <input type="submit" id="saveBtn" class="btn btn-success" value="Save">
                                <div id="saveMessage" class="alert alert-success" style="display:none; margin-top:10px;">
                                    Changes saved successfully!
                                </div>
                            </div>
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="page" value="1"> <!-- Add page parameter -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
        
        <script>
            $(document).ready(function() {
                $('#accountForm').on('submit', function(e) {
                    e.preventDefault(); // Prevent default form submission
                    
                    // Get form data
                    var formData = $(this).serialize();
                    
                    // Send AJAX request
                    $.ajax({
                        type: "POST",
                        url: "managerAccount",
                        data: formData,
                        success: function(response) {
                            // Show success message
                            $('#saveMessage').fadeIn();
                            
                            // Hide after 3 seconds
                            setTimeout(function() {
                                $('#saveMessage').fadeOut();
                            }, 3000);
                        },
                        error: function(xhr, status, error) {
                            alert("An error occurred: " + error);
                        }
                    });
                    
                    return false;
                });
            });
        </script>
    </body>
</html>