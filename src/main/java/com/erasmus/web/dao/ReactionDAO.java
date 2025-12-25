package com.erasmus.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReactionDAO {
    
    private static final String JDBC_URL =
            "jdbc:mysql://195.251.249.131:3306/ismgroup29?useSSL=false&serverTimezone=UTC";

    private static final String JDBC_USER = "ismgroup29";
    private static final String JDBC_PASSWORD = "r2m$e9";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    public boolean setReaction(int postId, int userId, String reaction) {
        String sql = "INSERT INTO post_reactions (postId, userId, reaction) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE reaction = VALUES(reaction)";
        
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, postId);
            stmt.setInt(2, userId);
            stmt.setString(3, reaction);

            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean removeReaction(int postId, int userId) {
        String sql = "DELETE FROM post_reactions WHERE postId = ? AND userId = ?";
        
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, postId);
            stmt.setInt(2, userId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getReaction(int postId, int userId) {
        String sql = "SELECT reaction FROM post_reactions WHERE postId = ? AND userId = ?";

        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, postId);
            stmt.setInt(2, userId);
            
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getString(1);
            } else {
                return null;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int countReaction(int postId, String reaction) {
        String sql = "SELECT COUNT(*) FROM post_reactions WHERE postId = ? AND reaction = ?";
        
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setInt(1, postId);
            stmt.setString(2, reaction);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }

    }

}
