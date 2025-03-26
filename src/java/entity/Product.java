package entity;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Product {

    private int id;
    private String name;
    private double price;
    private String description;
    private int stock;
    private LocalDate importDate;
    private int status;
    private int sell_id;
    private int cateID;
    private String img;

    // Định dạng cho ngày
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    //Định dạng tiền VND
    private String priceFormatted;

    // Add click count field
    private int clickCount;

    // Constructor mặc định
    public Product() {
    }

    // Constructor với tham số, importDate nhận vào String
    public Product(int id, String name, double price, String description,
            int stock, String importDate, int status, int sell_id,
            int cateID, String img) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.stock = stock;
        setImportDate(importDate); // Sử dụng setter để parse String thành LocalDate
        this.status = status;
        this.sell_id = sell_id;
        this.cateID = cateID;
        this.img = img;
    }

    //getter và setter cho VND
    public String getPriceFormatted() {
        return priceFormatted;
    }

    public void setPriceFormatted(String priceFormatted) {
        this.priceFormatted = priceFormatted;
    }

    // Getter cho importDate, trả về String theo format yyyy-MM-dd
    public String getImportDate() {
        if (importDate == null) {
            return null;
        }
        return importDate.format(DATE_FORMATTER);
    }

    // Setter cho importDate, nhận vào String và parse thành LocalDate
    public void setImportDate(String importDate) {
        if (importDate == null || importDate.trim().isEmpty()) {
            this.importDate = null;
        } else {
            this.importDate = LocalDate.parse(importDate, DATE_FORMATTER);
        }
    }

    // Các getter và setter khác
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getSell_id() {
        return sell_id;
    }

    public void setSell_id(int sell_id) {
        this.sell_id = sell_id;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getSellID() {
        return sell_id;
    }

    public void setCategoryID(int categoryID) {
        this.cateID = categoryID;
    }

    public int getClickCount() {
        return clickCount;
    }

    public void setClickCount(int clickCount) {
        this.clickCount = clickCount;
    }
}
