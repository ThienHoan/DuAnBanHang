
package dao;

import context.DBContext;
import entity.ProductReview;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReviewDAO {
    private static final Logger LOGGER = Logger.getLogger(ReviewDAO.class.getName());
    
    // Get all reviews for a specific product
    public List<ProductReview> getReviewsByProductId(int productId) {
        List<ProductReview> reviews = new ArrayList<>();
        String query = "SELECT r.reviewID, r.productID, r.userID, r.rating, r.reviewText, r.reviewDate, "
                + "a.userName FROM ProductReview r "
                + "JOIN Account a ON r.userID = a.userID "
                + "WHERE r.productID = ? ORDER BY r.reviewDate DESC";
        
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductReview review = new ProductReview(
                        rs.getInt("reviewID"),
                        rs.getInt("productID"),
                        rs.getInt("userID"),
                        rs.getInt("rating"),
                        rs.getString("reviewText"),
                        rs.getTimestamp("reviewDate"),
                        rs.getString("userName")
                    );
                    reviews.add(review);
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error getting reviews for product ID: " + productId, e);
        }
        
        return reviews;
    }
    
    // Add a new review
    public boolean addReview(int productId, int userId, int rating, String reviewText) {
        String query = "INSERT INTO ProductReview (productID, userID, rating, reviewText, reviewDate) "
                + "VALUES (?, ?, ?, ?, GETDATE())";
        
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, productId);
            ps.setInt(2, userId);
            ps.setInt(3, rating);
            ps.setString(4, reviewText);
            
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error adding review for product ID: " + productId, e);
            return false;
        }
    }
    
    // Get average rating for a product
    public double getAverageRating(int productId) {
        String query = "SELECT AVG(CAST(rating AS FLOAT)) AS avgRating FROM ProductReview WHERE productID = ?";
        
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("avgRating");
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error getting average rating for product ID: " + productId, e);
        }
        
        return 0.0;
    }
    
    // Get review count for a product
    public int getReviewCount(int productId) {
        String query = "SELECT COUNT(*) AS reviewCount FROM ProductReview WHERE productID = ?";
        
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("reviewCount");
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error getting review count for product ID: " + productId, e);
        }
        
        return 0;
    }
    
    // Get rating distribution for a product (e.g., how many 5 stars, 4 stars, etc.)
    public int[] getRatingDistribution(int productId) {
        int[] distribution = new int[5]; // Index 0 = 1 star, Index 4 = 5 stars
        String query = "SELECT rating, COUNT(*) as count FROM ProductReview "
                + "WHERE productID = ? GROUP BY rating ORDER BY rating";
        
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int rating = rs.getInt("rating");
                    int count = rs.getInt("count");
                    distribution[rating - 1] = count; // Adjust for 0-based array
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error getting rating distribution for product ID: " + productId, e);
        }
        
        return distribution;
    }
}