/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import entity.Category;
import entity.Product;
import java.util.List;

/**
 *
 * @author lam
 */
public interface IProductService {
    
    // Lấy tất cả sản phẩm
    List<Product> getAllProducts();

    // Lấy sản phẩm theo ID
    Product getProductByID(String id);
    
    // Lấy sản phẩm theo CateID
    List<Product> getProductByCateID(String cid);
    
    // Lấy sản phẩm theo SellID
    List<Product> getProductBySellID(int sid);
    
    // Lấy category
    List<Category> getAllCategories();

    // Xóa sản phẩm
    void deleteProduct(String id);

    // Thêm sản phẩm
    void insertProduct(String name, String image, String price, String description, String category, int sid, String stock, String status);

    // Cập nhật sản phẩm
    void updateProduct(int id, String name, String image, double price, String description, int stock, int status, int category);

    
}