package com.erasmus.web.controller;

import com.erasmus.web.dao.CourseDetDAO;
import com.erasmus.web.dao.UniversityDAO;
import com.erasmus.web.model.CourseDet;
import com.erasmus.web.model.CourseExternal;
import com.erasmus.web.model.University;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class UniversityDetailsServlet extends HttpServlet {

    private final UniversityDAO universityDAO = new UniversityDAO();
    private final CourseDetDAO courseDetDAO = new CourseDetDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ========= BASIC UNIVERSITY =========
        int universityId = Integer.parseInt(request.getParameter("id"));
        University uni = universityDAO.getUniversityById(universityId);
        request.setAttribute("university", uni);

        // ========= EQUIVALENTS WHEN A COURSE IS CLICKED =========
        String detIdParam = request.getParameter("detId");
        if (detIdParam != null && !detIdParam.isEmpty()) {
            int detId = Integer.parseInt(detIdParam);
            List<CourseExternal> equivalents =
                    courseDetDAO.getEquivalentCourses(detId, universityId);
            request.setAttribute("equivalents", equivalents);
        }

        // ========= SEMESTERS 1–5 =========
        Map<Integer, List<CourseDet>> detCourses = new HashMap<>();
        for (int sem = 1; sem <= 5; sem++) {
            detCourses.put(sem, courseDetDAO.getCoursesBySemester(sem));
        }
        request.setAttribute("detCourses", detCourses);

        // ========= ORIENTATIONS =========
        List<String> orientations = courseDetDAO.getAllOrientations();
        request.setAttribute("orientations", orientations);

        // ========= MAP: courseId → true/false for equivalence =========
        Map<Integer, Boolean> hasEquiv = new HashMap<>();

        // For semesters 1–5
        for (int sem = 1; sem <= 5; sem++) {
            for (CourseDet c : detCourses.get(sem)) {
                hasEquiv.put(c.getId(), courseDetDAO.hasEquivalence(c.getId(), universityId));
            }
        }

        // ========= SEMESTER 6 =========
        String selectedOrientation = request.getParameter("orientation");

        List<CourseDet> coreMandatory6 = courseDetDAO.getMandatoryWithoutOrientation(6);
        request.setAttribute("coreMandatory6", coreMandatory6);

        for (CourseDet c : coreMandatory6) {
            hasEquiv.put(c.getId(), courseDetDAO.hasEquivalence(c.getId(), universityId));
        }

        if (selectedOrientation != null && !selectedOrientation.isEmpty()) {
            List<CourseDet> mand6 =
                    courseDetDAO.getMandatoryForOrientationAndSemester(selectedOrientation, 6);
            List<CourseDet> elec6 =
                    courseDetDAO.getElectivesForOrientationAndSemester(selectedOrientation, 6);

            request.setAttribute("selectedOrientation", selectedOrientation);
            request.setAttribute("mandatory6", mand6);
            request.setAttribute("electives6", elec6);

            for (CourseDet c : mand6) {
                hasEquiv.put(c.getId(), courseDetDAO.hasEquivalence(c.getId(), universityId));
            }
            for (CourseDet c : elec6) {
                hasEquiv.put(c.getId(), courseDetDAO.hasEquivalence(c.getId(), universityId));
            }
        }

        // ========= SEMESTER 7 =========
        String selectedOrientation7 = request.getParameter("orientation7");

        List<CourseDet> coreMandatory7 = courseDetDAO.getMandatoryWithoutOrientation(7);
        request.setAttribute("coreMandatory7", coreMandatory7);

        for (CourseDet c : coreMandatory7) {
            hasEquiv.put(c.getId(), courseDetDAO.hasEquivalence(c.getId(), universityId));
        }

        if (selectedOrientation7 != null && !selectedOrientation7.isEmpty()) {
            List<CourseDet> mand7 =
                    courseDetDAO.getMandatoryForOrientationAndSemester(selectedOrientation7, 7);
            List<CourseDet> elec7 =
                    courseDetDAO.getElectivesForOrientationAndSemester(selectedOrientation7, 7);

            request.setAttribute("selectedOrientation7", selectedOrientation7);
            request.setAttribute("mandatory7", mand7);
            request.setAttribute("electives7", elec7);

            for (CourseDet c : mand7) {
                hasEquiv.put(c.getId(), courseDetDAO.hasEquivalence(c.getId(), universityId));
            }
            for (CourseDet c : elec7) {
                hasEquiv.put(c.getId(), courseDetDAO.hasEquivalence(c.getId(), universityId));
            }
        }

        // Store map in JSP
        request.setAttribute("hasEquiv", hasEquiv);

        // ========= FORWARD =========
        request.getRequestDispatcher("university_details.jsp").forward(request, response);
    }
}
