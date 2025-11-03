package com.erasmus.web.controller;

import com.erasmus.web.dao.UniversityDAO;
import com.erasmus.web.model.University;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.*;


//@WebServlet("/api/universities")
public class UniversityServlet extends HttpServlet {
    private UniversityDAO universityDAO = new UniversityDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String department = request.getParameter("department");
        String university = request.getParameter("university");

        response.setContentType("application/json; charset=UTF-8");
        Gson gson = new Gson();

        if (department != null) {
            Map<String, List<String>> data = universityDAO.getUniversitiesByDepartment(department);
            response.getWriter().write(gson.toJson(data));
        } else if (university != null) {
            University uni = universityDAO.getUniversityInfo(university);
            response.getWriter().write(gson.toJson(uni));
        } else {
            response.getWriter().write("{\"error\":\"Invalid parameters\"}");
        }
    }
}
