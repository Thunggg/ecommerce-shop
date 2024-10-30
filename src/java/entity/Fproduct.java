/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author tins
 */
public class Fproduct {
    private int id;
    private String productName;
    private int supplierId;
    private int categoryId;
    private String size;
    private int stock;
    private String description;
    private String images;
    private String colors;
    private String releaseDate;
    private double discount;
    private int unitSold;
    private double price;
    private int status;
    private int typeId;

    // Constructor
    public Fproduct(int id, String productName, int supplierId, int categoryId, String size, int stock,
            String description, String images, String colors, String releaseDate, double discount,
            int unitSold, double price, int status, int typeId) {
        this.id = id;
        this.productName = productName;
        this.supplierId = supplierId;
        this.categoryId = categoryId;
        this.size = size;
        this.stock = stock;
        this.description = description;
        this.images = images.split(" ")[0];
        this.colors = colors.split(",")[0];;
        this.releaseDate = releaseDate;
        this.discount = discount;
        this.unitSold = unitSold;
        this.price = price;
        this.status = status;
        this.typeId = typeId;
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

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }


}
