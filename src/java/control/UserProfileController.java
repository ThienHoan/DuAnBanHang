package control;

import dao.DAO;
import entity.Account;
import entity.Category;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "UserProfileController", urlPatterns = {"/userprofile"})
public class UserProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        
        // If user is logged in, refresh their account data from the database
        if (account != null) {
            System.out.println("User in session: " + account.getUser());
            
            // Refresh account data from database to ensure we have the latest info
            DAO dao = new DAO();
            List<Category> listC = dao.getAllCategory();
        request.setAttribute("listCC", listC);
            Account refreshedAccount = dao.getAccountById(account.getId());
            if (refreshedAccount != null) {
                session.setAttribute("acc", refreshedAccount);
                account = refreshedAccount;
            }
        } else {
            System.out.println("No user in session");
            response.sendRedirect("Login.jsp");
            return;
        }
        
        request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}