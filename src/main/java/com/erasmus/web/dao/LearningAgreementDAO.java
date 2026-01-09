package com.erasmus.web.dao;

import com.erasmus.web.model.LearningAgreement;
import com.erasmus.web.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LearningAgreementDAO {

    public List<LearningAgreement> findByUserId(int userId) {

        List<LearningAgreement> list = new ArrayList<>();

        String sql =
            "SELECT * FROM learning_agreements WHERE owner_user_id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                LearningAgreement la = new LearningAgreement();

                la.setLearningAgreementId(rs.getInt("learning_agreement_id"));
                la.setApplicationId(rs.getInt("application_id"));
                la.setOwnerUserId(rs.getInt("owner_user_id"));
                la.setTitle(rs.getString("title"));

                list.add(la);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
