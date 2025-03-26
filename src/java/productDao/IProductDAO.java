/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package productDao;

import entity.Category;
import entity.Product;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Pc
 */
public interface IProductDAO {

    List<Product> getAllProduct();

    Product getProductByID(String id);
    
    List<Product> getProductByCID(String cid);
    
    List<Product> getProductBySellID(int id);
    
    List<Category> getAllCategory();
    
    void deleteProduct(String pid);
    
    void insertProduct(String name, String image, String price, String description, String category, int sid, String stock, String status);

    void updateProduct(int id, String name, String image, double price, String description, int stock, int status, int category);
    
    List<Product> getTop5NewestProducts();
    
    List<Product> searchByName(String txtSearch);

    List<Product> getProductsByNameAndPriceRangeAndOrder(String cateID, String priceRange, String orderBy);
    
    List<Product> getAllProductUser();
    
    boolean updateStock(int productId, int newStock);
    
    List<Product> getProductsByCategoryAndPriceRangeAndOrder(String cateID, String priceRange, String orderBy);
}
