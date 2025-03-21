package control;

import dao.WishlistDAO;
import entity.Wishlist;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {
    private WishlistDAO wishlistDAO;

    public void init() {
        wishlistDAO = new WishlistDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer sessionUserID = (Integer) request.getSession().getAttribute("userID");
        if (sessionUserID == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String userIDParam = request.getParameter("userID");
        if (userIDParam == null || userIDParam.trim().isEmpty()) {
            userIDParam = sessionUserID.toString();
        }

        int userID;
        try {
            userID = Integer.parseInt(userIDParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("Login.jsp");
            return;
        }

        List<Wishlist> wishlist = wishlistDAO.getWishlistByUser(userID);
        if (wishlist == null) {
            wishlist = new ArrayList<>();
        }

        int wishlistCount = wishlist.size();
        request.getSession().setAttribute("wishlistCount", wishlistCount);

        request.setAttribute("wishlist", wishlist);
        request.setAttribute("userID", userID);
        request.getRequestDispatcher("/wishlist.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer sessionUserID = (Integer) request.getSession().getAttribute("userID");
        if (sessionUserID == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String userIDParam = request.getParameter("userID");
        if (userIDParam == null || userIDParam.trim().isEmpty()) {
            userIDParam = sessionUserID.toString();
        }

        int userID;
        try {
            userID = Integer.parseInt(userIDParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String action = request.getParameter("action");
        String returnUrl = request.getParameter("returnUrl");
        if (returnUrl == null || returnUrl.trim().isEmpty()) {
            returnUrl = "home";
        }

        switch (action != null ? action : "") {
            case "add":
                String productIDParam = request.getParameter("productID");
                if (productIDParam == null || productIDParam.trim().isEmpty()) {
                    response.sendRedirect(returnUrl);
                    return;
                }
                try {
                    int productID = Integer.parseInt(productIDParam);
                    wishlistDAO.addToWishlist(userID, productID);
                    // Cập nhật wishlistCount trước khi redirect
                    List<Wishlist> updatedWishlistAdd = wishlistDAO.getWishlistByUser(userID);
                    int updatedCountAdd = (updatedWishlistAdd != null) ? updatedWishlistAdd.size() : 0;
                    request.getSession().setAttribute("wishlistCount", updatedCountAdd);
                    // Thêm thông báo thành công vào URL
                    response.sendRedirect(returnUrl + "&success=AddedToWishlist");
                } catch (NumberFormatException e) {
                    response.sendRedirect(returnUrl );
                }
                return; // Thoát ngay sau khi redirect

            case "remove":
                String wishlistIDParam = request.getParameter("wishlistID");
                if (wishlistIDParam == null || wishlistIDParam.trim().isEmpty()) {
                    response.sendRedirect("wishlist?userID=" + userID + "&error=WishlistIDRequired");
                    return;
                }
                try {
                    int wishlistID = Integer.parseInt(wishlistIDParam);
                    wishlistDAO.removeFromWishlist(wishlistID);
                    // Cập nhật wishlistCount trước khi redirect
                    List<Wishlist> updatedWishlistRemove = wishlistDAO.getWishlistByUser(userID);
                    int updatedCountRemove = (updatedWishlistRemove != null) ? updatedWishlistRemove.size() : 0;
                    request.getSession().setAttribute("wishlistCount", updatedCountRemove);
                    response.sendRedirect("wishlist?userID=" + userID + "&success=Delete Completed");
                } catch (NumberFormatException e) {
                    response.sendRedirect("wishlist?userID=" + userID + "&error=InvalidWishlistID");
                }
                return; // Thoát ngay sau khi redirect

            default:
                response.sendRedirect(returnUrl + "&error=InvalidAction");
                return;
        }
    }
}