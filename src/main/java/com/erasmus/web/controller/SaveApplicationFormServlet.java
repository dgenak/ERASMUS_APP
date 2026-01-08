package com.erasmus.web.controller;

import com.erasmus.web.util.DatabaseConnection;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class SaveApplicationFormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get logged-in user
        HttpSession session = request.getSession(false);
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        // 2. Read JSON body
        String jsonData = request.getReader().lines()
                .reduce("", (acc, line) -> acc + line);

        // 3. Save to DB
        String sql = "INSERT INTO applications (owner_user_id, application_form) VALUES (?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, userId);
            stmt.setString(2, jsonData);
            stmt.executeUpdate();

            // 4. Get generated application_id
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                long applicationId = rs.getLong(1);

                response.setContentType("application/json");
                response.getWriter().write(
                    "Application Form saved!"
                );
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}