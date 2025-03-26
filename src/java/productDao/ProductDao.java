/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package productDao;

import context.DBContext;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;

/**
 *
 * @author DELL
 */
public class ProductDao implements IProductDAO {

    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM Product";
    private static final String SELECT_PRODUCT_BY_ID = "SELECT * FROM Product WHERE pid = ?";
    private static final String SELECT_PRODUCT_BY_CATE_ID = "SELECT * FROM Product WHERE cateID = ?";
    private static final String SELECT_PRODUCT_BY_SELL_ID = "SELECT * FROM Product WHERE sell_id = ?";
    private static final String SELECT_ALL_CATEGORYS = "SELECT * FROM Category";
    private static final String DELETE_PRODUCT = "UPDATE Product SET status = 0 WHERE pid = ?";
    private static final String INSERT_PRODUCT = "INSERT INTO [dbo].[Product] ([name], [img], [price], [description], [cateID], [sell_id], [stock], [status]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_PRODUCT = "UPDATE [dbo].[Product] SET name=?, img=?, price=?, description=?, cateID=?, stock=?, status=? WHERE pid=?";

    private static final String SEARCH_BY_TEXT = "SELECT * FROM Product WHERE name LIKE ? AND status = 1;";
    private static final String TOP_5 = "SELECT TOP 5 * FROM Product WHERE status = 1 ORDER BY pid DESC";
    private static final String UPDATE_STOCK = "UPDATE Product SET stock = ?, status = ? WHERE pid = ?";

    public ProductDao() {
    }

    
    //------------------------------------------
    @Override
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();

