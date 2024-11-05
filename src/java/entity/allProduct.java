package entity;


import java.sql.Date;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Nguyen_Tien_Thuan_CE181024
 */
public class allProduct {
    private String productName;
    private int supplierId;
    private int categoryId;
    private String size;
    private int stock;
    private String description;
    private String images;
    private String colors;
    private Date releaseDate;
    private double discount;
    private int unitSold;
    private double price;
    private boolean status;
    private int typeId;
    
    public allProduct(){
        
    }

    public allProduct(String productName, int supplierId, int categoryId, String size, int stock, String description, String images, String colors, Date releaseDate, double discount, int unitSold, double price, boolean status, int typeId) {
        this.productName = productName;
        this.supplierId = supplierId;
        this.categoryId = categoryId;
        this.size = size;
        this.stock = stock;
        this.description = description;
        this.images = images;
        this.colors = colors;
        this.releaseDate = releaseDate;
        this.discount = discount;
        this.unitSold = unitSold;
        this.price = price;
        this.status = status;
        this.typeId = typeId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getColors() {
        return colors;
    }

    public void setColors(String colors) {
        this.colors = colors;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getUnitSold() {
        return unitSold;
    }

    public void setUnitSold(int unitSold) {
        this.unitSold = unitSold;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    @Override
    public String toString() {
        return "allProduct{" + "productName=" + productName + ", supplierId=" + supplierId + ", categoryId=" + categoryId + ", size=" + size + ", stock=" + stock + ", description=" + description + ", images=" + images + ", colors=" + colors + ", releaseDate=" + releaseDate + ", discount=" + discount + ", unitSold=" + unitSold + ", price=" + price + ", status=" + status + ", typeId=" + typeId + '}';
    }
    
    
    
}