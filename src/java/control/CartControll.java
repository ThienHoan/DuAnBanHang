/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import entity.Cart;
import entity.CartItem;
import entity.Product;
import entity.Account;
import productDao.ProductDao;
import service.CartService;
import service.ICartService;
//import static service.UserActivityDAO.saveActivity;

/**
 *
 * @author Pc
 */
@WebServlet(name="CartControll", urlPatterns={"/cart"})
public class CartControll extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDao productDAO = new ProductDao();
    private ICartService cartService = new CartService();
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet CartServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        viewCart(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            String action = request.getParameter("action");

            if (action == null) {
                response.sendRedirect("cart?action=view");
                return;
            }

            switch (action) {
                case "add":
                    addToCart(request, response);
                    break;
                case "remove":
                    removeFromCart(request, response);
                    break;
                case "clear":
                    clearCart(request, response);
                    break;
                case "applyDiscount":
                    applyDiscount(request, response);
                    break;
                case"update":
                    updateCart(request, response);
                    break;
                    
                default:
                    
                    response.sendRedirect("cart?action=view");
                    break;
            }
        }


    private void addToCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId=request.getParameter("id");
        int quantity = parseIntParameter(request, "quantity", 1);

        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");
        Product product = productDAO.getProductByID(productId);
        if (product != null) {
            Cart cart = getOrCreateCart(request);
            cartService.addToCart(cart, product, quantity);
// dòng này là lưu lịch sử            saveActivity(user.getId(), productId, "ADD_TO_CART", user.getUsername() + " đã thêm sản phẩm vào giỏ hàng");
        }

    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String productId = request.getParameter("id"); // Lấy ID dưới dạng String
    try {
        if (productId != null) {
            Cart cart = getOrCreateCart(request);
            // Debug log
            System.out.println("Removing product ID: " + productId);
            cartService.removeCartItem(cart, Integer.parseInt(productId));
            // Cập nhật lại cart trong session
            request.getSession().setAttribute("cart", cart);
        }
    } catch (NumberFormatException e) {
        System.out.println("Error parsing product ID: " + e.getMessage());
    }
    response.sendRedirect("cart?action=view");
}
    private void updateCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = parseIntParameter(request, "id");
        int quantity = parseIntParameter(request, "quantity", 1);

        
        if (productId != -1) {
            Cart cart = getOrCreateCart(request);
            cartService.updateCartItem(cart, productId, quantity);
            request.getSession().setAttribute("cart", cart);
        }
        
        response.sendRedirect("cart?action=view");
    }

    private void clearCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("cart"); 
        response.sendRedirect("cart?action=view");
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        
        System.out.println("Viewing cart with " + cart.getItems().size() + " items"); // Debug log
        
        request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
    }

    private Cart getOrCreateCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }
    
    private void applyDiscount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            String discountCode = request.getParameter("discountCode");
            cart.applyDiscount(discountCode);
            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart?action=view");
    }

    private int parseIntParameter(HttpServletRequest request, String paramName) {
        return parseIntParameter(request, paramName, -1);
    }

    private int parseIntParameter(HttpServletRequest request, String paramName, int defaultValue) {
        try {
            return Integer.parseInt(request.getParameter(paramName));
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}
