package com.erasmus.web.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import com.erasmus.web.model.DMSTG; // <-- εδώ βεβαιώσου ότι έχεις το DMSTG.java στο ίδιο project

//@WebServlet("/api/universities/*")
public class UniversityMappingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String path = request.getPathInfo();
        if (path == null) {
            out.print("{\"error\": \"No endpoint specified\"}");
            return;
        }

        switch (path) {
            case "/countries" -> {
                List<String> countries = Arrays.asList(
                        "Belgium", "Cyprus", "Denmark", "Finland", "France",
                        "Germany", "Italy", "Netherlands", "Norway", "Slovakia", "Sweden", "Turkey"
                );
                out.print(toJsonArray(countries));
            }

            case "/byCountry" -> {
                String country = request.getParameter("country");
                List<String> universities = getUniversitiesByCountry(country);
                out.print(toJsonArray(universities));
            }

            case "/dmstCourses" -> {
                Map<String, List<String>> courses = getDMSTCourses();
                out.print(toJsonMap(courses));
            }

            case "/mapping" -> {
                String university = request.getParameter("university");
                String dmstCourse = request.getParameter("dmstCourse");
                String mapping = getMapping(university, dmstCourse);
                out.print("{\"mapping\":\"" + mapping + "\"}");
            }

            default -> out.print("{\"error\": \"Invalid endpoint\"}");
        }
    }

    private List<String> getUniversitiesByCountry(String country) {
        if (country == null) return List.of();
        return switch (country) {
            case "Belgium" -> DMSTG.BELGIUM;
            case "Cyprus" -> DMSTG.CYPRUS;
            case "Denmark" -> DMSTG.DENMARK;
            case "Finland" -> DMSTG.FINLAND;
            case "France" -> DMSTG.FRANCE;
            case "Germany" -> DMSTG.GERMANY;
            case "Italy" -> DMSTG.ITALY;
            case "Netherlands" -> DMSTG.NETHERLANDS;
            case "Norway" -> DMSTG.NORWAY;
            case "Slovakia" -> DMSTG.SLOVAKIA;
            case "Sweden" -> DMSTG.SWEDEN;
            case "Turkey" -> DMSTG.TURKEY;
            default -> List.of();
        };
    }

    private Map<String, List<String>> getDMSTCourses() {
        Map<String, List<String>> map = new LinkedHashMap<>();
        map.put("Εξάμηνο 1", List.of("Πληροφορική Ι", "Μαθηματικά για Διοίκηση"));
        map.put("Εξάμηνο 2", List.of("Προγραμματισμός ΙΙ", "Οικονομική Ανάλυση ΙΙ"));
        map.put("Εξάμηνο 3", List.of("Διοίκηση Επιχειρήσεων", "Στατιστική"));
        map.put("Εξάμηνο 4", List.of("Συστήματα Βάσεων Δεδομένων", "Μάρκετινγκ"));
        map.put("Εξάμηνο 5", List.of("Ανάπτυξη Λογισμικού", "Χρηματοοικονομική"));
        map.put("Εξάμηνο 6", List.of("Διοίκηση Πληροφοριακών Συστημάτων", "Δεοντολογία Πληροφορικής"));
        map.put("Εξάμηνο 7", List.of("Διαχείριση Έργων Πληροφορικής", "Καινοτομία & Επιχειρηματικότητα"));
        map.put("Εξάμηνο 8", List.of("Πτυχιακή Εργασία"));
        return map;
    }

    private String getMapping(String university, String dmstCourse) {
        return switch (university) {
            case "Hasselt University" -> "Hasselt Course: Information Systems";
            case "University of Mannheim" -> "Mannheim Course: Data Management";
            default -> "Δεν υπάρχει καταχωρημένη αντιστοίχιση για αυτό το μάθημα.";
        };
    }

    private String toJsonArray(List<String> list) {
        StringBuilder sb = new StringBuilder("[");
        for (int i = 0; i < list.size(); i++) {
            sb.append("\"").append(list.get(i)).append("\"");
            if (i < list.size() - 1) sb.append(",");
        }
        sb.append("]");
        return sb.toString();
    }

    private String toJsonMap(Map<String, List<String>> map) {
        StringBuilder sb = new StringBuilder("{");
        int i = 0;
        for (Map.Entry<String, List<String>> e : map.entrySet()) {
            sb.append("\"").append(e.getKey()).append("\":").append(toJsonArray(e.getValue()));
            if (i < map.size() - 1) sb.append(",");
            i++;
        }
        sb.append("}");
        return sb.toString();
    }
}
