package dao;

import entity.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import context.DBContext;

public class OrderDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    // Lấy danh sách đơn hàng của người dùng
    public List<Order> getOrdersByUserId(int userId) {
    List<Order> list = new ArrayList<>();
    String query = "SELECT * FROM Orders WHERE userID = ?";

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {

        ps.setInt(1, userId);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) { // Lặp qua từng dòng kết quả
                list.add(new Order(
                    rs.getInt("id"),
                    rs.getInt("userID"),
                    rs.getString("orderDate"),
                    rs.getDouble("total_price"),
                    rs.getString("status")
                ));
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
    
    // Lấy danh sách đơn hàng của seller (dựa vào sản phẩm thuộc về seller)
    public List<Order> getOrdersBySellerId(int sellerId) {
        List<Order> list = new ArrayList<>();
        String query = "SELECT DISTINCT o.* FROM Orders o " +
                       "JOIN OrderDetail od ON o.id = od.order_id " +
                       "JOIN Product p ON od.product_id = p.pid " +
                       "WHERE p.sell_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, sellerId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = Order.fromResultSet(rs);
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // Lấy tất cả đơn hàng (cho admin)
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM Orders ORDER BY orderDate DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = Order.fromResultSet(rs);
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // Cập nhật trạng thái đơn hàng
    public boolean updateOrderStatus(int orderId, String status) {
        String query = "UPDATE Orders SET status = ? WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, orderId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Lấy đơn hàng theo ID
    public Order getOrderById(int orderId) {
        String query = "SELECT * FROM Orders WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return Order.fromResultSet(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        int userId = 1; // Thay bằng userID bạn muốn test

        List<Order> orders = dao.getOrdersByUserId(userId);

        if (orders.isEmpty()) {
            System.out.println("Không có đơn hàng nào cho userID: " + userId);
        } else {
            for (Order order : orders) {
                System.out.println(order);
            }
        }
    }
}