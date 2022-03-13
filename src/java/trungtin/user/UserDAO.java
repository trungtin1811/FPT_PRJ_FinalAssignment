/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import trungtin.utils.DBUtils;

/**
 *
 * @author User
 */
public class UserDAO {

    private static final String LOGIN = "select fullName, roleID, address, birthday, phone, email, status from tblUsers WHERE userID=? AND password=? and status = 1";
    private static final String CHECK_DUPLICATE = "SELECT userID FROM tblUsers WHERE userID=?";
    private static final String CREATE = "INSERT INTO tblUsers (userID, fullName, roleID, password, address, birthday, phone, email, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_USER = "UPDATE tblUsers SET fullName = ?, password = ?, address = ?, birthday = ?, phone = ?, email = ? WHERE status = 1 and userID = ?";

    public boolean updateUser(UserDTO user) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(UPDATE_USER);
                pstm.setString(1, user.getFullName());
                pstm.setString(2, user.getPassword());
                pstm.setString(3, user.getAddress());
                pstm.setDate(4, user.getBirthday());
                pstm.setString(5, user.getPhone());
                pstm.setString(6, user.getEmail());
                pstm.setString(7, user.getUserID());
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

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(LOGIN);
                pstm.setString(1, userID);
                pstm.setString(2, password);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("address");
                    Date birthday = rs.getDate("birthday");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    boolean status = rs.getBoolean("status");
                    user = new UserDTO(userID, fullName, roleID, password, address, birthday, phone, email, status);
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
        return user;
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

    public boolean createUser(UserDTO user) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(CREATE);
                pstm.setString(1, user.getUserID());
                pstm.setString(2, user.getFullName());
                pstm.setString(3, user.getRoleID());
                pstm.setString(4, user.getPassword());
                pstm.setString(5, user.getAddress());
                pstm.setDate(6, user.getBirthday());
                pstm.setString(7, user.getPhone());
                pstm.setString(8, user.getEmail());
                pstm.setInt(9, user.getStatus() ? 1 : 0);
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
}
