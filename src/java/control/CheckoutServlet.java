package control;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;
import entity.Cart;
import entity.CartItem;
import entity.Category;
import entity.Order;
import entity.Product;
import entity.Account;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import dao.DAO;
import dao.OrderDAO;
import productDao.ProductDao;
import service.CartService;
import service.EmailService;
//import static service.UserActivityDAO.saveActivity;
//import userDAO.UserDAO;

/**
 *
 * @author Pc
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();
    private ProductDao pdao = new ProductDao();
    private DAO dao = new DAO();
    //   private UserDAO userDao = new UserDAO();

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
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        List<Category> listC = pdao.getAllCategory();
        request.setAttribute("listCC", listC);

        Account user = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            response.getWriter().write("{\"status\": \"error3\", \"message\": \"Giỏ hàng của bạn đang trống!\"}");
            return;
        }

        CartService cartService = new CartService();
        double totalPrice = cartService.calculateTotalWithDiscount(cart);

        //Order order = new Order(0, user.getUserID(), totalPrice, "Pending");
        Order order = new Order(0, user.getUserID(), "", totalPrice, "pending");
        int orderId = -1;

        try {
            orderId = orderDAO.createOrder(order);
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (orderId > -1) {

            for (CartItem item : cart.getItems()) {
                Product product = item.getProduct();

                try {
                    // orderDAO.addOrderDetail(orderId, item.getProduct().getId(), item.getQuantity(), discountedPrice);
                    orderDAO.addOrderDetail(orderId, item.getProduct().getId(), item.getQuantity(), item.getProduct().getPrice());
                } catch (SQLException ex) {
                    response.getWriter().write("{\"status\": \"error\", \"message\": \"add order bị lỗi\"}");
                }
            }

            //
            String userEmail = user.getEmail();
            String subject = "Xác nhận đặt hàng thành công";
            String content = "Chào " + user.getUserName() + ",\n\n"
                    + "Cảm ơn bạn đã đặt hàng tại Công Ty Gia Truyền Hồng Đức\n"
                    + "Mã đơn hàng của bạn: " + orderId + "\n"
                    + "Tổng tiền: " + totalPrice + " VNĐ\n\n"
                    + "Chúng tôi sẽ xử lý đơn hàng của bạn sớm nhất.\n\n"
                    + "Trân trọng,\nHồng Đức Team";

            EmailService.sendEmail(userEmail, subject, content);
            //cập nhập stock---------------------------------------------------------------

            for (CartItem item : cart.getItems()) {
                int productId = item.getProduct().getId(); // Lấy ID sản phẩm
                int currentStock = item.getProduct().getStock(); // Số lượng hiện tại trong kho
                int quantityInCart = item.getQuantity(); // Số lượng trong giỏ hàng
                int newStock = currentStock - quantityInCart; // Tính số lượng mới

                // Gọi hàm updateStock từ ProductDAO
                pdao.updateStock(productId, newStock);

            }
            //------------------------------------------------------------------------------

            //từ vnpay qua-----------------------------------------------------------------
            String wasPaid = (String) session.getAttribute("wasPaid");
            if (wasPaid != null && wasPaid.equals("true")) {
                cart.clear();
                session.removeAttribute("wasPaid");

                // Thêm script để hiển thị thông báo
                String script = "<script>"
                        + "window.onload = function() {"
                        + "    showNotification('success', 'Thanh toán thành công', 'Đơn hàng của bạn đã được xác nhận thành công!');"
                        + "}"
                        + "</script>";

                request.setAttribute("notificationScript", script);
                request.getRequestDispatcher("Checkout.jsp").forward(request, response);
                return;
            }
            //------------------------------------------------------------------
            cart.clear();
            session.removeAttribute("cart");
            response.getWriter().write("{\"status\": \"success\", \"message\": \"Đã gửi xác nhận đơn hàng tới email của bạn!\"}");

        } else {
            // Thong bao loi neu tao don hang that bai
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Tạo đơn hàng thất bại. Vui lòng thử lại sau!\"}");

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

}
