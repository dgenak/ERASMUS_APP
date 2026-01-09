package com.erasmus.web.controller;

import com.erasmus.web.util.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class SaveLearningAgreementServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String appIdParam = request.getParameter("applicationId");
        if (appIdParam == null || appIdParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/applications.jsp");
            return;
        }
        int applicationId = Integer.parseInt(appIdParam);


        String laIdParam = request.getParameter("learningAgreementId");
        Integer laId = (laIdParam != null && !laIdParam.isEmpty())
                ? Integer.parseInt(laIdParam)
                : null;

        try (Connection conn = DatabaseConnection.getConnection()) {

            if (laId == null) {
                String insertSql =
                        "INSERT INTO learning_agreements (application_id, owner_user_id, title) " +
                        "VALUES (?, ?, ?)";

                try (PreparedStatement ps = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setInt(1, applicationId);
                    ps.setInt(2, userId);
                    ps.setString(3, request.getParameter("la_title"));

                    ps.executeUpdate();

                    ResultSet rs = ps.getGeneratedKeys();
                    if (rs.next()) {
                        laId = rs.getInt(1);
                    }
                }
            }

            String updateSql =
                "UPDATE learning_agreements SET " +
                "title=?, last_name=?, first_name=?, dob=?, nationality=?, gender=?, study_cycle=?, field_education=?, " +
                "sending_name=?, sending_faculty=?, sending_code=?, sending_address=?, sending_country=?, sending_contact=?, " +
                "receiving_name=?, receiving_faculty=?, receiving_code=?, receiving_address=?, receiving_country=?, receiving_contact=?, " +
                "period_from=?, period_to=?, course_link=?, " +
                "a1_code=?, a1_title=?, a1_semester=?, a1_ects=?, " +
                "a2_code=?, a2_title=?, a2_semester=?, a2_ects=?, " +
                "a3_code=?, a3_title=?, a3_semester=?, a3_ects=?, " +
                "lang_a1=?, lang_a2=?, lang_b1=?, lang_b2=?, lang_c1=?, lang_c2=?, lang_native=? " +
                "WHERE learning_agreement_id=?";

            try (PreparedStatement ps = conn.prepareStatement(updateSql)) {

                int i = 1;

                ps.setString(i++, request.getParameter("la_title"));
                ps.setString(i++, request.getParameter("la_lastName"));
                ps.setString(i++, request.getParameter("la_firstName"));
                String dob = request.getParameter("la_dob");
                if (dob == null || dob.isEmpty()) {
                    ps.setNull(i++, Types.DATE);
                } else {
                    ps.setDate(i++, Date.valueOf(dob));
                }

                ps.setString(i++, request.getParameter("la_nationality"));
                ps.setString(i++, request.getParameter("la_gender"));
                ps.setString(i++, request.getParameter("la_studyCycle"));
                ps.setString(i++, request.getParameter("la_fieldEducation"));

                ps.setString(i++, request.getParameter("la_sendingName"));
                ps.setString(i++, request.getParameter("la_sendingFaculty"));
                ps.setString(i++, request.getParameter("la_sendingCode"));
                ps.setString(i++, request.getParameter("la_sendingAddress"));
                ps.setString(i++, request.getParameter("la_sendingCountry"));
                ps.setString(i++, request.getParameter("la_sendingContact"));

                ps.setString(i++, request.getParameter("la_receivingName"));
                ps.setString(i++, request.getParameter("la_receivingFaculty"));
                ps.setString(i++, request.getParameter("la_receivingCode"));
                ps.setString(i++, request.getParameter("la_receivingAddress"));
                ps.setString(i++, request.getParameter("la_receivingCountry"));
                ps.setString(i++, request.getParameter("la_receivingContact"));

                ps.setString(i++, request.getParameter("la_periodFrom"));
                ps.setString(i++, request.getParameter("la_periodTo"));
                ps.setString(i++, request.getParameter("la_courseLink"));

                ps.setString(i++, request.getParameter("la_a1_code"));
                ps.setString(i++, request.getParameter("la_a1_title"));
                ps.setString(i++, request.getParameter("la_a1_semester"));
                ps.setObject(i++, parseInt(request.getParameter("la_a1_ects")));

                ps.setString(i++, request.getParameter("la_a2_code"));
                ps.setString(i++, request.getParameter("la_a2_title"));
                ps.setString(i++, request.getParameter("la_a2_semester"));
                ps.setObject(i++, parseInt(request.getParameter("la_a2_ects")));

                ps.setString(i++, request.getParameter("la_a3_code"));
                ps.setString(i++, request.getParameter("la_a3_title"));
                ps.setString(i++, request.getParameter("la_a3_semester"));
                ps.setObject(i++, parseInt(request.getParameter("la_a3_ects")));

                ps.setBoolean(i++, request.getParameter("langA1") != null);
                ps.setBoolean(i++, request.getParameter("langA2") != null);
                ps.setBoolean(i++, request.getParameter("langB1") != null);
                ps.setBoolean(i++, request.getParameter("langB2") != null);
                ps.setBoolean(i++, request.getParameter("langC1") != null);
                ps.setBoolean(i++, request.getParameter("langC2") != null);
                ps.setBoolean(i++, request.getParameter("langNative") != null);

                ps.setInt(i, laId);

                ps.executeUpdate();
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }

        response.sendRedirect(
        "applications.jsp?id=" + applicationId
        );

    }

    private Integer parseInt(String value) {
        try {
            return (value == null || value.isEmpty()) ? null : Integer.parseInt(value);
        } catch (Exception e) {
            return null;
        }
    }
}
