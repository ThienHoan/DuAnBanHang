/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import productDao.ProductDao;

/**
 *
 * @author hoan6
 */
@WebServlet(name = "CategoryControl", urlPatterns = {"/category"})
public class CategoryControl extends HttpServlet {

    DAO dao = new DAO();
    ProductDao pdao = new ProductDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy category ID
        String cateID = request.getParameter("cid");
        request.setAttribute("cid", cateID);

        List<Product> list = dao.getAllProduct();
        request.setAttribute("listP", list);

        List<Product> listP = dao.getProductByCID(cateID);
        request.setAttribute("listPP", listP);

        List<Category> listC = dao.getAllCategory();
        request.setAttribute("listCC", listC);

        // Tìm categoryName từ listC thay vì truyền qua URL
        String categoryName = "Tất cả sản phẩm";
        if (cateID != null && !cateID.isEmpty()) {
            for (Category c : listC) {
                if (String.valueOf(c.getCid()).equals(cateID)) {
                    categoryName = c.getCname();
                    break;
                }
            }
        }

        // Truyền tên category của sản phẩm đến JSP
        request.setAttribute("categoryName", categoryName);

        // Lấy tiêu chí lọc theo giá
        String priceRange = request.getParameter("price");
        // Nếu không có giá trị, mặc định là "all"
        if (priceRange == null || priceRange.isEmpty()) {
            priceRange = "all";
        }

        String orderBy = request.getParameter("orderby");
        if (orderBy == null || orderBy.isEmpty()) {
            orderBy = "menu_order";
        }

        // Lấy danh sách sản phẩm theo khoảng giá
        List<Product> productsByPrice = pdao.getProductsByCategoryAndPriceRangeAndOrder(cateID, priceRange, orderBy);
        request.setAttribute("productList", productsByPrice);

        request.setAttribute("selectedPrice", priceRange);
        request.setAttribute("selectedPrice", priceRange);

        List<Product> list5 = dao.getTop5NewestProducts();
        request.setAttribute("list5", list5);

        request.getRequestDispatcher("Category.jsp").forward(request, response);

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
