/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package orderDao;

/**
 *
 * @author Pc
 */
import java.sql.SQLException; 
import java.util.List; 
import entity.Order; 

public interface IOrderDao { 
    public void insertOrder (Order orderObj) throws SQLException; 
    public int getnewOrderId() throws SQLException ;
    public Order getOrderById(int id); 
    public List<Order> selectAllOrders(); 
    public boolean deleteOrder (int id) throws SQLException; 
    public boolean updateOrder (Order orderObj) throws SQLException; 
}
