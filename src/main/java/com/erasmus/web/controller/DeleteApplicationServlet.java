package com.erasmus.web.controller;

import com.erasmus.web.dao.ApplicationDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteApplicationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String idParam = request.getParameter("applicationId");

        if (idParam != null) {
            int applicationId = Integer.parseInt(idParam);

            ApplicationDAO dao = new ApplicationDAO();
            dao.delete(applicationId, userId);
        }

        response.sendRedirect(request.getContextPath() + "/my-applications");
    }
}
