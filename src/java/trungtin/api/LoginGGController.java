/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.api;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import trungtin.user.UserDTO;

/**
 *
 * @author User
 */
public class LoginGGController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginGGController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            String userID = googlePojo.getId();
            String fullName = googlePojo.getName();
            String email = googlePojo.getEmail();
            UserDTO loginUser = new UserDTO(userID, fullName, "US", "", "", null, "", email, true);
            loginUser.setLoginRole("GG");
            HttpSession session = request.getSession();
            session.setAttribute("LOGIN_USER", loginUser);
            RequestDispatcher dis = request.getRequestDispatcher("MainController?searchValue=&btnAction=FindProduct");
            dis.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
