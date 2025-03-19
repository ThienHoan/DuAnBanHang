/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package productDao;

import entity.Product;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
/**
 *
 * @author Pc
 */
public interface IProductDAO {
     public Product getProductByID(String id);
}
