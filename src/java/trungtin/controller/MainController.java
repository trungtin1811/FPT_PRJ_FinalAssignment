/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String IMPORT_PRODUCT = "ImportProduct";
    private static final String IMPORT_PRODUCT_PAGE = "addProduct.jsp";
    private static final String ADD_PRODUCT = "AddProduct";
    private static final String ADD_PRODUCT_CONTROLLER = "AddProductController";
    private static final String SEARCH_PRODUCT = "SearchProduct";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";
    private static final String DELETE_PRODUCT = "DeleteProduct";
    private static final String DELETE_PRODUCT_CONTROLLER = "DeleteProductController";
    private static final String REGISTER_USER = "Register";
    private static final String REGISTER_USER_CONTROLLER = "RegisterController";
    private static final String FIND_PRODUCT = "FindProduct";
    private static final String FIND_PRODUCT_CONTROLLER = "FindProductController";
    private static final String SEE_DETAIL = "SeeDetail";
    private static final String SEE_DETAIL_CONTROLLER = "SeeDetailController";
    private static final String BUY_PRODUCT = "Buy";
    private static final String BUY_PRODUCT_CONTROLLER = "BuyController";

//    private static final String SEARCH = "Search";
//    private static final String SEARCH_CONTROLLER = "SearchController";
//    private static final String DELETE = "Delete";
//    private static final String DELETE_CONTROLLER = "DeleteController";
//    private static final String UPDATE = "Update";
//    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
//    private static final String ADD = "Add";
//    private static final String ADD_CONTROLLER = "AddController";
//    private static final String VIEW = "View";
//    private static final String VIEW_PAGE = "viewCart.jsp";
//    private static final String REMOVE = "Remove";
//    private static final String REMOVE_CONTROLLER = "RemoveController";
//    private static final String EDIT = "Edit";
//    private static final String EDIT_CONTROLLER = "EditController";
//    private static final String CREATE = "Create";
//    private static final String CREATE_CONTROLLER = "CreateController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("btnAction");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (IMPORT_PRODUCT.equals(action)) {
                url = IMPORT_PRODUCT_PAGE;
            } else if (IMPORT_PRODUCT.equals(action)) {
                url = IMPORT_PRODUCT_PAGE;
            } else if (ADD_PRODUCT.equals(action)) {
                url = ADD_PRODUCT_CONTROLLER;
            } else if (SEARCH_PRODUCT.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if (DELETE_PRODUCT.equals(action)) {
                url = DELETE_PRODUCT_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (REGISTER_USER.equals(action)) {
                url = REGISTER_USER_CONTROLLER;
            } else if (FIND_PRODUCT.equals(action)) {
                url = FIND_PRODUCT_CONTROLLER;
            } else if (SEE_DETAIL.equals(action)) {
                url = SEE_DETAIL_CONTROLLER;
            } else if (BUY_PRODUCT.equals(action)) {
                url = BUY_PRODUCT_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
