package control;

import dao.OrderDAO;
import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UpdateOrderStatusControl", urlPatterns = {"/update-order-status"})
public class UpdateOrderStatusControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        int role=account.getRoleID();
        // Kiểm tra đăng nhập và quyền
        if (account == null || (role != 3 && role != 2)) {
            response.sendRedirect("login");
            return;
        }
        
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String newStatus = request.getParameter("status");
        
        // Kiểm tra trạng thái hợp lệ
        if (!"pending".equals(newStatus) && !"shipping".equals(newStatus) && !"delivered".equals(newStatus)) {
            request.setAttribute("error", "Trạng thái đơn hàng không hợp lệ!");
            response.sendRedirect("orders");
            return;
        }
        
        OrderDAO orderDAO = new OrderDAO();
        boolean success = orderDAO.updateOrderStatus(orderId, newStatus);
        
        if (success) {
            request.setAttribute("message", "Cập nhật trạng thái đơn hàng thành công!");
        } else {
            request.setAttribute("error", "Cập nhật trạng thái đơn hàng thất bại!");
        }
        
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
        return "Update Order Status Servlet";
    }
}