        // Sử dụng try-with-resources để tự động đóng tài nguyên
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(SELECT_ALL_PRODUCTS); ResultSet rs = ps.executeQuery()) {

            // Lặp qua từng dòng trong ResultSet để lấy dữ liệu
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
            e.printStackTrace(); // In lỗi ra console để dễ debug
        }
        return list; // Trả về danh sách sản phẩm (nếu không có sẽ là list rỗng)
    }

    //------------------------------------------
    @Override
    public Product getProductByID(String id) {
        try (Connection conn = new DBContext().getConnection(); // Mở kết nối
                 PreparedStatement ps = conn.prepareStatement(SELECT_PRODUCT_BY_ID)) {

            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) { // Tạo ResultSet trong try-with-resources
                if (rs.next()) {
                    // Trả về đối tượng Product với dữ liệu từ DB
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
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để dễ debug
        }
        return null; // Nếu không tìm thấy sản phẩm, trả về null
    }
    //------------------------------------------
    @Override
    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(SELECT_PRODUCT_BY_CATE_ID)) {

            ps.setString(1, cid);
            try (ResultSet rs = ps.executeQuery()) {
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
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để dễ debug
        }
        return list;
    }

    //------------------------------------------
    @Override
    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(SELECT_PRODUCT_BY_SELL_ID)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
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
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để debug dễ dàng
        }
        return list;
    }

    //------------------------------------------
    @Override
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(SELECT_ALL_CATEGORYS); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Category(
                        rs.getInt("categoryID"),
                        rs.getString("categoryName")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để debug dễ dàng
        }
        return list;
    }

    //------------------------------------------
    @Override
    public void deleteProduct(String pid) {

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(DELETE_PRODUCT)) {

            ps.setString(1, pid);

            System.out.println("Đang cập nhật trạng thái sản phẩm có ID: " + pid);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Cập nhật trạng thái sản phẩm thành công!");
            } else {
                System.out.println("Không tìm thấy sản phẩm để cập nhật!");
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để debug
        }
    }

    //------------------------------------------
    @Override
    public void insertProduct(String name, String image, String price, String description, String category, int sid, String stock, String status) {

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(INSERT_PRODUCT)) {

            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, description);
            ps.setString(5, category);
            ps.setInt(6, sid);
            ps.setString(7, stock);
            ps.setString(8, status); // Trạng thái sản phẩm

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Thêm sản phẩm thành công!");
            } else {
                System.out.println("Không thể thêm sản phẩm!");
            }
        } catch (Exception e) {
            System.out.println("Lỗi khi thêm sản phẩm: " + e.getMessage());
        }
    }

    //------------------------------------------
    @Override
    public void updateProduct(int id, String name, String image, double price, String description, int stock, int status, int category) {

        // Nếu sản phẩm hết hàng, tự động đặt trạng thái là 0 (ngừng bán)
        int updatedStatus = (stock == 0) ? 0 : status;

        try (Connection conn = new DBContext().getConnection(); 
                PreparedStatement ps = conn.prepareStatement(UPDATE_PRODUCT)) {

            ps.setString(1, name);
            ps.setString(2, image);
            ps.setDouble(3, price);
            ps.setString(4, description);
            ps.setInt(5, category);
            ps.setInt(6, stock);
            ps.setInt(7, updatedStatus);
            ps.setInt(8, id);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Sản phẩm ID " + id + " đã được cập nhật thành công!");
            } else {
                System.out.println(" Không tìm thấy sản phẩm ID " + id + " để cập nhật!");
            }
        } catch (Exception e) {
            System.out.println("Lỗi khi cập nhật sản phẩm ID " + id + ": " + e.getMessage());
        }
    }

    //------------------------------------------
    @Override
    public List<Product> getTop5NewestProducts() {
        List<Product> productList = new ArrayList<>();

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(TOP_5); ResultSet rs = ps.executeQuery()) {

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

    //------------------------------------------
    @Override
    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(SEARCH_BY_TEXT)) {

            ps.setString(1, "%" + txtSearch + "%");

            try (ResultSet rs = ps.executeQuery()) {
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
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để debug dễ dàng
        }
        return list;
    }

    //------------------------------------------
    @Override
    public List<Product> getProductsByNameAndPriceRangeAndOrder(String txt, String priceRange, String orderBy) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE name LIKE ? AND status = 1";
        boolean hasPriceFilter = false;

        switch (priceRange) {
            case "0-100":
                sql += " AND price BETWEEN ? AND ?";
                hasPriceFilter = true;
                break;
            case "100-150":
                sql += " AND price BETWEEN ? AND ?";
                hasPriceFilter = true;
                break;
            case "150-max":
                sql += " AND price >= ?";
                hasPriceFilter = true;
                break;
            default:
                break;
        }

        switch (orderBy) {
            case "date":
                sql += " ORDER BY import_date DESC";
                break;
            case "price":
                sql += " ORDER BY price ASC";
                break;
            case "price-desc":
                sql += " ORDER BY price DESC";
                break;
            default:
                sql += " ORDER BY pid"; // Default sorting
                break;
        }

        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + txt + "%");
            if (hasPriceFilter) {
                switch (priceRange) {
                    case "0-100":
                        stmt.setInt(2, 0);
                        stmt.setInt(3, 100000);
                        break;
                    case "100-150":
                        stmt.setInt(2, 100000);
                        stmt.setInt(3, 150000);
                        break;
                    case "150-max":
                        stmt.setInt(2, 150000);
                        break;
                }
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(new Product(
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    //------------------------------------------
    @Override
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

    //------------------------------------------
    @Override
    public boolean updateStock(int productId, int newStock) {

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(UPDATE_STOCK)) {

            ps.setInt(1, newStock);
            if (newStock == 0) {
                ps.setInt(2, 0);
            } else {
                ps.setInt(2, 1);
            }
            ps.setInt(3, productId);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //------------------------------------------
    @Override
    public List<Product> getProductsByCategoryAndPriceRangeAndOrder(String cateID, String priceRange, String orderBy) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE cateID = ? AND status = 1";
        boolean hasPriceFilter = false;

        switch (priceRange) {
            case "0-100":
                sql += " AND price BETWEEN ? AND ?";
                hasPriceFilter = true;
                break;
            case "100-150":
                sql += " AND price BETWEEN ? AND ?";
                hasPriceFilter = true;
                break;
            case "150-max":
                sql += " AND price >= ?";
                hasPriceFilter = true;
                break;
            default:
                break;
        }

        switch (orderBy) {
            case "date":
                sql += " ORDER BY import_date DESC";
                break;
            case "price":
                sql += " ORDER BY price ASC";
                break;
            case "price-desc":
                sql += " ORDER BY price DESC";
                break;
            default:
                sql += " ORDER BY pid"; // Default sorting
                break;
        }

        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cateID);
            if (hasPriceFilter) {
                switch (priceRange) {
                    case "0-100":
                        stmt.setInt(2, 0);
                        stmt.setInt(3, 100000);
                        break;
                    case "100-150":
                        stmt.setInt(2, 100000);
                        stmt.setInt(3, 150000);
                        break;
                    case "150-max":
                        stmt.setInt(2, 150000);
                        break;
                }
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(new Product(
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
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    //----------------------------------------------------------------------------------------

    public static void main(String[] args) {
        ProductDao pdao = new ProductDao();

//        List<Product> listnews = pdao.getTop5NewestProducts();
//        for (Product listnew : listnews) {
//            System.out.println(listnew.getName());
//        }
//        List<Product> getall = pdao.getAllProduct();
//        for (Product product : getall) {
//            System.out.println(product.getName());
//        }
//           Product getProductByID=new Product();
//           getProductByID=pdao.getProductByID("12");
//           System.out.println(getProductByID.getName());
//           List<Product> getProductByCateID=pdao.getProductByCID("1");
//           for (Product p : getProductByCateID) {
//                System.out.println("ID: " + p.getId() + ", Name: " + p.getName() + ", Price: " + p.getPrice());
//            }
//        List<Product> getProductBySellID = pdao.getProductBySellID(10);
//        for (Product p : getProductBySellID) {
//                System.out.println("ID: " + p.getId() + ", Name: " + p.getName() + ", Price: " + p.getPrice());
//            }
//        List<Product> p = pdao.searchByName("oải");
//        for (Product product : p) {
//            System.out.println(product.getName());
//        }
//        List<Category> cate = pdao.getAllCategory();
//        for (Category c : cate) {
//            System.out.println("ID: " + c.getCid()
//                    + ", Name: " + c.getCname());
//        }
//        pdao.deleteProduct("15");
    }
}
