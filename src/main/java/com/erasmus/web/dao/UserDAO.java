package com.erasmus.web.dao;

import com.erasmus.web.model.User;
import com.erasmus.web.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;


public class UserDAO {

    /* =========================
       REGISTER
       ========================= */
    public boolean insertUser(User user) {

        String sql = "INSERT INTO users (email, password, firstName, lastName) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFirstName());
            stmt.setString(4, user.getLastName());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /* =========================
       EMAIL EXISTS CHECK
       ========================= */
    public boolean emailExists(String email) {

        String sql = "SELECT 1 FROM users WHERE email = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            return rs.next(); // αν βρεθεί γραμμή → υπάρχει email

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /* =========================
       USER EXISTS CHECK
       ========================= */
    public boolean userExists(String firstName, String lastName, String email) {

        String sql = "SELECT 1 FROM users WHERE firstName = ? AND lastName = ? AND email = ?";

        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);

            ResultSet rs = stmt.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    /* =========================
       LOGIN
       ========================= */
    public User loginUser(String username, String password) {

        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        User user = null;

        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));

                Date sqlDate = rs.getDate("birthDate");
                if (sqlDate != null) {
                    user.setBirthDate(sqlDate.toLocalDate());
                }

                user.setNationality(rs.getString("nationality"));
                user.setGender(rs.getString("gender"));
                user.setStudyCycle(rs.getString("studyCycle"));
                user.setUniversityName(rs.getString("university"));
                user.setDepartment(rs.getString("department"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }



}
