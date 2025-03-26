/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import productDao.ProductDao;

/**
 *
 * @author thienhoan
 */
//@WebServlet(name = "ManagerControl", urlPatterns = {"/manager"})
public class ManagerControl extends HttpServlet {
    DAO dao=new DAO();
    ProductDao pdao=new ProductDao();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("Request URL: " + request.getRequestURL());
        System.out.println("Query String: " + request.getQueryString());
        
        // Get the action parameter early
        String action = request.getParameter("action");
        System.out.println("Action parameter: " + action);
        
        // Check for productAccessData action first
        if ("productAccessData".equals(action)) {
            // You may need to retrieve data for the page
            DAO dao = new DAO();
            request.setAttribute("mostClickedProducts", dao.getMostClickedProducts(50));
            
            // Forward to the JSP
            request.getRequestDispatcher("productAccessData.jsp").forward(request, response);
            return;
        }
        
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if (a == null) {
            System.out.println("Account is null!");
            // Redirect to login page
            response.sendRedirect("login");
            return;
        }
        
        // Regular manager functionality
        int id = a.getUserID();
        int role = a.getRoleID();
        DAO dao = new DAO();
        List<Product> list;
        
        if(role == 2) {
            list = pdao.getProductBySellID(id);
        } else {
            list = pdao.getAllProduct();
        }
        
        List<Category> listC = pdao.getAllCategory();
        request.setAttribute("listS", list);
        request.setAttribute("listCC", listC);
        
        // No need to check action again here since we already did it at the beginning
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
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
        return "Short description";
    }// </editor-fold>

}
