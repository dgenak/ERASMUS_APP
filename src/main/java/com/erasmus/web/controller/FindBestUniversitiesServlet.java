package com.erasmus.web.controller;

import com.erasmus.web.dao.UniversityDAO;
import com.erasmus.web.dao.CourseDetDAO;
import com.erasmus.web.model.University;
import com.erasmus.web.model.CourseDet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class FindBestUniversitiesServlet extends HttpServlet {

    private final UniversityDAO universityDAO = new UniversityDAO();
    private final CourseDetDAO courseDetDAO = new CourseDetDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Selected courses
        String[] selectedCourses = request.getParameterValues("selectedCourse");
        request.setAttribute("selectedCourses", selectedCourses);

        if (selectedCourses == null || selectedCourses.length == 0) {
            request.setAttribute("top3", Collections.emptyList());
            request.getRequestDispatcher("best_universities.jsp").forward(request, response);
            return;
        }

        // 2. Fetch all universities
        List<University> allUnis = universityDAO.getAllUniversities();

        // 3. Compute match score
        Map<University, Integer> scoreMap = new HashMap<>();

        for (University uni : allUnis) {
            int score = 0;

            for (String courseCode : selectedCourses) {
                Integer detId = courseDetDAO.getDetIdFromCourseCode(courseCode);
                if (detId != null && courseDetDAO.hasEquivalence(detId, uni.getUniversityId())) {
                    score++;
                }
            }
            scoreMap.put(uni, score);
        }

        // Sort by score
        List<Map.Entry<University, Integer>> sorted = new ArrayList<>(scoreMap.entrySet());
        sorted.sort((a, b) -> b.getValue() - a.getValue());

        // Filter score > 0
        List<Map.Entry<University, Integer>> filtered = new ArrayList<>();
        for (Map.Entry<University, Integer> entry : sorted) {
            if (entry.getValue() > 0) {
                filtered.add(entry);
            }
        }

        // Take top 3
        List<Map.Entry<University, Integer>> top3 =
                filtered.subList(0, Math.min(3, filtered.size()));

        request.setAttribute("top3", top3);

        // 4. Build courseMatchInfo
        Map<String, Boolean> courseMatchInfo = new HashMap<>();

        for (String courseCode : selectedCourses) {
            Integer detId = courseDetDAO.getDetIdFromCourseCode(courseCode);
            boolean matched = false;

            if (detId != null) {
                for (Map.Entry<University, Integer> entry : top3) {
                    if (courseDetDAO.hasEquivalence(detId, entry.getKey().getUniversityId())) {
                        matched = true;
                        break;
                    }
                }
            }
            courseMatchInfo.put(courseCode, matched);
        }

        request.setAttribute("courseMatchInfo", courseMatchInfo);

        // 5. Build courseNamesMap
        Map<String, String> courseNamesMap = new HashMap<>();
        for (String code : selectedCourses) {
            CourseDet c = courseDetDAO.getCourseDetByCode(code);
            courseNamesMap.put(code, c != null ? c.getCourseName() : "Unknown Course");
        }

        request.setAttribute("courseNamesMap", courseNamesMap);

        // 6. Build courseTimesMap
        Map<String, Map<Integer, Integer>> courseTimesMap = new HashMap<>();

        for (String code : selectedCourses) {
            Map<Integer, Integer> uniTimesMap = new HashMap<>();
            Integer detId = courseDetDAO.getDetIdFromCourseCode(code);

            if (detId != null) {
                for (Map.Entry<University, Integer> entry : top3) {
                    University u = entry.getKey();
                    
                    int times = courseDetDAO.getTimesMatched(detId, u.getUniversityId());
                    uniTimesMap.put(u.getUniversityId(), times);
                }
            }

            courseTimesMap.put(code, uniTimesMap);
        }

        request.setAttribute("courseTimesMap", courseTimesMap);

        // 7. Forward
        request.getRequestDispatcher("best_universities.jsp").forward(request, response);
    }
}
