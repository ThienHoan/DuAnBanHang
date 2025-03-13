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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trinh
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                    rs.getInt("pid"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getInt("stock"),
                    rs.getString("import_date"),
                    rs.getInt("status"),
                    rs.getInt("sell_id"),
                    rs.getInt("cateID"),
                    rs.getString("img")
                ));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\n"
                + "where cateID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                    rs.getInt("pid"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getInt("stock"),
                    rs.getString("import_date"),
                    rs.getInt("status"),
                    rs.getInt("sell_id"),
                    rs.getInt("cateID"),
                    rs.getString("img")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\n"
                + "where sell_id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                    rs.getInt("pid"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getInt("stock"),
                    rs.getString("import_date"),
                    rs.getInt("status"),
                    rs.getInt("sell_id"),
                    rs.getInt("cateID"),
                    rs.getString("img")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\n"
                + "where name like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1,"%"+ txtSearch+"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                    rs.getInt("pid"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getInt("stock"),
                    rs.getString("import_date"),
                    rs.getInt("status"),
                    rs.getInt("sell_id"),
                    rs.getInt("cateID"),
                    rs.getString("img")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {
        String query = "select * from Product\n"
                + "where pid = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(
                    rs.getInt("pid"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getInt("stock"),
                    rs.getString("import_date"),
                    rs.getInt("status"),
                    rs.getInt("sell_id"),
                    rs.getInt("cateID"),
                    rs.getString("img")
                );
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
                list.add(new Category(rs.getInt("categoryID"),
                        rs.getString("categoryName")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getLast() {
        String query = "select top 1 * from Product\n"
                + "order by pid desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(
                    rs.getInt("pid"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getInt("stock"),
                    rs.getString("import_date"),
                    rs.getInt("status"),
                    rs.getInt("sell_id"),
                    rs.getInt("cateID"),
                    rs.getString("img")
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    public Account login(String user, String pass){
        String query = "select * from Account\n"
                        + "where userName = ?\n"
                        + "and password = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Account(
                rs.getInt("userID"), 
                rs.getString("userName"), 
                rs.getString("password"), 
                rs.getString("email"), 
                rs.getString("address"), 
                rs.getString("phoneNumber"), 
                rs.getInt("roleID"), 
                rs.getInt("status")
            );
            }
        } catch (Exception e) {
        }
        
        return null;
    }
    public void deleteProduct(String pid) {
    String query = "UPDATE Product SET status = 0 WHERE pid = ?";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setString(1, pid);
        
        System.out.println("Đang cập nhật trạng thái sản phẩm có ID: " + pid); // Debug
        int rowsAffected = ps.executeUpdate();
        
        if (rowsAffected > 0) {
            System.out.println("✅ Cập nhật trạng thái sản phẩm thành công!");
        } else {
            System.out.println("⚠️ Không tìm thấy sản phẩm để cập nhật!");
        }

    } catch (Exception e) {
        e.printStackTrace(); // Hiện lỗi ra console
    }
}
   public void insertProduct(String name, String image, String price, String description, String category, int sid, int stock) {
    String query = "INSERT INTO [dbo].[Product] ([name], [img], [price], [description], [cateID], [sell_id], [stock], [status]) "
                 + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, image);
        ps.setString(3, price);
        ps.setString(4, description);
        ps.setInt(5, Integer.parseInt(category));
        ps.setInt(6, sid);
        ps.setInt(7, stock);
        ps.setInt(8, 1); // status mặc định
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("Error inserting product: " + e.getMessage());
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            System.out.println("Error closing resources: " + e.getMessage());
        }
    }
}
   
   
    public void updateProduct(int id, String name, String image, double price, String description, int category, int stock) {
    String sql = "UPDATE [dbo].[Product] SET name=?, img=?, price=?, description=?, cateID=?, stock=? WHERE pid=?";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, name);
        ps.setString(2, image);
        ps.setDouble(3, price);
        ps.setString(4, description);
        ps.setInt(5, category);
        ps.setInt(6, stock);
        ps.setInt(7, id);
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("Error updating product: " + e.getMessage());
    }
}

    // Check if account with email already exists
    public boolean checkAccountExists(String email) {
        String query = "SELECT COUNT(*) FROM Account WHERE email = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return false;
    }

    // Register a new account
    public boolean registerAccount(Account account) {
        String query = "INSERT INTO Account (userName, password, email, address, phoneNumber, roleID, status) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, account.getUserName());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getEmail());
            ps.setString(4, account.getAddress());
            ps.setString(5, account.getPhoneNumber());
            ps.setInt(6, account.getRoleID());
            ps.setInt(7, account.getStatus());
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return false;
    }

    // Helper method to close connections
    private void closeConnection() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();
        List<Category> listC = dao.getAllCategory();
        //List<Account> ac = dao.login(user, pass);
        for (Category o : listC) {
            System.out.println(o);
        }
    }

}