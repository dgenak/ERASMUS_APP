package com.erasmus.web.controller;

import com.erasmus.web.dao.CountryDAO;
import com.erasmus.web.dao.UniversityDAO;
import com.erasmus.web.model.Country;
import com.erasmus.web.model.University;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UniversityServlet extends HttpServlet {

    private final CountryDAO countryDAO = new CountryDAO();
    private final UniversityDAO universityDAO = new UniversityDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        // Load all countries
        List<Country> countries = countryDAO.getAllCountries();
        request.setAttribute("countries", countries);

        // Load ALL universities for the big map
        List<University> allUnis = universityDAO.getAllUniversities();
        request.setAttribute("allUnis", allUnis);

        // Load universities of selected country (if present)
        String countryParam = request.getParameter("countryId");

        if (countryParam != null && !countryParam.isEmpty()) {
            try {
                int countryId = Integer.parseInt(countryParam);
                List<University> universities = universityDAO.getUniversitiesByCountry(countryId);

                request.setAttribute("universities", universities);
                request.setAttribute("selectedCountryId", countryId);

            } catch (Exception ignored) {}
        }

        // Forward to JSP
        request.getRequestDispatcher("universities.jsp").forward(request, response);
    }
}
