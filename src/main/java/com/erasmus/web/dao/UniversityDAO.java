package com.erasmus.web.dao;

import com.erasmus.web.model.University;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                "SELECT universityId, universityName, countryId, latitude, longitude, image_url " +
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
                u.setImageUrl(rs.getString("image_url")); // 👈 ΝΕΟ
                list.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================================================================
    // 2) Get university by ID
    // ================================================================
    public University getUniversityById(int universityId) {

        String sql =
                "SELECT universityId, universityName, countryId, latitude, longitude, image_url " +
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
                u.setImageUrl(rs.getString("image_url")); // 👈 ΝΕΟ
                return u;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // ================================================================
    // 3) Get ALL universities
    // ================================================================
    public List<University> getAllUniversities() {

        List<University> list = new ArrayList<>();

        String sql =
                "SELECT universityId, universityName, countryId, latitude, longitude, image_url " +
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
                u.setImageUrl(rs.getString("image_url")); // 👈 ΝΕΟ
                list.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
