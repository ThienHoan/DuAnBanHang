package control;

import dao.OrderDAO;
import entity.Account;
import entity.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "OrderConfirmControl", urlPatterns = {"/confirm-order"})
public class OrderConfirmControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        
        if (account == null) {
            response.sendRedirect("login");
            return;
        }
        
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.getOrderById(orderId);
        
        // Kiểm tra đơn hàng có tồn tại và thuộc về người dùng hiện tại không
        if (order != null && order.getUserId() == account.getUserID()) {
            // Cập nhật trạng thái đơn hàng thành "delivered"
            boolean success = orderDAO.updateOrderStatus(orderId, "delivered");
            
            if (success) {
                request.setAttribute("message", "Đơn hàng đã được xác nhận thành công!");
            } else {
                request.setAttribute("message", "Xác nhận đơn hàng thất bại. Vui lòng thử lại!");
            }
        } else {
            request.setAttribute("message", "Không tìm thấy đơn hàng hoặc bạn không có quyền xác nhận đơn hàng này!");
        }
        
        // Chuyển về trang quản lý đơn hàng
        response.sendRedirect("orders");
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
        return "Order Confirmation Servlet";
    }
}