//
//package control;
//
//import dao.DAO;
//import entity.Account;
//import java.io.IOException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet(name = "ReviewControl", urlPatterns = {"/review"})
//public class ReviewControl extends HttpServlet {
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("UTF-8");
//        
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("acc");
//        
//        // Check if user is logged in
//        if (account == null) {
//            response.sendRedirect("login"); // Redirect to login page
//            return;
//        }
//        
//        String productID = request.getParameter("pid");
//        String ratingStr = request.getParameter("rating");
//        String reviewText = request.getParameter("reviewText");
//        
//        // Validate input
//        if (productID == null || ratingStr == null || reviewText == null) {
//            response.sendRedirect("detail?pid=" + productID);
//            return;
//        }
//        
//        try {
//            int pid = Integer.parseInt(productID);
//            int rating = Integer.parseInt(ratingStr);
//            
//            // Validate rating (should be 1-5)
//            if (rating < 1 || rating > 5) {
//                request.setAttribute("errorMessage", "Rating must be between 1 and 5");
//                request.getRequestDispatcher("detail?pid=" + productID).forward(request, response);
//                return;
//            }
//            
//            DAO dao = new DAO();
//            
//            // Check if user has already reviewed this product
//            if (dao.hasUserReviewed(pid, account.getUserID())) {
//                request.setAttribute("errorMessage", "You have already reviewed this product");
//                request.getRequestDispatcher("detail?pid=" + productID).forward(request, response);
//                return;
//            }
//            
//            // Add the review
//            boolean success = dao.addReview(pid, account.getUserID(), rating, reviewText);
//            
//            if (success) {
//                request.setAttribute("successMessage", "Review submitted successfully");
//            } else {
//                request.setAttribute("errorMessage", "Failed to submit review");
//            }
//            
//            response.sendRedirect("detail?pid=" + productID);
//            
//        } catch (NumberFormatException e) {
//            response.sendRedirect("detail?pid=" + productID);
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "Handles product review submissions";
//    }
//}