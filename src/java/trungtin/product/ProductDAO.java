/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import trungtin.utils.DBUtils;

/**
 *
 * @author User
 */
public class ProductDAO {

    private static final String ADD_PRODUCT = "INSERT INTO tblProduct (productID, productName, image, price, quantity, categoryID, importDate, usingDate, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SEARCH_ALL_PRODUCT = "SELECT productID, productName, image, price, quantity, P.categoryID, importDate, usingDate, P.status, categoryName FROM tblProduct P, tblCategory C WHERE P.categoryID = C.categoryID and P.status = 1";
    private static final String SEARCH_PRODUCT = "SELECT productID, productName, image, price, quantity, P.categoryID, importDate, usingDate, P.status, categoryName FROM tblProduct P, tblCategory C WHERE P.categoryID = C.categoryID and P.status = 1 AND productName LIKE ?";
    private static final String DELETE_PRODUCT = "UPDATE tblProduct SET status = 0 WHERE productID = ?";
    private static final String GET_CATEGORY = "SELECT categoryID, categoryName FROM tblCategory WHERE status = 1";
    private static final String GET_PRODUCT_BY_ID = "SELECT productID, productName, image, price, quantity, P.categoryID, importDate, usingDate, P.status, categoryName FROM tblProduct P, tblCategory C WHERE P.categoryID = C.categoryID and P.status = 1 AND productID = ?";
    private static final String UPDATE_QUANTITY = "UPDATE tblProduct SET quantity = ? WHERE productID = ? AND status = 1";
    private static final String CHECK_DUPLICATE = "SELECT productID FROM tblProduct WHERE productID=?";
    private static final String UPDATE = "UPDATE tblProduct SET productName = ?, image=?,price=?,quantity=?,categoryID=?,importDate=?,usingDate=? WHERE productID = ? AND status = 1";

    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(UPDATE);
                pstm.setString(1, product.getProductName());
                pstm.setString(2, product.getImage());
                pstm.setDouble(3, product.getPrice());
                pstm.setInt(4, product.getQuantity());
                pstm.setString(5, product.getCategoryID());
                pstm.setDate(6, product.getImportDate());
                pstm.setDate(7, product.getUsingDate());
                pstm.setString(8, product.getProductID());
                result = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(CHECK_DUPLICATE);
                pstm.setString(1, userID);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean deleteProduct(String productID) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(DELETE_PRODUCT);
                pstm.setString(1, productID);
                result = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean updateQuantity(String productID, int newQuantity) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(UPDATE_QUANTITY);
                pstm.setInt(1, newQuantity);
                pstm.setString(2, productID);
                result = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public boolean addProduct(ProductDTO product) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(ADD_PRODUCT);
                pstm.setString(1, product.getProductID());
                pstm.setString(2, product.getProductName());
                pstm.setString(3, product.getImage());
                pstm.setDouble(4, product.getPrice());
                pstm.setInt(5, product.getQuantity());
                pstm.setString(6, product.getCategoryID());
                pstm.setDate(7, product.getImportDate());
                pstm.setDate(8, product.getUsingDate());
                pstm.setInt(9, product.getStatus() ? 1 : 0);
                result = pstm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public List<ProductDTO> searchProduct(String searchValue) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (searchValue.equals("")) {
                    pstm = conn.prepareStatement(SEARCH_ALL_PRODUCT);
                    rs = pstm.executeQuery();
                    while (rs.next()) {
                        String productID = rs.getString("productID");
                        String productName = rs.getString("productName");
                        String image = rs.getString("image");
                        double price = rs.getDouble("price");
                        int quantity = rs.getInt("quantity");
                        String categoryID = rs.getString("categoryID");
                        Date importDate = rs.getDate("importDate");
                        Date usingDate = rs.getDate("usingDate");
                        boolean status = rs.getBoolean("status");
                        String categoryName = rs.getString("categoryName");
                        list.add(new ProductDTO(productID, productName, image, price, quantity, categoryID, categoryName, importDate, usingDate, status));
                    }
                } else {
                    pstm = conn.prepareStatement(SEARCH_PRODUCT);
                    pstm.setString(1, "%" + searchValue + "%");
                    rs = pstm.executeQuery();
                    while (rs.next()) {
                        String productID = rs.getString("productID");
                        String productName = rs.getString("productName");
                        String image = rs.getString("image");
                        double price = rs.getDouble("price");
                        int quantity = rs.getInt("quantity");
                        String categoryID = rs.getString("categoryID");
                        String categoryName = rs.getString("categoryName");
                        Date importDate = rs.getDate("importDate");
                        Date usingDate = rs.getDate("usingDate");
                        boolean status = rs.getBoolean("status");
                        list.add(new ProductDTO(productID, productName, image, price, quantity, categoryID, categoryName, importDate, usingDate, status));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<ProductDTO> listAllProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                pstm = conn.prepareStatement(SEARCH_ALL_PRODUCT);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    Date importDate = rs.getDate("importDate");
                    Date usingDate = rs.getDate("usingDate");
                    boolean status = rs.getBoolean("status");
                    String categoryName = rs.getString("categoryName");
                    list.add(new ProductDTO(productID, productName, image, price, quantity, categoryID, categoryName, importDate, usingDate, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public Map<String, String> getCategory() throws SQLException {
        Map<String, String> category = new HashMap<>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(GET_CATEGORY);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    category.put(categoryID, categoryName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return category;
    }

    public ProductDTO getProductByID(String productID) throws ClassNotFoundException, SQLException, SQLException {
        ProductDTO product = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(GET_PRODUCT_BY_ID);
                pstm.setString(1, productID);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    Date importDate = rs.getDate("importDate");
                    Date usingDate = rs.getDate("usingDate");
                    boolean status = rs.getBoolean("status");
                    product = new ProductDTO(productID, productName, image, price, quantity, categoryID, categoryName, importDate, usingDate, status);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return product;
    }
}
