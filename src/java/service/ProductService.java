/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Category;
import entity.Product;
import java.util.List;
import productDao.IProductDAO;
import productDao.ProductDao;
import productDao.IProductDAO;

/**
 *
 * @author PC
 */
public class ProductService implements IProductService{
private final IProductDAO pdao;

    public ProductService() {
        this.pdao=new ProductDao();
    }
 
 
    @Override
    public List<Product> getAllProducts() {
        return pdao.getAllProduct();
    }

    @Override
    public Product getProductByID(String id) {
        return pdao.getProductByID(id);
    }

    @Override
    public List<Product> getProductByCateID(String cid) {
        return pdao.getProductByCID(cid);
    }

    @Override
    public List<Product> getProductBySellID(int sid) {
        return pdao.getProductBySellID(sid);
    }

    @Override
    public List<Category> getAllCategories() {
        return pdao.getAllCategory();
    }

    @Override
    public void deleteProduct(String id) {
        pdao.deleteProduct("id");
    }

    @Override
    public void insertProduct(String name, String image, String price, String description, String category, int sid, String stock, String status) {
        pdao.insertProduct(name, image, price, description, category, sid, stock, status);
    }

    @Override
    public void updateProduct(int id, String name, String image, double price, String description, int stock, int status, int category) {
        pdao.updateProduct(id, name, image, price, description, stock, status, category);
    }

    


}
