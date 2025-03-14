package control;

import dao.DAO;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import orderDao.OrderDAO;

@WebServlet(name = "CartControl", urlPatterns = {"/cart"})
public class CartControl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");

        // Kiểm tra nếu người dùng chưa đăng nhập
        if (userID == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        Integer orderId = orderDAO.getPendingOrderId(userID);

        // Nếu không có giỏ hàng "pending", tạo giỏ hàng mới
        if (orderId == null) {
            Order newOrder = new Order();
            newOrder.setUserID(userID);
            newOrder.setOrderDate(java.time.LocalDate.now());
            newOrder.setTotalPrice(0.0);
            newOrder.setStatus("pending");
            orderDAO.addOrder(newOrder);
            orderId = orderDAO.getPendingOrderId(userID);
            if (orderId == null) {
                response.sendRedirect("ShoppingCart.jsp?error=orderCreationFailed");
                return;
            }
        }

        String action = request.getParameter("action");
        String productIdStr = request.getParameter("productId");
        String quantityStr = request.getParameter("quantity");

        if (productIdStr == null || quantityStr == null || action == null) {
            response.sendRedirect("ShoppingCart.jsp?error=invalidInput");
            return;
        }

        int productId;
        int quantity;
        try {
            productId = Integer.parseInt(productIdStr);
            quantity = Integer.parseInt(quantityStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("ShoppingCart.jsp?error=invalidNumber");
            return;
        }

        if (quantity <= 0 && !"removeProduct".equals(action) && !"clearCart".equals(action)) {
            response.sendRedirect("ShoppingCart.jsp?error=invalidQuantity");
            return;
        }

        DAO productDAO = new DAO();
        Product product = productDAO.getProductID(productId);

        if (product == null) {
            response.sendRedirect("ShoppingCart.jsp?error=productNotFound");
            return;
        }

        switch (action) {
            case "add":
                addItemToDatabase(orderId, productId, quantity, product.getPrice());
                break;
            case "updateQuantity":
                updateItemInDatabase(orderId, productId, quantity);
                break;
            case "removeProduct":
                removeItemFromDatabase(orderId, productId);
                break;
            case "clearCart":
                clearCartInDatabase(orderId);
                break;
            default:
                response.sendRedirect("ShoppingCart.jsp?error=invalidAction");
                return;
        }

        response.sendRedirect("ShoppingCart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShoppingCart.jsp");
        dispatcher.forward(request, response);
    }

    private void addItemToDatabase(int orderId, int productId, int quantity, double price) {
        OrderDAO orderDAO = new OrderDAO();
        double subtotal = price * quantity;
        OrderDetail orderDetail = new OrderDetail(orderId, productId, quantity, price, subtotal);
        orderDAO.addOrderDetail(orderDetail);
    }

    private void updateItemInDatabase(int orderId, int productId, int quantity) {
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.updateOrderDetailQuantity(orderId, productId, quantity);
    }

    private void removeItemFromDatabase(int orderId, int productId) {
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.removeOrderDetail(orderId, productId);
    }

    private void clearCartInDatabase(int orderId) {
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.clearOrderDetails(orderId);
    }
}
