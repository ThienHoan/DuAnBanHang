/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Pc
 */

public class CartItem {
    private Product product;
    private int quantity;

    public CartItem(Product product, int quantity) { 
        this.product = product; 
        this.quantity = quantity;
    } 
    
    public Product getProduct() {
        return product;
    }
    
    public int getQuantity() {
        return quantity;
    }
    
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public double getTotalPrice() {
        return product.getPrice() * quantity;
    }

    public double getDiscountedPrice() {
    return product.getPrice() * (1 - 0.10); 
}

    public double getTotalDiscountedPrice() {
        return getDiscountedPrice() * quantity;
    }

    public double getTotalDiscountAmount() {
        return (product.getPrice() * quantity) - getTotalDiscountedPrice();
    }


}

