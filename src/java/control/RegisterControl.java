
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

@WebServlet(name = "RegisterControl", urlPatterns = {"/register"})
public class RegisterControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters from form
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("rePassword");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            
            // Validate form data
            if (userName == null || userName.isEmpty() || 
                password == null || password.isEmpty() || 
                email == null || email.isEmpty()) {
                request.setAttribute("error", "Please fill all required fields");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
                return;
            }
            
            // Check if passwords match
            if (!password.equals(rePassword)) {
                request.setAttribute("error", "Passwords do not match");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
                return;
            }
            
            // Create DAO and check if email already exists
            DAO dao = new DAO();
            if (dao.checkAccountExists(email)) {
                request.setAttribute("error", "Email is already registered");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
                return;
            }
            
            // Register the new account
            Account newAccount = new Account();
            newAccount.setUserName(userName);
            newAccount.setPassword(password);
            newAccount.setEmail(email);
            newAccount.setAddress(address != null ? address : "");
            newAccount.setPhoneNumber(phoneNumber != null ? phoneNumber : "");
            newAccount.setRoleID(1); // Default role: Customer
            newAccount.setStatus(1); // Active status
            
            boolean success = dao.registerAccount(newAccount);
            
            if (success) {
                // Registration successful, automatically log in
                Account a = dao.login(email, password);
                HttpSession session = request.getSession();
                session.setAttribute("account", a);
                response.sendRedirect("login");
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred during registration");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Register Control Servlet";
    }
}