package com.erasmus.web.dao;

import com.erasmus.web.model.University;
import java.util.*;

//Database imports 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.erasmus.web.controller.DatabaseConnection;

public class UniversityDAO {

    private static final List<University> universities = new ArrayList<>();

    static {
        universities.add(new University(1, "University of Vienna", "Αυστρία", "Βιέννη", "Διοικητικής Επιστήμης και Τεχνολογίας", "Ένα από τα παλαιότερα πανεπιστήμια της Ευρώπης."));
        universities.add(new University(2, "University of Bologna", "Ιταλία", "Μπολόνια", "Διοικητικής Επιστήμης και Τεχνολογίας", "Γνωστό για το πρόγραμμα Erasmus."));
        universities.add(new University(3, "University of Barcelona", "Ισπανία", "Βαρκελώνη", "Διοικητικής Επιστήμης και Τεχνολογίας", "Εξαιρετική εμπειρία φοιτητικής ζωής."));
    }

    public Map<String, List<String>> getUniversitiesByDepartment(String department) {
        Map<String, List<String>> result = new HashMap<>();
        for (University u : universities) {
            if (u.getDepartment().equalsIgnoreCase(department)) {
                result.computeIfAbsent(u.getCountry(), k -> new ArrayList<>()).add(u.getName());
            }
        }
        return result;
    }

    public University getUniversityInfo(String name) {
        for (University u : universities) {
            if (u.getName().equalsIgnoreCase(name)) {
                return u;
            }
        }
        return null;
    }
}
