package service;

import entity.Cart;
import entity.CartItem;
import entity.Product;

public class CartService implements ICartService {

    @Override
    public void addToCart(Cart cart, Product product, int quantity) {
        cart.addItem(product, quantity);
    }

    @Override
    public void updateCartItem(Cart cart, int productId, int quantity) {
        cart.updateItem(productId, quantity);
    }

    @Override
    public void removeCartItem(Cart cart, int productId) {
        cart.removeItem(productId);
    }

    @Override
    public double getTotalPrice(Cart cart) {
        return cart.getTotalAmount();
    }

    @Override
    public double calculateTotalWithDiscount(Cart cart) {
        return cart.getTotalAmountWithDiscount();
    }

    @Override
    public double calculateTotalDiscount(Cart cart) {
        return cart.getTotalDiscount();
    }
    @Override
    public void applyDiscount(Cart cart, String discountCode) {
        cart.applyDiscount(discountCode);
    }




}
