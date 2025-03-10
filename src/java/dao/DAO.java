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
<<<<<<< HEAD
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where sell_ID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where [name] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1,"%"+ txtSearch+"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {
        String query = "select * from product\n"
                + "where id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
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

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getLast() {
        String query = "select top 1 * from product\n"
                + "order by id desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
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
    public Account login(String user, String pass){
        String query = "select * from account\n"
                        + "where [user] = ?\n"
                        + "and pass = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
=======
            ps = conn.prepareStatement(LOGIN);
>>>>>>> lam
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
<<<<<<< HEAD
    public void deleteProduct(String pid) {
    String query = "DELETE FROM product WHERE id = ?";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setString(1, pid);
        
        System.out.println("Đang xóa sản phẩm có ID: " + pid); // Debug
        int rowsAffected = ps.executeUpdate();
        
        if (rowsAffected > 0) {
            System.out.println("✅ Xóa sản phẩm thành công!");
        } else {
            System.out.println("⚠️ Không tìm thấy sản phẩm để xóa!");
        }

    } catch (Exception e) {
        e.printStackTrace(); // Hiện lỗi ra console
    }
}
    public void insertProduct(String name, String image, String price, String title, String description, String category, int sid){
        String query = "INSERT [dbo].[product] ([name], [image],[price], [title], [description], [cateID], [sell_ID]) \n" +
                        "VALUES (?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setInt(7, sid);
            ps.executeUpdate();
            }
         catch (Exception e) {

        }
        
    }
    public void updateProduct(int id, String name, String image, double price, String title, String description, int category) {
    String sql = "UPDATE products SET name=?, image=?, price=?, title=?, description=?, category_id=? WHERE id=?";
    try (Connection conn = DBContext.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, name);
        ps.setString(2, image);
        ps.setDouble(3, price);
        ps.setString(4, title);
        ps.setString(5, description);
        ps.setInt(6, category);
        ps.setInt(7, id);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}



=======
    //------------------------------------------------------------
>>>>>>> lam

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();
        List<Category> listC = dao.getAllCategory();
        //List<Account> ac = dao.login(user, pass);
        System.out.println("Debug: Tổng product: " + list.size());
        System.out.println("Debug: Tổng category: " + listC.size());

    }

}
