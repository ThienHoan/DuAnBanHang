package entity;

import java.sql.Timestamp;

public class Wishlist {
    private int wishlistID;
    private int userID;
    private int productID;
    private Timestamp addedDate;
    private String name; // Thêm thuộc tính name
    private String img;  // Thêm thuộc tính img

    // Constructor cập nhật
    public Wishlist(int wishlistID, int userID, int productID, Timestamp addedDate, String name, String img) {
        this.wishlistID = wishlistID;
        this.userID = userID;
        this.productID = productID;
        this.addedDate = addedDate;
        this.name = name;
        this.img = img;
    }

    // Getters and Setters
    public int getWishlistID() { return wishlistID; }
    public void setWishlistID(int wishlistID) { this.wishlistID = wishlistID; }
    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }
    public int getProductID() { return productID; }
    public void setProductID(int productID) { this.productID = productID; }
    public Timestamp getAddedDate() { return addedDate; }
    public void setAddedDate(Timestamp addedDate) { this.addedDate = addedDate; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getImg() { return img; }
    public void setImg(String img) { this.img = img; }
}
