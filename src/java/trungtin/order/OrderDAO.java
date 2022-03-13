/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import trungtin.cart.Cart;
import trungtin.cart.CartDTO;
import trungtin.product.ProductDAO;
import trungtin.product.ProductDTO;
import trungtin.utils.DBUtils;

/**
 *
 * @author User
 */
public class OrderDAO {

    private static final String ADD_ORDER = "INSERT INTO tblOrder ( orderDate, total, userID, status) VALUES (?, ?, ?, ?)";
    private static final String ADD_ORDER_DETAIL = "INSERT INTO tblOrderDetail (price, quantity, orderID, productID, status) VALUES (?, ?, ?, ?, ?)";

    public boolean addProduct(OrderDTO order, Cart cart) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(ADD_ORDER, PreparedStatement.RETURN_GENERATED_KEYS);
                pstm.setDate(1, order.getOrderDate());
                pstm.setDouble(2, order.getTotal());
                pstm.setString(3, order.getUserID());
                pstm.setInt(4, order.getStatus() ? 1 : 0);
                result = pstm.executeUpdate() > 0;
                rs = pstm.getGeneratedKeys();
                if (rs.next()) {
                    int orderID = rs.getInt(1);
                    pstm = conn.prepareStatement(ADD_ORDER_DETAIL);
                    for (CartDTO dto : cart.getCart().values()) {
                        pstm.setDouble(1, dto.getPrice());
                        pstm.setInt(2, dto.getQuantity());
                        pstm.setInt(3, orderID);
                        pstm.setString(4, dto.getProductID());
                        pstm.setBoolean(5, true);
                        result = pstm.executeUpdate() > 0;
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
        return result;
    }

}
