/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author tins
 */
public class Card {

    private int cartId;
    private int productId;
    private String productName;
    private String size;
    private double price;
    private int stockQuantity;
    private String color;
    private int userId;

    // Constructor
    public Card( int productId, String productName, String size, double price, int stockQuantity, String color, int userId) {
        this.cartId = cartId;
        this.productId = productId;
        this.productName = productName;
        this.size = size;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.color = color;
        this.userId = userId;
    }
    // Getter and Setter methods
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
