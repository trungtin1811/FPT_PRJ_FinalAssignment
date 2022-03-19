/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import trungtin.cart.Cart;
import trungtin.cart.CartDTO;
import trungtin.email.Email;
import trungtin.order.OrderDAO;
import trungtin.order.OrderDTO;
import trungtin.product.ProductDAO;
import trungtin.product.ProductDTO;
import trungtin.product.ProductError;
import trungtin.user.UserDTO;

/**
 *
 * @author User
 */
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "checkOut.jsp";
    private static final String LOGIN_PAGE = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String error = null;
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            List<ProductError> listError = new ArrayList<>();
            if (loginUser == null) {
                url = LOGIN_PAGE;
            } else if (cart == null || cart.getCart().isEmpty()) {
                error = "Your cart is empty! Please buy first!";
            } else {
                for (CartDTO dto : cart.getCart().values()) {
                    ProductDAO dao = new ProductDAO();
                    ProductDTO product = dao.getProductByID(dto.getProductID());
                    if (dto.getQuantity() > product.getQuantity()) {
                        listError.add(new ProductError(dto.getProductID(), "Product quantity is not enough"));
                    }
                }
                boolean check = false;
                if (error == null && listError.size() == 0) {
                    double total = 0;
                    for (CartDTO dto : cart.getCart().values()) {
                        ProductDAO dao = new ProductDAO();
                        ProductDTO product = dao.getProductByID(dto.getProductID());
                        check = dao.updateQuantity(dto.getProductID(), product.getQuantity() - dto.getQuantity());
                        total += dto.getPrice() * dto.getQuantity();
                    }
                    cart.setTotal(total);
                    OrderDTO order = new OrderDTO(new java.sql.Date(System.currentTimeMillis()), cart.getTotal(), loginUser.getUserID(), true);
                    OrderDAO dao = new OrderDAO();
                    dao.addProduct(order, cart);
                }
                if (check) {
                    url = SUCCESS;
                    session.setAttribute("CART", null);
                    Email email = new Email();
                    boolean x = email.sendMail(loginUser.getFullName(), loginUser.getEmail(), cart);
                }
            }
            request.setAttribute("ERROR", error);
            request.setAttribute("LIST_ERROR", listError);

        } catch (Exception e) {

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
