package com.erasmus.web.controller;

import com.erasmus.web.model.User;
import com.erasmus.web.util.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        User loggedUser = (User) request.getSession().getAttribute("authUser");
        if (loggedUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = loggedUser.getUserId();

        String firstName       = request.getParameter("firstName");
        String lastName        = request.getParameter("lastName");
        String birthDateStr    = request.getParameter("birthDate");     // yyyy-MM-dd
        String nationality     = request.getParameter("nationality");
        String gender          = request.getParameter("gender");
        String studyCycle      = request.getParameter("studyCycle");
        String universityName  = request.getParameter("universityName");
        String department      = request.getParameter("department");

        String sql =
            "UPDATE users SET firstName=?, lastName=?, birthDate=?, nationality=?, gender=?, studyCycle=?, university=?, department=? WHERE userId=?";


        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, firstName);
            ps.setString(2, lastName);

            if (birthDateStr != null && !birthDateStr.trim().isEmpty()) {
                ps.setDate(3, Date.valueOf(birthDateStr)); // expects yyyy-MM-dd
            } else {
                ps.setNull(3, java.sql.Types.DATE);
            }

            ps.setString(4, nationality);
            ps.setString(5, gender);
            ps.setString(6, studyCycle);
            ps.setString(7, universityName);
            ps.setString(8, department);
            ps.setInt(9, userId);


            ps.executeUpdate();

            // update session user
            loggedUser.setFirstName(firstName);
            loggedUser.setLastName(lastName);

            if (birthDateStr != null && !birthDateStr.trim().isEmpty()) {
                loggedUser.setBirthDate(java.time.LocalDate.parse(birthDateStr));
            } else {
                loggedUser.setBirthDate(null);
            }

            loggedUser.setNationality(nationality);
            loggedUser.setGender(gender);
            loggedUser.setStudyCycle(studyCycle);
            loggedUser.setUniversityName(universityName);
            loggedUser.setDepartment(department);

            request.getSession().setAttribute("authUser", loggedUser);

            response.sendRedirect("index.jsp");

        } catch (Exception e) {
            throw new ServletException("Error updating profile", e);
        }
    }
}
