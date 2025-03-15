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
import java.util.List;

/**
 *
 * @author hoan6
 */
@WebServlet(name = "DetailControl", urlPatterns = {"/detail"})
public class DetailControl extends HttpServlet {

    DAO dao = new DAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String id = request.getParameter("pid");

        Product p = dao.getProductByID(id);
        request.setAttribute("detail", p);
        
        request.setAttribute("cid", p.getCateID());
        request.setAttribute("productName", p.getName());
        request.setAttribute("price", p.getPrice());
        request.setAttribute("description", p.getDescription());
        request.setAttribute("img", p.getImg());
        
        List<Product> list = dao.getAllProduct();
        request.setAttribute("listP", list);
        
        List<Product> listP = dao.getProductByCID(id);
        request.setAttribute("listPP", listP);

        List<Category> listC = dao.getAllCategory();
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
