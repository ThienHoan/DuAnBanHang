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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trinh
 */
public class DAO {

    private static final String TOP_3 = "SELECT TOP 5 * FROM Product WHERE status = 1 ORDER BY pid DESC";

    private static final String TOP_5 = "SELECT TOP 5 * FROM Product ORDER BY pid DESC";
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
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
            e.printStackTrace();
        }
        return list;
    }
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
    
    public List<Product> getAllProductUser() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE status=1";
        try (Connection conn = new DBContext().getConnection();//mo ket noi voi sql
                 PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery();) {

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
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\n"
                + "where cateID = ?";
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
        String query = "select * from Product\n"
                + "where pid = ?";
        try {
            conn = new DBContext().getConnection();
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

    public boolean debugPasswordCheck(int id, String currentPassword) {
        try {
            Connection conn = new DBContext().getConnection();
            
            String query = "SELECT userID, userName, password FROM Account WHERE userID = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                int userId = rs.getInt("userID");
                String username = rs.getString("userName");
                String dbPassword = rs.getString("password");
                
                System.out.println("DEBUG - Found user in 'Account' table:");
                System.out.println("  ID: " + userId);
                System.out.println("  Username: " + username);
                System.out.println("  Password in DB: [" + dbPassword + "]");
                System.out.println("  Password provided: [" + currentPassword + "]");
                System.out.println("  Match result: " + currentPassword.equals(dbPassword));
                
                return currentPassword.equals(dbPassword);
            }
            
            System.out.println("DEBUG - User not found in Account table with ID: " + id);
            return false;
        } catch (Exception e) {
            System.out.println("Error in debug password check: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }


    public void updateAccountInfo(int id, String fullName, String email, String phone, String address) {
        String query = "UPDATE Account SET address=?, email=?, phoneNumber=? WHERE userID=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, address);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setInt(4, id);
            ps.executeUpdate();
            System.out.println("Account info updated for userID: " + id);
        } catch (Exception e) {
            System.out.println("Error updating account info: " + e.getMessage());
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
    public Account getAccountById(int id) {
        String query = "SELECT * FROM Account WHERE userID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
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
            System.out.println("Error getting account by ID: " + e.getMessage());
        }
        return null;
    }

    
    public void updateAccountPassword(int id, String newPassword) {
        String query = "UPDATE Account SET password=? WHERE userID=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setInt(2, id);
            ps.executeUpdate();
            System.out.println("Password updated successfully for userID: " + id);
        } catch (Exception e) {
            System.out.println("Error updating password: " + e.getMessage());
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

    

    public void insertProduct(String name, String image, String price, String description, String category, int sid, String stock,String status) {
        String query = "INSERT INTO [dbo].[Product] ([name], [img], [price], [description], [cateID], [sell_id], [stock], [status]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, description);
            ps.setString(5, category);
            ps.setInt(6, sid);
            ps.setString(7, stock);
            ps.setString(8, status); // status mặc định
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error inserting product: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }

    public void updateProduct(int id, String name, String image, double price, String description, int stock, int status, int category) {
    String sql = "UPDATE [dbo].[Product] SET name=?, img=?, price=?, description=?, cateID=?, stock=?, status=? WHERE pid=?";
    try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, name);
        ps.setString(2, image);
        ps.setDouble(3, price);
        ps.setString(4, description);
        ps.setInt(5, category);
        ps.setInt(6, stock);
        ps.setInt(7, status);
        ps.setInt(8, id);
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("Error updating product: " + e.getMessage());
    }
}

    public boolean recordProductClick(int productId, Integer userId) {
        String query = "INSERT INTO ProductClick (pid, uid) VALUES (?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            
            if (userId != null) {
                ps.setInt(2, userId);
            } else {
                ps.setNull(2, java.sql.Types.INTEGER);
            }
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error recording product click for product ID: " + productId, e);
            return false;
        } finally {
            closeResources(conn, ps, null);
        }
    }

    /**
     * Get the total number of clicks for a product
     * 
     * @param productId the product ID to get click count for
     * @return the total number of clicks
     */
    public int getProductClickCount(int productId) {
        String query = "SELECT COUNT(*) FROM ProductClick WHERE pid = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error getting click count for product ID: " + productId, e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return 0;
    }

    /**
     * Get the most clicked products
     * 
     * @param limit the maximum number of products to return
     * @return a list of products ordered by click count
     */
    public List<Product> getMostClickedProducts(int limit) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.*, COUNT(pc.pid) as click_count FROM Product p " +
                       "JOIN ProductClick pc ON p.pid = pc.pid " +
                       "WHERE p.status = 1 " +
                       "GROUP BY p.pid, p.name, p.price, p.description, p.stock, p.import_date, p.status, p.sell_id, p.cateID, p.img " +
                       "ORDER BY click_count DESC " +
                       "SELECT TOP (?) p.*, ISNULL(pc.clickCount, 0) as clickCount";
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, limit);
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
            LOGGER.log(Level.SEVERE, "Error getting most clicked products", e);
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public void incrementProductClickCount(int productId) throws Exception {
        String checkSql = "SELECT clickCount FROM ProductClick WHERE pid = ?";
        String insertSql = "INSERT INTO ProductClick (pid, clickCount) VALUES (?, 1)";
        String updateSql = "UPDATE ProductClick SET clickCount = clickCount + 1 WHERE pid = ?";
        
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = new DBContext().getConnection();
            
            // First check if the product exists in the ProductClick table
            ps = conn.prepareStatement(checkSql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                // Product exists, update the click count
                ps = conn.prepareStatement(updateSql);
                ps.setInt(1, productId);
                ps.executeUpdate();
            } else {
                // Product doesn't exist, insert a new record
                ps = conn.prepareStatement(insertSql);
                ps.setInt(1, productId);
                ps.executeUpdate();
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<Product> getProductsSortedByClicks(int limit) {
        List<Product> list = new ArrayList<>();
        
        // Improved SQL query that will work with MS SQL Server
        String query = "SELECT p.*, ISNULL(pc.clickCount, 0) as clickCount " +
                       "FROM Product p " +
                       "LEFT JOIN ProductClick pc ON p.pid = pc.pid " +
                       "ORDER BY ISNULL(pc.clickCount, 0) DESC";
        
        if (limit > 0) {
            // Add TOP clause for SQL Server
            query = "SELECT TOP " + limit + " p.*, ISNULL(pc.clickCount, 0) as clickCount " +
                    "FROM Product p " +
                    "LEFT JOIN ProductClick pc ON p.pid = pc.pid " +
                    "ORDER BY ISNULL(pc.clickCount, 0) DESC";
        }
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            LOGGER.log(Level.INFO, "Executing product clicks query: {0}", query);
            
            while (rs.next()) {
                int productId = rs.getInt("pid");
                String productName = rs.getString("name");
                int productStatus = rs.getInt("status");
                int clickCount = rs.getInt("clickCount");
                
                LOGGER.log(Level.FINE, "Found product: ID={0}, Name={1}, Status={2}, Clicks={3}", 
                           new Object[]{productId, productName, productStatus, clickCount});
                
                Product product = new Product(
                    productId,
                    productName,
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getInt("stock"),
                    rs.getString("import_date"),
                    productStatus,
                    rs.getInt("sell_id"),
                    rs.getInt("cateID"),
                    rs.getString("img")
                );
                
                // Set the click count properly
                product.setClickCount(clickCount);
                list.add(product);
            }
            
            LOGGER.log(Level.INFO, "Total products loaded: {0}", list.size());
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in getProductsSortedByClicks: {0}", e.getMessage());
        } finally {
            closeResources(conn, ps, rs);
        }
        
        return list;
    }

    /**
     * Initialize ProductClick table with entries for all products
     * Call this method to ensure all products have click data
     */
    public void initializeProductClicks() {
        String query = "SELECT p.pid FROM Product p " +
                      "LEFT JOIN ProductClick pc ON p.pid = pc.pid " +
                      "WHERE pc.pid IS NULL";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            // Prepare insert statement
            PreparedStatement insertPs = null;
            
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String insertQuery = "INSERT INTO ProductClick (pid, clickCount) VALUES (?, 0)";
                insertPs = conn.prepareStatement(insertQuery);
                insertPs.setInt(1, pid);
                insertPs.executeUpdate();
            }
            
            if (insertPs != null) insertPs.close();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error initializing product clicks", e);
        } finally {
            closeResources(conn, ps, rs);
        }
    }

    /**
     * Get products sorted by clicks with pagination and filtering for clicks > 0
     * 
     * @param page The page number (1-based)
     * @param productsPerPage Number of products per page
     * @return List of products with clicks > 0, sorted by clicks
     */
    public List<Product> getProductsSortedByClicksWithPaging(int page, int productsPerPage) {
        List<Product> list = new ArrayList<>();
        
        // Calculate offset for pagination
        int offset = (page - 1) * productsPerPage;
        
        // Query with pagination and filtering for clicks > 0
        // Using SQL Server pagination with OFFSET-FETCH
        String query = "SELECT p.*, ISNULL(pc.clickCount, 0) as clickCount " +
                      "FROM Product p " +
                      "LEFT JOIN ProductClick pc ON p.pid = pc.pid " +
                      "WHERE ISNULL(pc.clickCount, 0) > 0 " +
                      "ORDER BY ISNULL(pc.clickCount, 0) DESC " +
                      "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, offset);
            ps.setInt(2, productsPerPage);
            rs = ps.executeQuery();
            
            LOGGER.log(Level.INFO, "Executing paginated product clicks query: {0} with offset {1}, limit {2}", 
                       new Object[]{query, offset, productsPerPage});
            
            while (rs.next()) {
                int productId = rs.getInt("pid");
                String productName = rs.getString("name");
                int productStatus = rs.getInt("status");
                int clickCount = rs.getInt("clickCount");
                
                Product product = new Product(
                    productId,
                    productName,
                    rs.getDouble("price"),
                    rs.getString("description"),
                    rs.getInt("stock"),
                    rs.getString("import_date"),
                    productStatus,
                    rs.getInt("sell_id"),
                    rs.getInt("cateID"),
                    rs.getString("img")
                );
                
                product.setClickCount(clickCount);
                list.add(product);
            }
            
            LOGGER.log(Level.INFO, "Products loaded for page {0}: {1}", new Object[]{page, list.size()});
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in getProductsSortedByClicksWithPaging: {0}", e.getMessage());
        } finally {
            closeResources(conn, ps, rs);
        }
        
        return list;
    }

    /**
     * Count total number of products with clicks > 0
     * @return Total count of products with clicks
     */
    public int countProductsWithClicks() {
        String query = "SELECT COUNT(*) FROM Product p " +
                      "LEFT JOIN ProductClick pc ON p.pid = pc.pid " +
                      "WHERE ISNULL(pc.clickCount, 0) > 0";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error counting products with clicks: {0}", e.getMessage());
        } finally {
            closeResources(conn, ps, rs);
        }
        
        return 0;
    }

    
    // Helper method to close connections
    private void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    //--------------------------------------------
    //lấy 3 sản phẩm mới nhất vào block 2: banner
    public List<Product> getTop5NewestProducts() {
        List<Product> productList = new ArrayList<>();

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(TOP_3); ResultSet rs = ps.executeQuery()) {

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
            e.printStackTrace();
        }
        return productList;
    }

    /**
     * Test the database connection
     * @return true if connected, false otherwise
     */
    public boolean testConnection() {
        Connection conn = null;
        try {
            conn = new DBContext().getConnection();
            return conn != null;
        } catch (Exception e) {
            System.out.println("Connection test error: " + e.getMessage());
            return false;
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
    }

    /**
     * Get the raw count of records in the ProductClick table
     * @return the number of records
     */
    public int getProductClickCount() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = new DBContext().getConnection();
            String query = "SELECT COUNT(*) FROM ProductClick";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error counting ProductClick records: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return 0;
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
