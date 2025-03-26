/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import dao.ReviewDAO;
import entity.Category;
import entity.Product;
import entity.ProductReview;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import productDao.ProductDao;

/**
 *
 * @author hoan6
 */
@WebServlet(name = "DetailControl", urlPatterns = {"/detail"})
public class DetailControl extends HttpServlet {

    DAO dao = new DAO();
    ProductDao pdao=new ProductDao();
    ReviewDAO reviewDAO = new ReviewDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String id = request.getParameter("pid");
        int productId = Integer.parseInt(id);

        Product p = pdao.getProductByID(id);
        request.setAttribute("detail", p);
        
        request.setAttribute("cid", p.getCateID());
        request.setAttribute("productName", p.getName());
        request.setAttribute("price", p.getPrice());
        request.setAttribute("description", p.getDescription());
        request.setAttribute("img", p.getImg());
        
        // Get product reviews
        List<ProductReview> reviews = reviewDAO.getReviewsByProductId(productId);
        request.setAttribute("reviews", reviews);
        
        // Get review statistics
        double avgRating = reviewDAO.getAverageRating(productId);
        int reviewCount = reviewDAO.getReviewCount(productId);
        int[] ratingDistribution = reviewDAO.getRatingDistribution(productId);
        
        request.setAttribute("avgRating", avgRating);
        request.setAttribute("reviewCount", reviewCount);
        request.setAttribute("ratingDistribution", ratingDistribution);
        
        // Calculate width percentage for star rating display
        int widthPercentage = (int) (avgRating * 20); // 20% per star (5 stars = 100%)
        request.setAttribute("ratingWidth", widthPercentage);
        
        List<Product> list = pdao.getAllProduct();
        request.setAttribute("listP", list);
        
        List<Product> listP = pdao.getProductByCID(String.valueOf(p.getCateID()));
        request.setAttribute("listPP", listP);

        List<Category> listC = pdao.getAllCategory();
        request.setAttribute("listCC", listC);

        // Tìm category của sản phẩm hiện tại
        String categoryName = "";
        for (Category c : listC) {
            if (c.getCid() == p.getCateID()) {  // Giả sử `getCategoryID()` lấy ID danh mục của sản phẩm
                categoryName = c.getCname();
                break;
            }
        }
        
        // Truyền tên category của sản phẩm đến JSP
        request.setAttribute("categoryName", categoryName);
        
        List<Product> list5 = pdao.getTop5NewestProducts();
        request.setAttribute("list5", list5);

        request.getRequestDispatcher("Detail.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
