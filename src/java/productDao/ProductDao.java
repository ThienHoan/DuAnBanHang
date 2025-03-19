/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package productDao;

import context.DBContext;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DELL
 */
public class ProductDao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

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

    //------------------------------------------

    public List<Product> getProductsByCategoryAndPriceRangeAndOrder(String cateID, String priceRange, String orderBy) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE CATEID = ?";
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

}
