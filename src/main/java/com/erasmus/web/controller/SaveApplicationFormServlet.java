package com.erasmus.web.controller;

import com.erasmus.web.dao.ApplicationDAO;
import com.erasmus.web.model.Application;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

public class SaveApplicationFormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Application app = new Application();
        app.setOwnerUserId(userId);

        // ⬇️ αν είναι edit
        String idParam = request.getParameter("applicationId");
        if (idParam != null && !idParam.isEmpty()) {
            app.setApplicationId(Integer.parseInt(idParam));
        }

        app.setFirstName(request.getParameter("firstName"));
        app.setFamilyName(request.getParameter("familyName"));
        String dobParam = request.getParameter("dob");

        if (dobParam != null && !dobParam.isEmpty()) {
            app.setDob(LocalDate.parse(dobParam));
        } else {
            app.setDob(null);
        }

        app.setSex(request.getParameter("sex"));
        app.setNationality(request.getParameter("nationality"));
        app.setPlaceOfBirth(request.getParameter("placeOfBirth"));
        app.setEmail(request.getParameter("email"));
        app.setCurrentAddress(request.getParameter("currentAddress"));
        app.setPermanentAddress(request.getParameter("permanentAddress"));
        app.setTel1(request.getParameter("tel1"));
        app.setTel2(request.getParameter("tel2"));

        // ✅ ΤΙΤΛΟΣ (από input ή auto)
        String title = request.getParameter("title");
        if (title == null || title.trim().isEmpty()) {
            title = app.getFirstName() + " " + app.getFamilyName() + " – Application";
        }
        app.setTitle(title);

        ApplicationDAO dao = new ApplicationDAO();

        if (app.getApplicationId() > 0) {
            dao.update(app);
        } else {
            dao.save(app);
        }

        response.sendRedirect(request.getContextPath() + "/my-applications");
    }
}
