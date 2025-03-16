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
}
