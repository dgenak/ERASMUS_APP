package com.erasmus.web.controller;

import com.erasmus.web.dao.CourseDetDAO;
import com.erasmus.web.model.CourseDet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class CourseMatchSelectServlet extends HttpServlet {

    private final CourseDetDAO courseDetDAO = new CourseDetDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ---------------- SEMESTERS 1–5 ----------------
        Map<Integer, List<CourseDet>> detCourses = new HashMap<>();
        for (int sem = 1; sem <= 5; sem++) {
            detCourses.put(sem, courseDetDAO.getCoursesBySemester(sem));
        }

        request.setAttribute("detCourses", detCourses);

        // ---------------- SEMESTER 6 ----------------
        List<CourseDet> coreMandatory6 = courseDetDAO.getMandatoryWithoutOrientation(6);
        request.setAttribute("coreMandatory6", coreMandatory6);

        List<String> orientations = courseDetDAO.getAllOrientations();
        request.setAttribute("orientations", orientations);

        String selected6 = request.getParameter("orientation6");
        request.setAttribute("selected6", selected6);

        if (selected6 != null) {
            List<CourseDet> mandatory6 = courseDetDAO.getMandatoryForOrientationAndSemester(selected6, 6);
            List<CourseDet> electives6 = courseDetDAO.getElectivesForOrientationAndSemester(selected6, 6);

            request.setAttribute("mandatory6", mandatory6);
            request.setAttribute("electives6", electives6);
        }

        // ---------------- SEMESTER 7 ----------------
        List<CourseDet> coreMandatory7 = courseDetDAO.getMandatoryWithoutOrientation(7);
        request.setAttribute("coreMandatory7", coreMandatory7);

        String selected7 = request.getParameter("orientation7");
        request.setAttribute("selected7", selected7);

        if (selected7 != null) {
            List<CourseDet> mandatory7 = courseDetDAO.getMandatoryForOrientationAndSemester(selected7, 7);
            List<CourseDet> electives7 = courseDetDAO.getElectivesForOrientationAndSemester(selected7, 7);

            request.setAttribute("mandatory7", mandatory7);
            request.setAttribute("electives7", electives7);
        }

        // ---------------- FORWARD ----------------
        request.getRequestDispatcher("course_match_select.jsp").forward(request, response);
    }
}
