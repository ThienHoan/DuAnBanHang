/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Pc
 */
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
    private String discountCode;
    private double discountPercentage = 0.0;

    private Map<Integer, CartItem> items = new LinkedHashMap<>();

    public void addItem(Product product, int quantity) {
        int productId = product.getId();

        if (items.containsKey(productId)) {
            CartItem item = items.get(productId);
            item.setQuantity(item.getQuantity() + quantity);
        } else {  
            items.put(productId, new CartItem(product, quantity));
        }
    }

    public void updateItem(int productId, int quantity) {
        if (items.containsKey(productId)) {
            if (quantity <= 0) {
                items.remove(productId);
            } else {
                items.get(productId).setQuantity(quantity);
            }
        }
    }

    public void removeItem(int productId) {
        items.remove(productId);
        discountCode = null;
        discountPercentage = 0.0;
    }

    public Collection<CartItem> getItems() {
        return items.values();
    }

    public int getTotalQuantity() {
        return items.values().stream().mapToInt(CartItem::getQuantity).sum();
    }

    public double getTotalAmount() {
        return items.values().stream()
            .mapToDouble(CartItem::getTotalPrice)
            .sum();
    }

    public double getTotalDiscount() {
        return getTotalAmount() * (discountPercentage / 100);
    }

    public double getTotalAmountWithDiscount() {
        return getTotalAmount() - getTotalDiscount();
    }

    public void applyDiscount(String code) {
        double discount = checkValidDiscount(code);
        this.discountPercentage = discount;
        this.discountCode = discount > 0 ? code : null;
    }

    private double checkValidDiscount(String code) {
        if (code == null || code.isEmpty()) {
            return 0.0;
        }
        switch (code.toUpperCase()) {
            case "SALE10": return 10;
            case "SALE20": return 20; 
            case "SALE30": return 30;
            default: return 0.0; 
        }
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public double getDiscountPercentage() {
        return discountPercentage;
    }

    public void clear() {
        items.clear();
        discountCode = null;
        discountPercentage = 0.0;
    }
}
