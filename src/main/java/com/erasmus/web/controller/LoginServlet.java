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

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();


        User user = userDAO.loginUser(username, password);

        if (user != null) {
            HttpSession session = request.getSession();

            session.setAttribute("authUser", user);
            session.setAttribute("username", username);
            session.setAttribute("userId", user.getUserId());
            response.sendRedirect("index.jsp");

        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
