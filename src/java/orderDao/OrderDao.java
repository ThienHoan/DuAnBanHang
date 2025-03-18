/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package orderDao;

/**
 *
 * @author Pc
 */
import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import entity.Order;

public class OrderDao implements IOrderDao {
    private Connection connection;

    public OrderDao() {
        this.connection = new DBContext().getConnection();
    }

    @Override
    public void insertOrder(Order orderObj) throws SQLException {
        String sql = "INSERT INTO Orders (userId, totalPrice, status) VALUES (?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, orderObj.getUserId());
            preparedStatement.setDouble(2, orderObj.getTotalPrice());
            preparedStatement.setString(3, orderObj.getStatus());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public Order getOrderById(int id) {
        
        return null;
        
    }

    @Override
    public List<Order> selectAllOrders() {
        List<Order> orders = new ArrayList<>();
        
        return orders;
    }

    @Override
    public boolean deleteOrder(int id) throws SQLException {
        
        return false;
        
    }

    @Override
    public boolean updateOrder(Order orderObj) throws SQLException {
        
        return false;
        
    }
    
    public int createOrder(Order order) throws SQLException {
        String sql = "INSERT INTO Orders (userID, total_price, status) VALUES (?, ?, ?)"; // Bỏ orderDate
        int orderId = -1;

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, order.getUserId());
            stmt.setDouble(2, order.getTotalPrice());
            stmt.setString(3, order.getStatus());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Tạo đơn hàng thất bại, không có dòng nào được thêm.");
            }

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    orderId = rs.getInt(1);
                } else {
                    throw new SQLException("Tạo đơn hàng thất bại, không lấy được ID.");
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Lỗi khi tạo đơn hàng: " + e.getMessage(), e);
        }

        return orderId;
    }

    // Phương thức thêm chi tiết đơn hàng
    public void addOrderDetail(int orderId, int productId, int quantity, double price) throws SQLException {
        String sql = "INSERT INTO OrderDetail (order_id, product_id, quantity, price, subtotall) VALUES (?, ?, ?, ?, ?)";

        double subtotal = quantity * price;

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderId);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.setDouble(4, price);
            stmt.setDouble(5, subtotal);

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Thêm chi tiết đơn hàng thất bại, không có dòng nào được thêm.");
            }
        } catch (SQLException e) {
            throw new SQLException("Lỗi khi thêm chi tiết đơn hàng: " + e.getMessage(), e);
        }
    }

    
    
}

