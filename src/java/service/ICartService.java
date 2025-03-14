/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import entity.Cart;
import entity.Product;



public interface ICartService {
    void addToCart(Cart cart, Product product, int quantity);
    void updateCartItem(Cart cart, int productId, int quantity);
    void removeCartItem(Cart cart, int productId);
    double getTotalPrice(Cart cart);
    void removeCartItem1(Cart cart, int productId);
}

