package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import entity.Account;
import entity.Cart;
import service.VNPayService;
import dao.OrderDAO;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/vnpay_payment")
public class VNPayServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(CheckoutServlet.class.getName());
    private VNPayService vnpayService;
    private OrderDAO orderDao;
    @Override
    public void init() throws ServletException {
        vnpayService = new VNPayService();
        orderDao=new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            LOGGER.warning("User not logged in for checkout.");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Chuyển hướng đến trang checkout mặc định
        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            LOGGER.warning("User not logged in for checkout.");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Account user = (Account) session.getAttribute("account");

        


        
            try {
                Cart cart=(Cart) session.getAttribute("cart");
                String totalAmountStr = String.valueOf(cart.getTotalAmount());
                String paymentUrl = vnpayService.createPaymentUrl(request, orderDao.getnewOrderId(),totalAmountStr);
                if (paymentUrl == null || paymentUrl.trim().isEmpty()) {
                    LOGGER.severe("Failed to create VNPay payment URL.");
                    throw new IllegalStateException("Không thể tạo URL thanh toán VNPay.");
                }
                response.sendRedirect(paymentUrl);
            } catch (IllegalStateException e) {
                LOGGER.severe("Checkout error: " + e.getMessage());
                request.setAttribute("errorMessage", e.getMessage());
                request.getRequestDispatcher("Checkout.jsp").forward(request, response);
            } catch (Exception e) {
                LOGGER.severe("Unexpected error during VNPay checkout: " + e.getMessage());
                request.setAttribute("errorMessage", "Đã xảy ra lỗi khi xử lý thanh toán VNPay.");
                request.getRequestDispatcher("Checkout.jsp").forward(request, response);
            }

    }
}