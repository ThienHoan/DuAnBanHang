package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.VNPayService;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

@WebServlet("/vnpay-return")
public class VNPayReturnServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(VNPayReturnServlet.class.getName());
    private VNPayService vnpayService;

    @Override
    public void init() throws ServletException {
        vnpayService = new VNPayService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            LOGGER.warning("User not logged in during VNPay return.");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Xác thực phản hồi từ VNPay
            if (vnpayService.validateResponse(request)) {
                String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
                String vnp_TxnRef = request.getParameter("vnp_TxnRef");
                int orderId = Integer.parseInt(vnp_TxnRef);

                LOGGER.info("VNPay response for order #" + orderId + ": ResponseCode=" + vnp_ResponseCode);

                if ("00".equals(vnp_ResponseCode)) {
                    // Thanh toán thành công
                    LOGGER.info("Payment successful for order #" + orderId);
                    session.setAttribute("wasPaid","true");
                    response.sendRedirect("checkout");
                } else {
                    // Thanh toán thất bại
                    LOGGER.warning("Payment failed for order #" + orderId + ". ResponseCode: " + vnp_ResponseCode);
                    request.setAttribute("errorMessage", "Thanh toán thất bại: Mã lỗi " + vnp_ResponseCode);
                    request.getRequestDispatcher("Checkout.jsp").forward(request, response);
                }
            } else {
                // Xác thực thất bại
                LOGGER.warning("VNPay response validation failed.");
                request.setAttribute("errorMessage", "Xác thực thanh toán không thành công.");
                request.getRequestDispatcher("Checkout.jsp").forward(request, response);
            }
        } catch (UnsupportedEncodingException e) {
            LOGGER.severe("Encoding error during VNPay response validation: " + e.getMessage());
            request.setAttribute("errorMessage", "Lỗi mã hóa khi xác thực phản hồi từ VNPay: " + e.getMessage());
            request.getRequestDispatcher("404Loi.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            LOGGER.severe("Invalid order ID format in vnp_TxnRef: " + e.getMessage());
            request.setAttribute("errorMessage", "Lỗi định dạng mã đơn hàng: " + e.getMessage());
            request.getRequestDispatcher("404Loi.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.severe("Unexpected error during VNPay return processing: " + e.getMessage());
            request.setAttribute("errorMessage", "Lỗi xử lý phản hồi từ VNPay: " + e.getMessage());
            request.getRequestDispatcher("404Loi.jsp").forward(request, response);
        }
    }
}