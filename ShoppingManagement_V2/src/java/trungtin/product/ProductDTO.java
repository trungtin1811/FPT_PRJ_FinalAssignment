/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.product;

import java.sql.Date;

/**
 *
 * @author User
 */
public class ProductDTO {

    private String productID;
    private String productName;
    private String image;
    private double price;
    private int quantity;
    private String categoryID;
    private String categoryName;
    private Date importDate;
    private Date usingDate;
    private boolean status;

    public ProductDTO(String productID, String procductName, String image, double price, int quantity, String categoryID, Date importDate, Date usingDate, boolean status) {
        this.productID = productID;
        this.productName = procductName;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.categoryName = "";
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.status = status;
    }

    public ProductDTO(String productID, String procductName, String image, double price, int quantity, String categoryID, String categoryName, Date importDate, Date usingDate, boolean status) {
        this.productID = productID;
        this.productName = procductName;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.status = status;
    }

    public ProductDTO() {
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }

    public Date getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(Date usingDate) {
        this.usingDate = usingDate;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = this.categoryName;
    }
}
