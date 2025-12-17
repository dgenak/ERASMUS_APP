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

        String ajax = request.getParameter("ajax");

        int universityId = Integer.parseInt(request.getParameter("id"));
        University uni = universityDAO.getUniversityById(universityId);
        request.setAttribute("university", uni);

        HttpSession session = request.getSession();

        /* ================= ORIENTATIONS ================= */
        List<String> orientations = courseDetDAO.getAllOrientations();
        request.setAttribute("orientations", orientations);
        request.setAttribute("orientations7", orientations);

        /* ================= EQUIVALENCE MAP ================= */
        Map<Integer, Boolean> hasEquiv = new HashMap<>();

        /* ================= SEMESTERS 1–5 ================= */
        Map<Integer, List<CourseDet>> detCourses = new HashMap<>();
        for (int s = 1; s <= 5; s++) {
            List<CourseDet> list = courseDetDAO.getCoursesBySemester(s);
            detCourses.put(s, list);
            for (CourseDet c : list) {
                hasEquiv.put(c.getId(),
                        courseDetDAO.hasEquivalence(c.getId(), universityId));
            }
        }
        request.setAttribute("detCourses", detCourses);

        /* ================= SEMESTER 6 ================= */
        String orientation6 = request.getParameter("orientation");
        List<CourseDet> coreMandatory6 =
                courseDetDAO.getMandatoryWithoutOrientation(6);
        request.setAttribute("coreMandatory6", coreMandatory6);

        List<CourseDet> chosen6 =
                (List<CourseDet>) session.getAttribute("chosen6");
        if (chosen6 == null) chosen6 = new ArrayList<>();

        if ("add6".equals(ajax)) {
            int id = Integer.parseInt(request.getParameter("add6"));
            CourseDet c = courseDetDAO.getCourseDetById(id);
            if (!chosen6.contains(c)) chosen6.add(c);
            session.setAttribute("chosen6", chosen6);
        }

        if ("remove6".equals(ajax)) {
            int id = Integer.parseInt(request.getParameter("remove6"));
            chosen6.removeIf(c -> c.getId() == id);
            session.setAttribute("chosen6", chosen6);
        }

        if (orientation6 != null && !orientation6.isEmpty()) {

            List<CourseDet> mandatory6 =
                courseDetDAO.getMandatoryForOrientationAndSemester(orientation6, 6);

            List<CourseDet> electives6 =
                courseDetDAO.getElectivesForOrientationAndSemester(orientation6, 6);

            request.setAttribute("selectedOrientation", orientation6);
            request.setAttribute("mandatory6", mandatory6);
            request.setAttribute("electives6", electives6);

            // ✅ ΓΕΜΙΖΕΙ ΤΟ hasEquiv ΓΙΑ ΟΛΑ
            for (CourseDet c : mandatory6) {
                hasEquiv.put(c.getId(),
                    courseDetDAO.hasEquivalence(c.getId(), universityId));
            }

            for (CourseDet c : electives6) {
                hasEquiv.put(c.getId(),
                    courseDetDAO.hasEquivalence(c.getId(), universityId));
            }
        }


        request.setAttribute("chosen6", chosen6);
        

        /* ================= SEMESTER 7 ================= */
        String orientation7 = request.getParameter("orientation7");
        List<CourseDet> coreMandatory7 =
                courseDetDAO.getMandatoryWithoutOrientation(7);
        request.setAttribute("coreMandatory7", coreMandatory7);

        List<CourseDet> chosen7 =
                (List<CourseDet>) session.getAttribute("chosen7");
        if (chosen7 == null) chosen7 = new ArrayList<>();

        if ("add7".equals(ajax)) {
            int id = Integer.parseInt(request.getParameter("add7"));
            CourseDet c = courseDetDAO.getCourseDetById(id);
            if (!chosen7.contains(c)) chosen7.add(c);
            session.setAttribute("chosen7", chosen7);
        }

        if ("remove7".equals(ajax)) {
            int id = Integer.parseInt(request.getParameter("remove7"));
            chosen7.removeIf(c -> c.getId() == id);
            session.setAttribute("chosen7", chosen7);
        }

        if (orientation7 != null && !orientation7.isEmpty()) {

            List<CourseDet> mandatory7 =
                courseDetDAO.getMandatoryForOrientationAndSemester(orientation7, 7);

            List<CourseDet> electives7 =
                courseDetDAO.getElectivesForOrientationAndSemester(orientation7, 7);

            request.setAttribute("selectedOrientation7", orientation7);
            request.setAttribute("mandatory7", mandatory7);
            request.setAttribute("electives7", electives7);

            for (CourseDet c : mandatory7) {
                hasEquiv.put(c.getId(),
                    courseDetDAO.hasEquivalence(c.getId(), universityId));
            }

            for (CourseDet c : electives7) {
                hasEquiv.put(c.getId(),
                    courseDetDAO.hasEquivalence(c.getId(), universityId));
            }
        }


        request.setAttribute("chosen7", chosen7);

        /* ================= EQUIV FOR 6 & 7 ================= */
        for (CourseDet c : coreMandatory6)
            hasEquiv.put(c.getId(),
                    courseDetDAO.hasEquivalence(c.getId(), universityId));
        for (CourseDet c : coreMandatory7)
            hasEquiv.put(c.getId(),
                    courseDetDAO.hasEquivalence(c.getId(), universityId));

        request.setAttribute("hasEquiv", hasEquiv);

        /* ================= AJAX FORWARD ================= */
        if ("load6".equals(ajax) || "add6".equals(ajax) || "remove6".equals(ajax)) {
            request.getRequestDispatcher("/semester6.jsp")
                    .forward(request, response);
            return;
        }

        if ("load7".equals(ajax) || "add7".equals(ajax) || "remove7".equals(ajax)) {
            request.getRequestDispatcher("/semester7.jsp")
                    .forward(request, response);
            return;
        }

        if ("courseModal".equals(ajax)) {

            String detIdParam = request.getParameter("detId");
            if (detIdParam != null) {
                int detId = Integer.parseInt(detIdParam);

                request.setAttribute(
                    "equivalents",
                    courseDetDAO.getEquivalentCourses(detId, universityId)
                );

                request.setAttribute(
                    "timesMatched",
                    courseDetDAO.getTimesMatched(detId, universityId)
                );

                request.setAttribute(
                    "localCourse",
                    courseDetDAO.getCourseDetById(detId)
                );
            }

            request.getRequestDispatcher("/course_modal.jsp")
                    .forward(request, response);
            return;
        }

        /* ================= FULL PAGE ================= */
        request.getRequestDispatcher("/university_details.jsp")
                .forward(request, response);
    }
}
