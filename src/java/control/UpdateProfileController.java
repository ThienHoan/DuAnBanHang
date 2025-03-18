package control;

import dao.DAO;
import entity.Account;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "UpdateProfileController", urlPatterns = {"/updateProfile"})
public class UpdateProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        
        if (account == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        
        // Get parameters from form
        int id = Integer.parseInt(request.getParameter("id"));
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        
        DAO dao = new DAO();
        
        // Validate email uniqueness - using existing method with additional logic
        if (email != null && !email.isEmpty() && !email.equals(account.getEmail())) {
            if (dao.checkAccountExists(email)) {
                request.setAttribute("message", "Email address is already being used by another account. Please use a different email.");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                return;
            }
        }
        
        // Validate phone number uniqueness - using existing method with additional logic
        if (phone != null && !phone.isEmpty() && !phone.equals(account.getPhone())) {
            if (dao.checkPhoneNumberExists(phone)) {
                request.setAttribute("message", "Phone number is already being used by another account. Please use a different phone number.");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                return;
            }
        }
        
        // Handle password change separately
        if (newPassword != null && !newPassword.isEmpty()) {
            // Validate password change
            boolean passwordChangeSuccessful = handlePasswordChange(request, response, account, dao, id, currentPassword, newPassword);
            if (!passwordChangeSuccessful) {
                // If password change failed, the error message has already been set and forwarded
                return;
            }
        }
        
        // Update other account information
        dao.updateAccountInfo(id, fullname, email, phone, address);
        
        // Refresh account info in session
        Account updatedAccount = dao.getAccountById(id);
        session.setAttribute("acc", updatedAccount);
        
        request.setAttribute("message", "Profile updated successfully");
        request.setAttribute("messageType", "success");
        request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
    }
    
    /**
     * Handle password change functionality for plaintext passwords
     * @return true if password change was successful, false otherwise
     */
    private boolean handlePasswordChange(HttpServletRequest request, HttpServletResponse response, 
                                        Account account, DAO dao, int userId,
                                        String currentPassword, String newPassword) 
                                        throws ServletException, IOException {
        
        // Validate new password
        if (newPassword.length() < 6) {
            request.setAttribute("message", "New password must be at least 6 characters long");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
            return false;
        }
        
        // For plaintext passwords, simply compare with stored password
        String storedPassword = account.getPass();
        System.out.println("Entered password: [" + currentPassword + "]");
        System.out.println("Stored password: [" + storedPassword + "]");
        
        // Direct comparison of plaintext passwords
        if (!currentPassword.equals(storedPassword)) {
            // Double check with database if session data might be outdated
            Account freshAccount = dao.getAccountById(account.getId());
            if (freshAccount != null && currentPassword.equals(freshAccount.getPass())) {
                // Password is correct based on fresh data
                System.out.println("Password correct based on fresh data from database");
            } else {
                request.setAttribute("message", "Current password is incorrect");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
                return false;
            }
        }
        
        // Update the password (no hashing needed)
        dao.updateAccountPassword(userId, newPassword);
        
        System.out.println("Password updated successfully for user ID: " + userId);
        return true;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("userprofile");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}