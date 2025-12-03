package com.erasmus.web.dao;

import com.erasmus.web.model.CourseDet;
import com.erasmus.web.model.CourseExternal;
import com.erasmus.web.util.DatabaseConnection;

import java.sql.*;
import java.util.*;

public class CourseDetDAO {

    private static final String JDBC_URL =
            "jdbc:mysql://195.251.249.131:3306/ismgroup29?useSSL=false&serverTimezone=UTC";
    private static final String JDBC_USER = "ismgroup29";
    private static final String JDBC_PASSWORD = "r2m$e9";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

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

    // 🔥 ΝΕΟ — Χρειαζόταν για την σελίδα επιλογής μαθημάτων
    public Map<Integer, List<CourseDet>> getCoursesByAllSemesters() {
        Map<Integer, List<CourseDet>> map = new HashMap<>();

        for (int sem = 1; sem <= 7; sem++) {
            map.put(sem, getCoursesBySemester(sem));
        }

        return map;
    }

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

    public List<CourseExternal> getEquivalentCourses(int detId, int uniId) {
        List<CourseExternal> list = new ArrayList<>();

        try (Connection con = getConnection()) {

            String sql1 = "SELECT courseCode FROM courses_det WHERE id = ?";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setInt(1, detId);
            ResultSet rs1 = ps1.executeQuery();

            if (!rs1.next()) return list;

            String targetCode = rs1.getString("courseCode");

            String sql2 = "SELECT * FROM courses_f_uni WHERE courseCode = ? AND uni_id = ?";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, targetCode);
            ps2.setInt(2, uniId);
            ResultSet rs2 = ps2.executeQuery();

            while (rs2.next()) {
                CourseExternal ce = new CourseExternal(
                        rs2.getInt("course_id"),
                        rs2.getString("course_name"),
                        rs2.getString("courseCode"),
                        rs2.getDouble("ects")
                );
                list.add(ce);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean hasEquivalence(int detId, int uniId) {
        boolean found = false;

        try (Connection con = getConnection()) {

            String sql1 = "SELECT courseCode FROM courses_det WHERE id = ?";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setInt(1, detId);
            ResultSet rs1 = ps1.executeQuery();

            if (!rs1.next()) return false;

            String courseCode = rs1.getString("courseCode");

            String sql2 = "SELECT COUNT(*) AS cnt FROM courses_f_uni WHERE uni_id = ? AND courseCode = ?";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setInt(1, uniId);
            ps2.setString(2, courseCode);

            ResultSet rs2 = ps2.executeQuery();

            if (rs2.next()) {
                found = (rs2.getInt("cnt") > 0);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return found;
    }

    public List<CourseDet> getAllCourses() {
        List<CourseDet> list = new ArrayList<>();
        String sql = "SELECT * FROM courses_det ORDER BY semester, courseName";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(extractCourse(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

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
