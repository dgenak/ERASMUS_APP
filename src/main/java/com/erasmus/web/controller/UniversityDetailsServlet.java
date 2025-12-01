package com.erasmus.web.controller;

import com.erasmus.web.dao.CourseDetDAO;
import com.erasmus.web.dao.UniversityDAO;
import com.erasmus.web.model.CourseDet;
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

        int universityId = Integer.parseInt(request.getParameter("id"));
        University uni = universityDAO.getUniversityById(universityId);
        request.setAttribute("university", uni);

        // SEMESTERS 1-5
        Map<Integer, List<CourseDet>> detCourses = new HashMap<>();
        for (int sem = 1; sem <= 5; sem++) {
            detCourses.put(sem, courseDetDAO.getCoursesBySemester(sem));
        }
        request.setAttribute("detCourses", detCourses);

        // ORIENTATIONS
        List<String> orientations = courseDetDAO.getAllOrientations();
        request.setAttribute("orientations", orientations);

        // === SEMESTER 6 ===
        String selectedOrientation = request.getParameter("orientation");

        if (selectedOrientation != null && !selectedOrientation.trim().isEmpty()) {

            List<CourseDet> mandatory = courseDetDAO
                    .getMandatoryForOrientationAndSemester(selectedOrientation, 6);

            List<CourseDet> electives = courseDetDAO
                    .getElectivesForOrientationAndSemester(selectedOrientation, 6);

            request.setAttribute("selectedOrientation", selectedOrientation);
            request.setAttribute("mandatory6", mandatory);
            request.setAttribute("electives6", electives);
        }

        List<CourseDet> coreMandatory6 = courseDetDAO.getMandatoryWithoutOrientation(6);
        request.setAttribute("coreMandatory6", coreMandatory6);


        // === SEMESTER 7 ===
        String selectedOrientation7 = request.getParameter("orientation7");

        if (selectedOrientation7 != null && !selectedOrientation7.trim().isEmpty()) {

            List<CourseDet> mandatory7 = courseDetDAO
                    .getMandatoryForOrientationAndSemester(selectedOrientation7, 7);

            List<CourseDet> electives7 = courseDetDAO
                    .getElectivesForOrientationAndSemester(selectedOrientation7, 7);

            request.setAttribute("selectedOrientation7", selectedOrientation7);
            request.setAttribute("mandatory7", mandatory7);
            request.setAttribute("electives7", electives7);
        }

        List<CourseDet> coreMandatory7 = courseDetDAO.getMandatoryWithoutOrientation(7);
        request.setAttribute("coreMandatory7", coreMandatory7);


        // DISPATCH
        request.getRequestDispatcher("university_details.jsp").forward(request, response);
    }
}
