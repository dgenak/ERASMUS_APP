package com.erasmus.web.controller;

import com.erasmus.web.dao.UserDAO;
import com.erasmus.web.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

<<<<<<< HEAD
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
=======
        String username = request.getParameter("username");
        String password = request.getParameter("password");
>>>>>>> 52d49cf (mobile change)

        if (username == null || password == null ||
            username.isEmpty() || password.isEmpty()) {

<<<<<<< HEAD
        User user = userDAO.loginUser(username, password);

        if (user != null) {
            HttpSession session = request.getSession();

            session.setAttribute("authUser", user);
            session.setAttribute("username", username);
            session.setAttribute("userId", user.getUserId());
=======
            request.setAttribute("error", "Please fill in all fields");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        User user = userDAO.loginUser(username.trim(), password.trim());

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("authUser", user);
>>>>>>> 52d49cf (mobile change)
            response.sendRedirect("index.jsp");

        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
