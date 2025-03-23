package dao;

import entity.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import context.DBContext;
import java.util.LinkedHashMap;
import java.util.Map;

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
    public boolean cancelOrder(int orderId) {
        String query = "UPDATE Orders SET status = 'cancelled' WHERE id = ? AND status = 'pending'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
        
        // Lấy doanh thu theo tháng
        public Map<String, Double> getRevenueByMonth() {
            Map<String, Double> revenueByMonth = new LinkedHashMap<>();
            String query = "SELECT FORMAT(o.orderDate, 'yyyy-MM') AS month, SUM(od.subtotall) AS revenue "
                    + "FROM OrderDetail od "
                    + "JOIN Orders o ON od.order_id = o.id "
                    + "GROUP BY FORMAT(o.orderDate, 'yyyy-MM') "
                    + "ORDER BY month";
    
            try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    revenueByMonth.put(rs.getString("month"), rs.getDouble("revenue"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return revenueByMonth;
        }


    // Lấy doanh thu theo năm
    public Map<String, Double> getRevenueByYear() {
        Map<String, Double> revenueByYear = new LinkedHashMap<>();
        String query = "SELECT YEAR(o.orderDate) AS year, SUM(od.subtotall) AS revenue "
                + "FROM OrderDetail od "
                + "JOIN Orders o ON od.order_id = o.id "
                + "GROUP BY YEAR(o.orderDate) "
                + "ORDER BY year";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                revenueByYear.put(rs.getString("year"), rs.getDouble("revenue"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return revenueByYear;
    }



    // Lấy sản phẩm bán chạy nhất
    public List<Map<String, Object>> getTopSellingProducts() {
        List<Map<String, Object>> products = new ArrayList<>();
        String query = "SELECT TOP 3 p.name, SUM(od.quantity) AS total_sold, SUM(od.subtotall) AS total_revenue "
                + "FROM OrderDetail od "
                + "JOIN Product p ON od.product_id = p.pid "
                + "GROUP BY p.name "
                + "ORDER BY total_sold DESC";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Map<String, Object> product = new LinkedHashMap<>();
                product.put("name", rs.getString("name"));
                product.put("sold", rs.getInt("total_sold"));
                product.put("revenue", rs.getDouble("total_revenue"));
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
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
        
        // Test doanh thu theo tháng
    System.out.println("=== Doanh thu theo tháng ===");
    Map<String, Double> revenueByMonth = dao.getRevenueByMonth();
    for (Map.Entry<String, Double> entry : revenueByMonth.entrySet()) {
        System.out.println("Tháng: " + entry.getKey() + " - Doanh thu: $" + entry.getValue());
    }

    // Test doanh thu theo năm
    System.out.println("\n=== Doanh thu theo năm ===");
    Map<String, Double> revenueByYear = dao.getRevenueByYear();
    for (Map.Entry<String, Double> entry : revenueByYear.entrySet()) {
        System.out.println("Năm: " + entry.getKey() + " - Doanh thu: $" + entry.getValue());
    }

    // Test sản phẩm bán chạy nhất
    System.out.println("\n=== Sản phẩm bán chạy nhất ===");
    List<Map<String, Object>> topSellingProducts = dao.getTopSellingProducts();
    for (Map<String, Object> product : topSellingProducts) {
        System.out.println("Tên sản phẩm: " + product.get("name") +
                " | Số lượng bán: " + product.get("sold") +
                " | Doanh thu: $" + product.get("revenue"));
    }
    }
}