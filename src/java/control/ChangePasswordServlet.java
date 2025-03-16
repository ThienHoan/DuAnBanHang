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

@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/changePassword"})
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Show the change password page
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        
        if (account == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
        int id = account.getId();  // Make sure getId() returns userID
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // For debug purposes, print account details
        System.out.println("Account in session: ID=" + account.getId() + 
                         ", Username=" + account.getUser() + 
                         ", StoredPass=" + account.getPass());
        
        // Validate inputs
        if (currentPassword == null || newPassword == null || confirmPassword == null ||
            currentPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
            request.setAttribute("message", "Please fill in all password fields");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }
        
        // Check if new password and confirmation match
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("message", "New password and confirmation do not match");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }
        
        // Validate password strength (basic validation)
        if (newPassword.length() < 6) {
            request.setAttribute("message", "New password must be at least 6 characters long");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }
        
        DAO dao = new DAO();

        // Use our debug method to see exactly what's happening
        boolean passwordMatch = dao.debugPasswordCheck(id, currentPassword);
        System.out.println("Debug method password match result: " + passwordMatch);

        if (!passwordMatch) {
            request.setAttribute("message", "Current password is incorrect");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        // If we get here, password matched
        // Update the password - no hashing needed for plaintext storage
        dao.updateAccountPassword(id, newPassword);
        
        // Refresh account info in session
        Account updatedAccount = dao.getAccountById(id);
        if (updatedAccount != null) {
            session.setAttribute("acc", updatedAccount);
        }
        
        // Success message
        request.setAttribute("message", "Password changed successfully");
        request.setAttribute("messageType", "success");
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
    }
}
