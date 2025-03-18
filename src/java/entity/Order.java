
package entity;



import java.sql.ResultSet;
import java.sql.SQLException;

public class Order { 
    private int id; 
    private int userId; 
    private String orderDate; 
    private double totalPrice; 
    private String status; 
    
    public Order() { 
    } 
    
    public Order(int id, int userId, String orderDate, double totalPrice, String status) { 
        this.id = id; 
        this.userId = userId; 
        this.orderDate = orderDate; 
        this.totalPrice = totalPrice; 
        this.status = status; 
    } 

    public int getId() { 
        return id; 
    }

    public void setId(int id) { 
        this.id = id; 
    }

    public int getUserId() { 
        return userId; 
    }

    public void setUserId(int userId) { 
        this.userId = userId; 
    }

    public String getOrderDate() { 
        return orderDate; 
    }

    public void setOrderDate(String orderDate) { 
        this.orderDate = orderDate; 
    }

    public double getTotalPrice() { 
        return totalPrice;
    }  

    public void setTotalPrice(double totalPrice) { 
        this.totalPrice = totalPrice; 
    } 

    public String getStatus() { 
        return status; 
    } 

    public void setStatus(String status) { 
        this.status = status; 
    } 

    @Override 
    public String toString() { 
        return "Order{id=" + id + 
               ", userId=" + userId + 
               ", orderDate='" + orderDate + '\'' + 
               ", totalPrice=" + totalPrice + 
               ", status='" + status + "'}"; 
    } 

    public static Order fromResultSet(ResultSet rs) throws SQLException { 
        Order order = new Order(); 
        order.setId(rs.getInt("id")); 
        order.setUserId(rs.getInt("userID")); 
        order.setOrderDate(rs.getString("orderDate")); 
        order.setTotalPrice(rs.getDouble("total_price")); 
        order.setStatus(rs.getString("status")); 
        return order;  
    }
}
