package com.erasmus.web.dao;

import com.erasmus.web.model.CourseDet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDetDAO {

    private static final String JDBC_URL =
        "jdbc:mysql://195.251.249.131:3306/ismgroup29?useSSL=false&serverTimezone=UTC";
    private static final String JDBC_USER = "ismgroup29";
    private static final String JDBC_PASSWORD = "r2m$e9";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    // ============================
    // GET COURSES BY SEMESTER (1–5)
    // ============================
    public List<CourseDet> getCoursesBySemester(int semester) {
        List<CourseDet> list = new ArrayList<>();
        String sql = "SELECT * FROM courses_det WHERE semester = ? ORDER BY id";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, semester);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(extractCourse(rs));
            }

        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }

    // ============================
    // GET ALL ORIENTATIONS
    // ============================
    public List<String> getAllOrientations() {
        List<String> list = new ArrayList<>();
        String sql = "SELECT DISTINCT orientation FROM courses_det WHERE orientation IS NOT NULL ORDER BY orientation";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(rs.getString("orientation"));
            }

        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }

    // =====================================================
    // GET MANDATORY/ ELECTIVE COURSES by ORIENTATION & SEMESTER
    // *** THIS FIXES THE BUG IN SEMESTERS 6 AND 7 ***
    // =====================================================
    public List<CourseDet> getMandatoryForOrientationAndSemester(String orientation, int semester) {
        return getCoursesByOrientationAndSemester(orientation, semester, true);
    }

    public List<CourseDet> getElectivesForOrientationAndSemester(String orientation, int semester) {
        return getCoursesByOrientationAndSemester(orientation, semester, false);
    }

    public List<CourseDet> getCoursesByOrientationAndSemester(String orientation, int semester, boolean mandatory) {
        List<CourseDet> list = new ArrayList<>();

        String sql =
            "SELECT * FROM courses_det " +
            "WHERE orientation = ? AND semester = ? AND mandatory = ? " +
            "ORDER BY courseName";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, orientation);
            stmt.setInt(2, semester);
            stmt.setBoolean(3, mandatory);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(extractCourse(rs));
            }

        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }

    // ============================================
    // CORE MANDATORY WITHOUT ORIENTATION (per sem)
    // ============================================
    public List<CourseDet> getMandatoryWithoutOrientation(int semester) {
        List<CourseDet> list = new ArrayList<>();

        String sql =
            "SELECT * FROM courses_det " +
            "WHERE semester = ? AND mandatory = 1 " +
            "AND (orientation IS NULL OR orientation = '') " +
            "ORDER BY courseName";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, semester);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(extractCourse(rs));
            }

        } catch (Exception e) { e.printStackTrace(); }

        return list;
    }

    // ============================
    // Helper – extract CourseDet
    // ============================
    private CourseDet extractCourse(ResultSet rs) throws SQLException {
        return new CourseDet(
            rs.getInt("id"),
            rs.getInt("semester"),
            rs.getString("courseName"),
            rs.getString("courseCode"),
            rs.getString("period"),
            rs.getInt("ects"),
            rs.getBoolean("mandatory")
        );
    }
}
