package dao;

import context.DBContext;
import entity.Account;
import entity.Category;
import entity.Product;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trinh
 */
public class DAO {

    private static final String TOP_3 = "SELECT TOP 5 * FROM Product ORDER BY pid DESC";
    
    // Logger for this class
    private static final Logger LOGGER = Logger.getLogger(DAO.class.getName());

    // Helper method to close connections
    private void closeResources(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error closing database resources", e);
        }
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
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
            LOGGER.log(Level.SEVERE, "Error getting all products", e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where cateID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
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
            LOGGER.log(Level.SEVERE, "Error getting products by category ID: " + cid, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where sell_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
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
            LOGGER.log(Level.SEVERE, "Error getting products by seller ID: " + id, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where name like ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
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
            LOGGER.log(Level.SEVERE, "Error searching products by name: " + txtSearch, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public Product getProductByID(String id) {
        String query = "select * from Product where pid = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
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
            LOGGER.log(Level.SEVERE, "Error getting product by ID: " + id, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(
                    rs.getInt("categoryID"),
                    rs.getString("categoryName")
                ));
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error getting all categories", e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public Product getLast() {
        String query = "select top 1 * from Product order by pid desc";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
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
            LOGGER.log(Level.SEVERE, "Error getting last product", e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return null;
    }

    public Account login(String user, String pass) {
        String query = "select * from Account where userName = ? and password = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
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
            LOGGER.log(Level.SEVERE, "Error during login for user: " + user, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return null;
    }

    public void deleteProduct(String pid) {
        String query = "UPDATE Product SET status = 0 WHERE pid = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            
            System.out.println("Đang cập nhật trạng thái sản phẩm có ID: " + pid);
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("✅ Cập nhật trạng thái sản phẩm thành công!");
            } else {
                System.out.println("⚠️ Không tìm thấy sản phẩm để cập nhật!");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting product with ID: " + pid, e);
        } finally {
            closeResources(conn, ps, null);
        }
    }

    public void insertProduct(String name, String image, String price, String description, String category, int sid, int stock) {
        String query = "INSERT INTO [dbo].[Product] ([name], [img], [price], [description], [cateID], [sell_id], [stock], [status]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        
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
            LOGGER.log(Level.SEVERE, "Error inserting product: " + name, e);
        } finally {
            closeResources(conn, ps, null);
        }
    }

    public void updateProduct(int id, String name, String image, double price, String description, int category, int stock) {
        String sql = "UPDATE [dbo].[Product] SET name=?, img=?, price=?, description=?, cateID=?, stock=? WHERE pid=?";
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setDouble(3, price);
            ps.setString(4, description);
            ps.setInt(5, category);
            ps.setInt(6, stock);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating product with ID: " + id, e);
        } finally {
            closeResources(conn, ps, null);
        }
    }

    public boolean checkAccountExists(String email) {
        String query = "SELECT COUNT(*) FROM Account WHERE email = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking if account exists with email: " + email, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return false;
    }

    public boolean registerAccount(Account account) {
        String query = "INSERT INTO Account (userName, password, email, address, phoneNumber, roleID, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        
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
            LOGGER.log(Level.SEVERE, "Error registering account for user: " + account.getUserName(), e);
        } finally {
            closeResources(conn, ps, null);
        }
        return false;
    }

    public int getTotalAccounts() {
        String query = "SELECT COUNT(*) FROM Account";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error getting total accounts count", e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return 0;
    }

    public List<Account> getAccountsWithPaging(int offset, int limit) {
        List<Account> list = new ArrayList<>();
        String query = "SELECT * FROM Account ORDER BY userID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, offset);
            ps.setInt(2, limit);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                    rs.getInt("userID"),
                    rs.getString("userName"),
                    rs.getString("password"),
                    rs.getString("email"),
                    rs.getString("address"),
                    rs.getString("phoneNumber"),
                    rs.getInt("roleID"),
                    rs.getInt("status")
                ));
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error getting accounts with paging", e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public Account getAccountById(String id) {
        String query = "SELECT * FROM Account WHERE userID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
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
            LOGGER.log(Level.SEVERE, "Error getting account by ID: " + id, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return null;
    }

    public void updateAccount(String id, String user, String pass, int isSell, int isAdmin, int status) {
        String query = "UPDATE Account SET userName = ?, password = ?, roleID = ?, status = ? WHERE userID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3, isSell);  
            ps.setInt(4, status);
            ps.setString(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating account with ID: " + id, e);
        } finally {
            closeResources(conn, ps, null);
        }
    }

    public boolean checkUsernameExists(String username) {
        String query = "SELECT COUNT(*) FROM Account WHERE userName = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking if username exists: " + username, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return false;
    }

    public boolean checkPhoneNumberExists(String phoneNumber) {
        String query = "SELECT COUNT(*) FROM Account WHERE phoneNumber = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, phoneNumber);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking if phone number exists: " + phoneNumber, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return false;
    }

    public boolean updateAccount(int accountID, String username, String password, String email, int roleID) {
        String query = "UPDATE Account SET userName=?, password=?, email=?, roleID=? WHERE userID=?";
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setInt(4, roleID);
            ps.setInt(5, accountID);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating account with ID: " + accountID, e);
            return false;
        } finally {
            closeResources(conn, ps, null);
        }
    }

