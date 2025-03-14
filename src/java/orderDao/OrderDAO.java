package orderDao;

import context.DBContext;
import entity.Order;
import entity.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    // Lấy ID của đơn hàng đang ở trạng thái "pending" của người dùng
    public Integer getPendingOrderId(int userID) {
        String query = "SELECT id FROM [Order] WHERE userID = ? AND status = 'pending'";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Thêm đơn hàng mới
    public void addOrder(Order order) {
        String sql = "INSERT INTO [Order] (userID, orderDate, totalPrice, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, order.getUserID());
            ps.setDate(2, java.sql.Date.valueOf(order.getOrderDate()));
            ps.setDouble(3, order.getTotalPrice());
            ps.setString(4, order.getStatus());
            ps.executeUpdate();

            // Lấy id của đơn hàng vừa thêm vào và cập nhật cho đối tượng Order
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    int newOrderId = rs.getInt(1);
                    order.setId(newOrderId);  // Cập nhật id cho đối tượng order
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Cập nhật đơn hàng (cập nhật tổng giá và trạng thái)
    public void updateOrder(Order order) {
        String query = "UPDATE [Order] SET totalPrice = ?, status = ? WHERE id = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setDouble(1, order.getTotalPrice());
            ps.setString(2, order.getStatus());
            ps.setInt(3, order.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Thêm chi tiết đơn hàng
    public void addOrderDetail(OrderDetail orderDetail) {
        String sql = "INSERT INTO OrderDetail (orderId, productId, quantity, price, subtotal) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderDetail.getOrderId());
            ps.setInt(2, orderDetail.getProductId());
            ps.setInt(3, orderDetail.getQuantity());
            ps.setDouble(4, orderDetail.getPrice());
            ps.setDouble(5, orderDetail.getSubtotal());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Cập nhật số lượng sản phẩm trong chi tiết đơn hàng
    public void updateOrderDetailQuantity(int orderId, int productId, int quantity) {
        String sql = "UPDATE OrderDetail SET quantity = ? WHERE orderId = ? AND productId = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, quantity);
            ps.setInt(2, orderId);
            ps.setInt(3, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Xóa sản phẩm khỏi chi tiết đơn hàng
    public void removeOrderDetail(int orderId, int productId) {
        String sql = "DELETE FROM OrderDetail WHERE orderId = ? AND productId = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Xóa tất cả chi tiết đơn hàng của một đơn hàng
    public void clearOrderDetails(int orderId) {
        String sql = "DELETE FROM OrderDetail WHERE orderId = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Lấy danh sách chi tiết đơn hàng dựa vào orderId
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT * FROM OrderDetail WHERE orderId = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(rs.getInt("orderId"));
                orderDetail.setProductId(rs.getInt("productId"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setPrice(rs.getDouble("price"));
                orderDetail.setSubtotal(rs.getDouble("subtotal"));
                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetails;
    }
}
