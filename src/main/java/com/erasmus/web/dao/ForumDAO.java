package com.erasmus.web.dao;

import com.erasmus.web.model.ForumPost;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ForumDAO {

    private static final String JDBC_URL =
            "jdbc:mysql://195.251.249.131:3306/ismgroup29?useSSL=false&serverTimezone=UTC";

    private static final String JDBC_USER = "ismgroup29";
    private static final String JDBC_PASSWORD = "r2m$e9";

    private static final List<ForumPost> posts = new ArrayList<>();

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    public List<ForumPost> getAllPosts() {
        String sql = "SELECT * FROM forum_posts ORDER BY timestamp DESC";
        List<ForumPost> posts = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ForumPost post = new ForumPost();
                post.setId(rs.getInt("id"));
                post.setUsername(rs.getString("username"));
                post.setTitle(rs.getString("title"));
                post.setBody(rs.getString("body"));
                post.setTimestamp(rs.getDate("timestamp"));
                post.setLikes(rs.getInt("likes"));
                post.setDislikes(rs.getInt("dislikes"));
                posts.add(post);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return posts;
    }

    public void addPost(ForumPost post) {
        String sql = "INSERT INTO forum_posts (username, title, body, timestamp, likes, dislikes) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, post.getUsername());
            stmt.setString(2, post.getTitle());
            stmt.setString(3, post.getBody());
            stmt.setDate(4, new java.sql.Date(post.getTimestamp().getTime()));
            stmt.setInt(5, post.getLikes());
            stmt.setInt(6, post.getDislikes());

            stmt.executeUpdate();

            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
