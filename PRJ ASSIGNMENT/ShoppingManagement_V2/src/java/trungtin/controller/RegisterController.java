/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import trungtin.user.UserDAO;
import trungtin.user.UserDTO;
import trungtin.user.UserError;

/**
 *
 * @author User
 */
public class RegisterController extends HttpServlet {

    private static final String ERROR = "register.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String address = request.getParameter("address");
            Date birthday = new java.sql.Date(formatter.parse(request.getParameter("birthday")).getTime());
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");

            UserError userError = new UserError();
            boolean checkValidation = true;
            UserDAO dao = new UserDAO();
            boolean checkDuplicate = dao.checkDuplicate(userID);
            if (checkDuplicate) {
                userError.setUserIDError("Duplicate User ID!!");
                checkValidation = false;
            }
            if (userID.length() < 2 || userID.length() > 10) {
                userError.setUserIDError("User ID length must be in [2;10]!!");
                checkValidation = false;
            }
            if (fullName.length() < 5 || fullName.length() > 20) {
                userError.setFullNameError("Full Name length must be in [5;20]!!");
                checkValidation = false;
            }
            if (!password.equals(confirmPassword)) {
                userError.setConfirmError("2 password must equal !!");
                checkValidation = false;
            }
            if (!phone.matches("^[0]\\d{9}")) {
                userError.setPhoneError("You must input correct Phone Number !!");
                checkValidation = false;
            }
            if (!email.matches("^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")) {
                userError.setEmailError("You must input correct Email !!");
                checkValidation = false;
            }
            request.setAttribute("USER_ERROR", userError);
            if (checkValidation) {
                UserDTO user = new UserDTO(userID, fullName, "US", password, address, birthday, phone, email, true);
                boolean checkCreate = dao.createUser(user);
                if (checkCreate) {
                    url = SUCCESS;
                }
            }
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
