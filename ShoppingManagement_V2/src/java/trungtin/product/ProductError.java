/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.product;

/**
 *
 * @author User
 */
public class ProductError {

    private String productID;
    private String productIDError;
    private String productNameError;
    private String productImageError;
    private String productQuantityError;
    private String productCategoryIDError;
    private String productImportDateError;
    private String productUsingDateError;

    public ProductError(String productIDError, String productNameError, String productImageError, String productQuantityError, String productCategoryIDError, String productImportDateError, String productUsingDateError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.productImageError = productImageError;
        this.productQuantityError = productQuantityError;
        this.productCategoryIDError = productCategoryIDError;
        this.productImportDateError = productImportDateError;
        this.productUsingDateError = productUsingDateError;
    }

    public ProductError(String productID, String productQuantityError) {
        this.productID = productID;
        this.productQuantityError = productQuantityError;
    }

    public ProductError(String productID, String productIDError, String productNameError, String productImageError, String productQuantityError, String productCategoryIDError, String productImportDateError, String productUsingDateError) {
        this.productID = productID;
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.productImageError = productImageError;
        this.productQuantityError = productQuantityError;
        this.productCategoryIDError = productCategoryIDError;
        this.productImportDateError = productImportDateError;
        this.productUsingDateError = productUsingDateError;
    }

    public ProductError() {
        this.productIDError = "";
        this.productNameError = "";
        this.productImageError = "";
        this.productQuantityError = "";
        this.productCategoryIDError = "";
        this.productImportDateError = "";
        this.productUsingDateError = "";
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getProductImageError() {
        return productImageError;
    }

    public void setProductImageError(String productImageError) {
        this.productImageError = productImageError;
    }

    public String getProductQuantityError() {
        return productQuantityError;
    }

    public void setProductQuantityError(String productQuantityError) {
        this.productQuantityError = productQuantityError;
    }

    public String getProductCategoryIDError() {
        return productCategoryIDError;
    }

    public void setProductCategoryIDError(String productCategoryIDError) {
        this.productCategoryIDError = productCategoryIDError;
    }

    public String getProductImportDateError() {
        return productImportDateError;
    }

    public void setProductImportDateError(String productImportDateError) {
        this.productImportDateError = productImportDateError;
    }

    public String getProductUsingDateError() {
        return productUsingDateError;
    }

    public void setProductUsingDateError(String productUsingDateError) {
        this.productUsingDateError = productUsingDateError;
    }

}
