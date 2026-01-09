package com.erasmus.web.controller;

import com.erasmus.web.model.Application;
import com.erasmus.web.model.LearningAgreement;
import com.erasmus.web.util.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // ===== FLAGS =====
        boolean newApp = "true".equals(request.getParameter("newApp"));
        boolean newLA  = "true".equals(request.getParameter("newLA"));

        // ===== DATA =====
        List<Application> applications = new ArrayList<>();
        List<LearningAgreement> learningAgreements = new ArrayList<>();

        Application selectedApplication = null;
        LearningAgreement la = null;

        String idParam = request.getParameter("id");

        try (Connection conn = DatabaseConnection.getConnection()) {

            /* =============================
               1️⃣ Load ALL applications
               ============================= */
            String listSql =
                "SELECT application_id, title, first_name, family_name " +
                "FROM applications " +
                "WHERE owner_user_id = ? " +
                "ORDER BY application_id DESC";

            try (PreparedStatement ps = conn.prepareStatement(listSql)) {
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Application a = new Application();
                    a.setApplicationId(rs.getInt("application_id"));
                    a.setTitle(rs.getString("title"));
                    a.setFirstName(rs.getString("first_name"));
                    a.setFamilyName(rs.getString("family_name"));
                    applications.add(a);
                }
            }

            // auto-select latest ONLY if NOT creating new
            if (!newApp && !newLA && (idParam == null || idParam.isEmpty()) && !applications.isEmpty()) {
                idParam = String.valueOf(applications.get(0).getApplicationId());
            }

            /* =============================
               2️⃣ Load ONE application
               ============================= */
            if (!newApp && idParam != null && !idParam.isEmpty()) {

                int applicationId = Integer.parseInt(idParam);

                String oneSql =
                    "SELECT * FROM applications " +
                    "WHERE application_id = ? AND owner_user_id = ?";

                try (PreparedStatement ps = conn.prepareStatement(oneSql)) {
                    ps.setInt(1, applicationId);
                    ps.setInt(2, userId);

                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        selectedApplication = new Application();
                        selectedApplication.setApplicationId(rs.getInt("application_id"));
                        selectedApplication.setTitle(rs.getString("title"));
                        selectedApplication.setFirstName(rs.getString("first_name"));
                        selectedApplication.setFamilyName(rs.getString("family_name"));
                        java.sql.Date sqlDate = rs.getDate("dob");
                        if (sqlDate != null) {
                            selectedApplication.setDob(sqlDate.toLocalDate());
                        } else {
                            selectedApplication.setDob(null);
                        }
                        selectedApplication.setSex(rs.getString("sex"));
                        selectedApplication.setNationality(rs.getString("nationality"));
                        selectedApplication.setEmail(rs.getString("email"));
                        selectedApplication.setCurrentAddress(rs.getString("current_address"));
                        selectedApplication.setPermanentAddress(rs.getString("permanent_address"));
                        selectedApplication.setTel1(rs.getString("tel1"));
                        selectedApplication.setTel2(rs.getString("tel2"));
                    }
                }

                /* =============================
                   3️⃣ Load ONE Learning Agreement
                   ============================= */
                if (!newLA) {
                    String laSql =
                        "SELECT * FROM learning_agreements " +
                        "WHERE application_id = ? AND owner_user_id = ?";

                    try (PreparedStatement ps = conn.prepareStatement(laSql)) {
                        ps.setInt(1, applicationId);
                        ps.setInt(2, userId);

                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                            la = new LearningAgreement();
                            la.setLearningAgreementId(rs.getInt("learning_agreement_id"));
                            la.setApplicationId(rs.getInt("application_id"));
                            la.setOwnerUserId(rs.getInt("owner_user_id"));
                            la.setTitle(rs.getString("title"));
                        }
                    }
                }
            }

            /* =============================
               4️⃣ Load ALL Learning Agreements
               ============================= */
            String laListSql =
                "SELECT learning_agreement_id, title, application_id " +
                "FROM learning_agreements " +
                "WHERE owner_user_id = ? " +
                "ORDER BY learning_agreement_id DESC";

            try (PreparedStatement ps = conn.prepareStatement(laListSql)) {
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    LearningAgreement l = new LearningAgreement();
                    l.setLearningAgreementId(rs.getInt("learning_agreement_id"));
                    l.setTitle(rs.getString("title"));
                    l.setApplicationId(rs.getInt("application_id"));
                    learningAgreements.add(l);
                }
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }

        // ===== ATTRIBUTES =====
        request.setAttribute("applications", applications);
        request.setAttribute("selectedApplication", selectedApplication);
        request.setAttribute("la", la);
        request.setAttribute("learningAgreements", learningAgreements);

        request.getRequestDispatcher("applications.jsp").forward(request, response);
    }
}
