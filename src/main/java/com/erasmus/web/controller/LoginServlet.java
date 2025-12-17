package com.erasmus.web.controller;

import com.erasmus.web.dao.UserDAO;
import com.erasmus.web.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();


        User user = userDAO.loginUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();

            // ✅ ΙΔΙΟ attribute με το header
            session.setAttribute("authUser", user);

            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
