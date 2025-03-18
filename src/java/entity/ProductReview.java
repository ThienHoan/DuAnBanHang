
package entity;

import java.sql.Timestamp;

public class ProductReview {
    private int reviewID;
    private int productID;
    private int userID;
    private int rating;
    private String reviewText;
    private Timestamp reviewDate;
    private String userName; // Added for display purposes
    
    public ProductReview() {
    }
    
    public ProductReview(int reviewID, int productID, int userID, int rating, String reviewText, Timestamp reviewDate) {
        this.reviewID = reviewID;
        this.productID = productID;
        this.userID = userID;
        this.rating = rating;
        this.reviewText = reviewText;
        this.reviewDate = reviewDate;
    }
    
    public ProductReview(int reviewID, int productID, int userID, int rating, String reviewText, Timestamp reviewDate, String userName) {
        this.reviewID = reviewID;
        this.productID = productID;
        this.userID = userID;
        this.rating = rating;
        this.reviewText = reviewText;
        this.reviewDate = reviewDate;
        this.userName = userName;
    }

    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public Timestamp getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Timestamp reviewDate) {
        this.reviewDate = reviewDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    @Override
    public String toString() {
        return "ProductReview{" + "reviewID=" + reviewID + ", productID=" + productID + 
                ", userID=" + userID + ", rating=" + rating + ", reviewDate=" + reviewDate + '}';
    }
}