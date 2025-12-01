package com.erasmus.web.dao;

import com.erasmus.web.model.University;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UniversityDAO {

    private static final String JDBC_URL =
            "jdbc:mysql://195.251.249.131:3306/ismgroup29?useSSL=false&serverTimezone=UTC";

    private static final String JDBC_USER = "ismgroup29";
    private static final String JDBC_PASSWORD = "r2m$e9";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    // ================================================================
    // 1) Get universities by country
    // ================================================================
    public List<University> getUniversitiesByCountry(int countryId) {
        List<University> list = new ArrayList<>();

        String sql =
                "SELECT universityId, universityName, countryId, latitude, longitude " +
                "FROM university WHERE countryId = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, countryId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                University u = new University();
                u.setUniversityId(rs.getInt("universityId"));
                u.setUniversityName(rs.getString("universityName"));
                u.setCountryId(rs.getInt("countryId"));
                u.setLatitude(rs.getDouble("latitude"));
                u.setLongitude(rs.getDouble("longitude"));
                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================================================================
    // 2) Get university by ID
    // ================================================================
    public University getUniversityById(int universityId) {

        String sql =
                "SELECT universityId, universityName, countryId, latitude, longitude " +
                "FROM university WHERE universityId = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, universityId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                University u = new University();
                u.setUniversityId(rs.getInt("universityId"));
                u.setUniversityName(rs.getString("universityName"));
                u.setCountryId(rs.getInt("countryId"));
                u.setLatitude(rs.getDouble("latitude"));
                u.setLongitude(rs.getDouble("longitude"));
                return u;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // ================================================================
    // 3) NEW — Get ALL universities (for map on universities.jsp)
    // ================================================================
    public List<University> getAllUniversities() {
        List<University> list = new ArrayList<>();

        String sql =
                "SELECT universityId, universityName, countryId, latitude, longitude " +
                "FROM university";

        try (Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                University u = new University();
                u.setUniversityId(rs.getInt("universityId"));
                u.setUniversityName(rs.getString("universityName"));
                u.setCountryId(rs.getInt("countryId"));
                u.setLatitude(rs.getDouble("latitude"));
                u.setLongitude(rs.getDouble("longitude"));
                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}

