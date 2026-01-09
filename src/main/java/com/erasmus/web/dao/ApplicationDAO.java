package com.erasmus.web.dao;

import com.erasmus.web.model.Application;
import com.erasmus.web.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;


public class ApplicationDAO {

    // ======================
    // SAVE (NEW)
    // ======================
    public void save(Application app) {

        String sql =
            "INSERT INTO applications " +
            "(owner_user_id, title, family_name, first_name, dob, sex, nationality, " +
            "place_of_birth, email, current_address, permanent_address, tel1, tel2) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, app.getOwnerUserId());
            ps.setString(2, app.getTitle());
            ps.setString(3, app.getFamilyName());
            ps.setString(4, app.getFirstName());
            if (app.getDob() == null) {
                ps.setNull(5, java.sql.Types.DATE);
            } else {
                ps.setDate(5, java.sql.Date.valueOf(app.getDob()));
            }

            ps.setString(6, app.getSex());
            ps.setString(7, app.getNationality());
            ps.setString(8, app.getPlaceOfBirth());
            ps.setString(9, app.getEmail());
            ps.setString(10, app.getCurrentAddress());
            ps.setString(11, app.getPermanentAddress());
            ps.setString(12, app.getTel1());
            ps.setString(13, app.getTel2());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // ======================
    // UPDATE (EDIT)
    // ======================
    public void update(Application app) {

        String sql =
            "UPDATE applications SET " +
            "title=?, family_name=?, first_name=?, dob=?, sex=?, nationality=?, " +
            "place_of_birth=?, email=?, current_address=?, permanent_address=?, tel1=?, tel2=? " +
            "WHERE application_id=? AND owner_user_id=?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, app.getTitle());
            ps.setString(2, app.getFamilyName());
            ps.setString(3, app.getFirstName());
            if (app.getDob() == null) {
                ps.setNull(4, java.sql.Types.DATE);
            } else {
                ps.setDate(4, java.sql.Date.valueOf(app.getDob()));
            }

            ps.setString(5, app.getSex());
            ps.setString(6, app.getNationality());
            ps.setString(7, app.getPlaceOfBirth());
            ps.setString(8, app.getEmail());
            ps.setString(9, app.getCurrentAddress());
            ps.setString(10, app.getPermanentAddress());
            ps.setString(11, app.getTel1());
            ps.setString(12, app.getTel2());
            ps.setInt(13, app.getApplicationId());
            ps.setInt(14, app.getOwnerUserId());

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(int applicationId, int ownerUserId) {

        String sql =
            "DELETE FROM applications " +
            "WHERE application_id = ? AND owner_user_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, applicationId);
            ps.setInt(2, ownerUserId);

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Application findById(int id) {

        String sql = "SELECT * FROM applications WHERE application_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Application app = new Application();

                app.setApplicationId(rs.getInt("application_id"));
                app.setOwnerUserId(rs.getInt("owner_user_id"));
                app.setTitle(rs.getString("title"));
                app.setFamilyName(rs.getString("family_name"));
                app.setFirstName(rs.getString("first_name"));
                app.setDob(
                    rs.getDate("dob") != null
                        ? rs.getDate("dob").toLocalDate()
                        : null
                );
                app.setSex(rs.getString("sex"));
                app.setNationality(rs.getString("nationality"));
                app.setPlaceOfBirth(rs.getString("place_of_birth"));
                app.setEmail(rs.getString("email"));
                app.setCurrentAddress(rs.getString("current_address"));
                app.setPermanentAddress(rs.getString("permanent_address"));
                app.setTel1(rs.getString("tel1"));
                app.setTel2(rs.getString("tel2"));

                return app;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Application> findByUserId(int userId) {

        List<Application> list = new ArrayList<>();

        String sql = "SELECT * FROM applications WHERE owner_user_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Application app = new Application();

                app.setApplicationId(rs.getInt("application_id"));
                app.setOwnerUserId(rs.getInt("owner_user_id"));
                app.setTitle(rs.getString("title"));
                app.setFirstName(rs.getString("first_name"));
                app.setFamilyName(rs.getString("family_name"));

                list.add(app);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }



}
