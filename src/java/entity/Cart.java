/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    // Map to store products and their quantities
    private Map<Integer, CartItem> items;

    public Cart() {
        items = new HashMap<>();
    }

    // Add a product to the cart with a given quantity
    public void addItem(Product product, int quantity) {
        int productId = product.getId();
        if (items.containsKey(productId)) {
            CartItem existingItem = items.get(productId);
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
        } else {
            items.put(productId, new CartItem(product, quantity));
        }
    }

    // Update the quantity of a product in the cart
    public void updateItem(int productId, int quantity) {
        if (items.containsKey(productId)) {
            CartItem item = items.get(productId);
            item.setQuantity(quantity);
        }
    }

    // Remove a product from the cart
    public void removeItem(int productId) {
        if (items.containsKey(productId)) {
            items.remove(productId);
        }
    }

    // Clear all items in the cart
    public void clearCart() {
        items.clear();
    }

    // Get total price of all items in the cart
    public double getTotalPrice() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getQuantity() * item.getProduct().getPrice();
        }
        return total;
    }

    // Get all items in the cart
    public Map<Integer, CartItem> getItems() {
        return items;
    }
}
