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
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import productDao.ProductDao;
import service.IProductService;
import service.ProductService;

/**
 *
 * @author PC
 */
@WebServlet(name = "ManagerProduct", urlPatterns = {"/manager"})
public class ManagerProduct extends HttpServlet {

    DAO dao = new DAO();
    ProductDao pdao = new ProductDao();
    IProductService productService = new ProductService();

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagerProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        switch (action != null ? action : "") {
            case "productAccessData":
                // Lấy dữ liệu sản phẩm được xem nhiều nhất
                request.setAttribute("mostClickedProducts", dao.getMostClickedProducts(50));
                request.getRequestDispatcher("productAccessData.jsp").forward(request, response);
                break;

            case "delete":
                deleteProduct(request, response);
                break;

            case "edit":
                showEditForm(request, response);
                break;

            default:
                listProducts(request, response, account);
                break;
        }
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
        String action = request.getParameter("action");

        switch (action != null ? action : "") {
            case "add":
                addProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "deleteMultiple":
                deleteMultipleProducts(request, response);
                break;
            default:
                doGet(request, response); // Chuyển về doGet để tránh lặp code
                break;
        }

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

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        System.out.println("PID nhận được: " + pid);
        pdao.deleteProduct(pid);
        response.sendRedirect("manager");
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException {
        if (account == null) {
            // Chuyển hướng người dùng đến trang đăng nhập
            response.sendRedirect("login"); // hoặc URL trang đăng nhập của bạn
            return;
        }

        int id = account.getUserID();
        int role = account.getRoleID();
        List<Product> list;

        if (role == 2) {
            list=productService.getProductBySellID(id);
        } else {
            list = productService.getAllProducts();
        }
        List<Category> listC = productService.getAllCategories();

        request.setAttribute("listS", list);
        request.setAttribute("listCC", listC);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("pid");
        Product product = productService.getProductByID(pid);
        List<Category> categories = productService.getAllCategories();

        request.setAttribute("listS", product);
        request.setAttribute("listCC", categories);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String stock = request.getParameter("stock");
        String status = request.getParameter("status");
        String category = request.getParameter("category");

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        int sid = a.getUserID();

        productService.insertProduct(name, image, price, description, category, sid, stock, status);
        response.sendRedirect("manager");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int stock = Integer.parseInt(request.getParameter("stock"));
        int status = Integer.parseInt(request.getParameter("status"));
        int category = Integer.parseInt(request.getParameter("category"));

        productService.updateProduct(id, name, image, price, description, stock, status, category);
        response.sendRedirect("manager");
    }

    private void deleteMultipleProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] selectedProducts = request.getParameterValues("selectedProducts");
        if (selectedProducts != null) {
            for (String pid : selectedProducts) {
                pdao.deleteProduct(pid);
            }
        }
        response.sendRedirect("manager");
    }

}
