/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
public class product {
    private int id;
    private String productName;
    private String images;
    private double price;
    private String description;
    private int stock;
    private double discount;
    private int status;

    public product(int id, String productName, String images, double price, String description, int stock, double discount, int status) {
        this.id = id;
        this.productName = productName;
        this.images = images.split(" ")[0];
        this.price = price;
        this.description = description;
        this.stock = stock;
        this.discount = discount;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
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

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "product{" + "id=" + id + ", productName=" + productName + ", images=" + images + ", price=" + price + ", description=" + description + ", stock=" + stock + ", discount=" + discount + ", status=" + status + '}';
    }

    
    
}
