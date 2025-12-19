package com.erasmus.web.controller;

import com.erasmus.web.dao.UserDAO;
import com.erasmus.web.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔹 Παίρνουμε δεδομένα από τη φόρμα
        String firstName = request.getParameter("firstname");
        String lastName  = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email     = request.getParameter("email");
        String password  = request.getParameter("password");

        // 🔹 Έλεγχος email
        if (userDAO.emailExists(email)) {
            request.setAttribute(
                "error",
                "This email is already associated with another account."
            );
            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);
            return;
        }

        // 🔹 Έλεγχος αν ο χρήστης υπάρχει ήδη
        if (userDAO.userExists(firstName, lastName, email)) {
            request.setAttribute(
                "error",
                "This user is already registered."
            );
            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);
            return;
        }

        // 🔹 Δημιουργία χρήστη
        User user = new User(firstName, lastName, username, email, password);
        boolean inserted = userDAO.insertUser(user);

        if (inserted) {
            // ✅ Auto login
            HttpSession session = request.getSession(true);
            session.setAttribute("authUser", user);

            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute(
                "error",
                "Registration failed. Please try again."
            );
            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);
        }
    }
}

