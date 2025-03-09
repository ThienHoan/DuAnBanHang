/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author trinh
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private static final String LOGIN = "SELECT*FROM Account WHERE username=? and password=?";
    private static final String SELECT_ALL_PRODUCT = "SELECT*FROM Product";
    private static final String SELECT_PRODUCT_BY_CID = "SELECT*FROM Product WHERE cateID=?";
    private static final String SELECT_ALL_CATEGORY = "SELECT*FROM Category";
    private static final String SEARCH_PRODUCT_BY_NAME = "SELECT*FROM Product WHERE pName like ?";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT*FROM Product WHERE pID=?";
    private static final String SELECT_LAST_PRODUCT="SELECT TOP 1 * FROM Product ORDER BY pID DESC";

    //------------------------------------------------------------
    public Account login(String user, String pass) {
        System.out.println("Debug: Đang login với username = " + user + " và password = " + pass); // In ra để kiểm tra
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(LOGIN);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt("uID"), rs.getString("username"), rs.getString("password"), rs.getInt("isSell"), rs.getInt("isAdmin"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    //------------------------------------------------------------
    //Lấy danh sách tất cả sản phẩm
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(SELECT_ALL_PRODUCT); ResultSet rs = ps.executeQuery()) {
            //mo ket noi voi sql
            while (rs.next()) {
                list.add(new Product(rs.getInt("pId"),
                        rs.getString("pName"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getString("title"),
                        rs.getString("description")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //------------------------------------------------------------
    //Lấy tất cả danh mục sản phẩm
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();

        try (Connection conn = new DBContext().getConnection();//mo ket noi voi sql
                 PreparedStatement ps = conn.prepareStatement(SELECT_ALL_CATEGORY); ResultSet rs = ps.executeQuery();) {

            while (rs.next()) {
                list.add(new Category(rs.getInt("cateID"),
                        rs.getString("cateName")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //------------------------------------------------------------
    //Lấy sản phẩm theo ID
    public Product getProductByID(String id) {
        System.out.println("Debug: Select Product by ID:" + id);
        try (Connection conn = new DBContext().getConnection();//mo ket noi voi sql
                 PreparedStatement ps = conn.prepareStatement(SELECT_PRODUCT_BY_ID)) {

            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                // Sử dụng `if` thay vì `while` vì chỉ lấy 1 sản phẩm duy nhất
                if (rs.next()) {
                    Product p= new Product(rs.getInt("pID"),
                            rs.getString("pName"),
                            rs.getString("image"),
                            rs.getDouble("price"),
                            rs.getString("title"),
                            rs.getString("description"));
                    System.out.println("Debug: Product found: "+p.getName());
                    return p;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Debug: Không tìm thấy Product có ID="+id);
        return null;
    }

    //------------------------------------------------------------ 
    //Lấy danh sách sản phẩm theo category ID
    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        System.out.println("Debug: Đang lấy sản phẩm có cateID=" + cid);
        try (Connection conn = new DBContext().getConnection();//mo ket noi voi sql
                 PreparedStatement ps = conn.prepareStatement(SELECT_PRODUCT_BY_CID)) {
            ps.setString(1, cid);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = (new Product(rs.getInt("pID"),
                            rs.getString("pName"),
                            rs.getString("image"),
                            rs.getDouble("price"),
                            rs.getString("title"),
                            rs.getString("description")));
                    list.add(p);
                }
                System.out.println("Debug: Tổng product đã lấy theo cateID: " + list.size());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //------------------------------------------------------------
    //Tìm kiếm sản phẩm theo tên
    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        System.out.println("Debug: Search Product by name: " + txtSearch);
        try (Connection conn = new DBContext().getConnection();//mo ket noi voi sql
                 PreparedStatement ps = conn.prepareStatement(SEARCH_PRODUCT_BY_NAME)) {

            ps.setString(1, "%" + txtSearch + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = (new Product(rs.getInt("pID"),
                            rs.getString("pName"),
                            rs.getString("image"),
                            rs.getDouble("price"),
                            rs.getString("title"),
                            rs.getString("description")));
                    list.add(p);
                    System.out.println("Debug:" + p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //------------------------------------------------------------
    //Lấy sản phẩm mới nhất
    public Product getLast() {
        
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(SELECT_LAST_PRODUCT);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }
    //------------------------------------------------------------

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();
        List<Category> listC = dao.getAllCategory();
        //List<Account> ac = dao.login(user, pass);
        System.out.println("Debug: Tổng product: " + list.size());
        System.out.println("Debug: Tổng category: " + listC.size());

    }

}
