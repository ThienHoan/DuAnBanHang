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
import productDao.ProductDao;

@WebServlet(name="SearchControl", urlPatterns={"/search"})
public class SearchControl extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String namep = request.getParameter("txt"); //giay chạy bộ
        DAO dao = new DAO();
        ProductDao pdao = new ProductDao();
        List<Product> listAll = dao.getAllProductUser();
        request.setAttribute("listPP", listAll);
        List<Product> list = dao.searchByName(namep);
        
        List<Category> listC = dao.getAllCategory();
        request.setAttribute("listCC", listC);
        List<Product> list5 = dao.getTop5NewestProducts();
        request.setAttribute("list5", list5);
        request.setAttribute("productList", list);
        
        
        
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
        List<Product> productsByPrice = pdao.getProductsByNameAndPriceRangeAndOrder(namep, priceRange, orderBy);
        request.setAttribute("productList", productsByPrice);

        request.setAttribute("selectedPrice", priceRange);
        request.setAttribute("selectedPrice", priceRange);
        request.getRequestDispatcher("Category.jsp").forward(request, response);
        
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
    }

}
