package control;

import dao.DAO;
import dao.OrderDAO;
import entity.Account;
import entity.Category;
import entity.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import productDao.ProductDao;

@WebServlet(name = "OrderManagementControl", urlPatterns = {"/orders"})
public class OrderManagementControl extends HttpServlet {
    ProductDao pdao =new ProductDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        DAO dao = new DAO();
        if (account == null) {
            response.sendRedirect("login");
            return;
        }
        
        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders;
        List<Category> listC = pdao.getAllCategory();
        request.setAttribute("listCC", listC);
        int role=account.getRoleID();




        // Phân quyền xem đơn hàng theo vai trò
        if (role==3) {
            orders = orderDAO.getAllOrders(); 
            request.setAttribute("isAdmin", true);
        } else if (role==2) {
            orders = orderDAO.getOrdersBySellerId(account.getUserID());
            request.setAttribute("isSeller", true);
        } else {
            orders = orderDAO.getOrdersByUserId(account.getUserID());
        }
        
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("OrderManagement.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDAO orderDAO = new OrderDAO();
        
        if ("updateStatus".equals(action)) {
            String newStatus = request.getParameter("newStatus");
            orderDAO.updateOrderStatus(orderId, newStatus);
            
            // Redirect để tránh resubmit form khi refresh
            response.sendRedirect("orders");
        } else if ("cancelOrder".equals(action)) {
            // Xử lý hủy đơn hàng
            boolean success = orderDAO.cancelOrder(orderId);
            
            HttpSession session = request.getSession();
            if (success) {
                session.setAttribute("message", "Đơn hàng #" + orderId + " đã được hủy thành công");
            } else {
                session.setAttribute("error", "Không thể hủy đơn hàng #" + orderId + 
                                    ". Đơn hàng chỉ có thể hủy khi ở trạng thái chờ xử lý.");
            }
            
            response.sendRedirect("orders");
        } else {
            processRequest(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Order Management Servlet";
    }
}