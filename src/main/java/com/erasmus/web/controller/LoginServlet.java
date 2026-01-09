package com.erasmus.web.controller;

import com.erasmus.web.dao.UserDAO;
import com.erasmus.web.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null ||
            username.trim().isEmpty() || password.trim().isEmpty()) {

            request.setAttribute("error", "Please fill in all fields");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        User user = userDAO.loginUser(username.trim(), password.trim());

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("authUser", user);
            session.setAttribute("username", user.getUsername());
            session.setAttribute("userId", user.getUserId());

            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
