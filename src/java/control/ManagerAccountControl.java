package control;

import dao.DAO;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "ManagerAccountControl", urlPatterns = {"/managerAccount"})
public class ManagerAccountControl extends HttpServlet {
    
    // Define recordsPerPage as class member to be accessible in all methods
    private static final int recordsPerPage = 5;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        
        // Check if user is logged in and is an admin (roleID = 3)
        if (a == null || a.getRoleID() != 3) {
            response.sendRedirect("login");
            return;
        }
        
        // Pagination parameters
        int page = 1;
        // Use the class member instead
        String pageStr = request.getParameter("page");
        if(pageStr != null) {
            page = Integer.parseInt(pageStr);
        }
        
        DAO dao = new DAO();
        int totalAccounts = dao.getTotalAccounts();
        int totalPages = (int) Math.ceil(totalAccounts * 1.0 / recordsPerPage);
        
        List<Account> listAccounts = dao.getAccountsWithPaging((page-1) * recordsPerPage, recordsPerPage);
        
        request.setAttribute("listAccounts", listAccounts);
        request.setAttribute("totalAccounts", totalAccounts);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        
        request.getRequestDispatcher("ManagerAccount.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action != null) {
            DAO dao = new DAO();
            // Get the page to return to
            String pageStr = request.getParameter("page");
            int page = 1;
            if (pageStr != null && !pageStr.isEmpty()) {
                try {
                    page = Integer.parseInt(pageStr);
                } catch (NumberFormatException e) {
                    // Default to page 1 if invalid
                }
            }
            
            if (action.equals("add")) {
                // Get form parameters for adding a new account
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String address = request.getParameter("address");
                int roleID = Integer.parseInt(request.getParameter("roleID"));
                int status = Integer.parseInt(request.getParameter("status"));
                
                // Check for duplicate information in database
                Account existingAccount = dao.getAccount(userName);
                boolean emailExists = dao.checkAccountExists(email);
                boolean phoneExists = !phoneNumber.isEmpty() ? dao.checkPhoneNumberExists(phoneNumber) : false;
                
                // Prepare error message if any duplication found
                String errorMessage = null;
                if (existingAccount != null) {
                    errorMessage = "Username already exists. Please choose a different username.";
                } else if (emailExists) {
                    errorMessage = "Email already exists. Please use a different email address.";
                } else if (phoneExists) {
                    errorMessage = "Phone number already exists. Please use a different phone number.";
                }
                
                // If there's any error, return to form with error message
                if (errorMessage != null) {
                    // Set error message
                    request.setAttribute("errorMessage", errorMessage);
                    
                    // Re-populate the form data 
                    request.setAttribute("userName", userName);
                    request.setAttribute("email", email);
                    request.setAttribute("phoneNumber", phoneNumber);
                    request.setAttribute("address", address);
                    request.setAttribute("selectedRoleID", roleID);
                    request.setAttribute("selectedStatus", status);
                    
                    // Get the accounts list again for display
                    int totalAccounts = dao.getTotalAccounts();
                    int totalPages = (int) Math.ceil(totalAccounts * 1.0 / recordsPerPage);
                    List<Account> listAccounts = dao.getAccountsWithPaging((page-1) * recordsPerPage, recordsPerPage);
                    
                    request.setAttribute("listAccounts", listAccounts);
                    request.setAttribute("totalAccounts", totalAccounts);
                    request.setAttribute("currentPage", page);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("showAddModal", true);  // Flag to show the add modal again
                    
                    // Forward back to the JSP page with error
                    request.getRequestDispatcher("ManagerAccount.jsp").forward(request, response);
                    return;
                }
                
                // If the username doesn't exist, proceed with adding the account
                boolean success = dao.addAccount(userName, password, email, phoneNumber, address, roleID, status);
                
                if (success) {
                    Account newAccount = dao.getAccount(userName);
                    if (newAccount != null) {
                        dao.updateRole(newAccount.getUserID(), roleID);
                        dao.updateAccountStatus(newAccount.getUserID(), status);
                    }
                    
                    // Add a success message
                    request.getSession().setAttribute("successMessage", "Account created successfully");
                }
                
                // Redirect back to account list
                response.sendRedirect("managerAccount?page=" + page);
                return;
            } else if (action.equals("update")) {
                // Get form parameters
                int userID = Integer.parseInt(request.getParameter("userID"));
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String address = request.getParameter("address");
                int roleID = Integer.parseInt(request.getParameter("roleID"));
                int status = Integer.parseInt(request.getParameter("status"));
                
                // Update the account
                boolean success = dao.updateAccount(userID, userName, password, email, phoneNumber, address, roleID, status);
                
                // Redirect back to account list
                response.sendRedirect("managerAccount?page=" + page);
                return;
            } else if (action.equals("delete")) {
                // Check if it's a bulk delete operation
                String bulkDeleteIds = request.getParameter("bulkDeleteIds");
                
                if (bulkDeleteIds != null && !bulkDeleteIds.isEmpty()) {
                    // Handle bulk deletion
                    String[] ids = bulkDeleteIds.split(",");
                    for (String idStr : ids) {
                        try {
                            int id = Integer.parseInt(idStr);
                            dao.updateAccountStatus(id, 0);
                        } catch (NumberFormatException e) {
                            // Skip invalid IDs
                        }
                    }
                } else {
                    // Single account deactivation
                    int userID = Integer.parseInt(request.getParameter("userID"));
                    dao.updateAccountStatus(userID, 0);
                }
                
                // Redirect back to account list
                response.sendRedirect("managerAccount?page=" + page);
                return;
            }
        }
        
        // If no action or action not recognized, just display the account list
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Account Management Servlet";
    }
}