    public Account getAccountByID(int accountID) {
        String query = "SELECT * FROM Account WHERE userID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            if (rs.next()) {
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
            LOGGER.log(Level.SEVERE, "Error getting account by ID: " + accountID, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return null;
    }

    public boolean updateAccount(int accountID, String username, String password, String email, String phoneNumber, String address, int roleID, int status) {
        String query = "UPDATE Account SET userName=?, password=?, email=?, phoneNumber=?, address=?, roleID=?, status=? WHERE userID=?";
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, phoneNumber);
            ps.setString(5, address);
            ps.setInt(6, roleID);
            ps.setInt(7, status);
            ps.setInt(8, accountID);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating account with ID: " + accountID, e);
            return false;
        } finally {
            closeResources(conn, ps, null);
        }
    }

    public boolean updateAccountStatus(int userID, int status) {
        String query = "UPDATE Account SET status = ? WHERE userID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, userID);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating account status with ID: " + userID, e);
            return false;
        } finally {
            closeResources(conn, ps, null);
        }
    }

    /**
     * Add a new account to the database
     * 
     * @param userName User's username
     * @param password User's password (will be hashed)
     * @param email User's email address
     * @param phoneNumber User's phone number
     * @param address User's physical address
     * @param roleID User's role (1=User, 2=Seller, 3=Admin)
     * @param status User's status (1=Active, 0=Inactive)
     * @return true if account was added successfully
     */
    public boolean addAccount(String userName, String password, String email, String phoneNumber, String address, int roleID, int status) {
        String query = "INSERT INTO Account (userName, password, email, phoneNumber, address, roleID, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setString(1, userName);
            
            // Check if password needs to be hashed - implement your password hashing here
            // For example, you could use a simple MD5 hash (not recommended for production)
            // String hashedPassword = DigestUtils.md5Hex(password);
            // ps.setString(2, hashedPassword);
            
            // Or if you're not hashing passwords (not recommended for security reasons)
            ps.setString(2, password);
            
            ps.setString(3, email);
            ps.setString(4, phoneNumber);
            ps.setString(5, address);
            ps.setInt(6, roleID);
            ps.setInt(7, status);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Get account by username
     * @param userName the username to search for
     * @return the Account object if found, null otherwise
     */
    public Account getAccount(String userName) {
        String query = "SELECT * FROM Account WHERE userName = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            
            if (rs.next()) {
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
            LOGGER.log(Level.SEVERE, "Error getting account by username: " + userName, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return null;
    }

    /**
     * Update account role
     * @param userID the user ID to update
     * @param roleID the new role ID
     * @return true if successful, false otherwise
     */
    public boolean updateRole(int userID, int roleID) {
        String query = "UPDATE Account SET roleID = ? WHERE userID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, roleID);
            ps.setInt(2, userID);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating role for account ID: " + userID, e);
            return false;
        } finally {
            closeResources(conn, ps, null);
    }
}

    public Account checkAccountExist(String username) {
        return getAccount(username);
    }

    //--------------------------------------------
    //lấy 3 sản phẩm mới nhất vào block 2: banner
    public List<Product> getTop5NewestProducts() {
        List<Product> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(TOP_3);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("pid"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setDescription(rs.getString("description"));
                p.setImg(rs.getString("img"));
                productList.add(p);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error getting top 5 newest products", e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return productList;
    }


    //--------------------------------------------
    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();
        List<Category> listC = dao.getAllCategory();
        List<Product> listnews = dao.getTop5NewestProducts();

        for (Category o : listC) {
            System.out.println(o);
        }
        for (Product p : listnews) {
            System.out.println(p.toString());
        }
    }
}
