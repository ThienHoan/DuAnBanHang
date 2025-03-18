
package control;

import dao.ReviewDAO;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AddReviewControl", urlPatterns = {"/add-review"})
public class AddReviewControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        
        // Check if user is logged in
        if (account == null) {
            // Redirect to login page with return URL
            String productId = request.getParameter("productId");
            response.sendRedirect("login?returnUrl=detail?pid=" + productId);
            return;
        }
        
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String reviewText = request.getParameter("reviewText");
            int userId = account.getUserId();
            
            // Validate rating (1-5 stars)
            if (rating < 1 || rating > 5) {
                rating = 5; // Default to 5 stars if invalid
            }
            
            // Add the review
            ReviewDAO reviewDAO = new ReviewDAO();
            boolean success = reviewDAO.addReview(productId, userId, rating, reviewText);
            
            if (success) {
                // Redirect back to product detail page
                response.sendRedirect("detail?pid=" + productId + "&tab=reviews");
            } else {
                // Handle error
                request.setAttribute("errorMessage", "Failed to submit review. Please try again.");
                request.getRequestDispatcher("detail?pid=" + productId).forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("home");
        }
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

    @Override
    public String getServletInfo() {
        return "Handles adding product reviews";
    }
}