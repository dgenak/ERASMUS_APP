package com.erasmus.web.dao;

import com.erasmus.web.model.Post;

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

    private static final List<Post> posts = new ArrayList<>();

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    public List<Post> getAllPosts() {
        String sql = "SELECT * FROM posts ORDER BY timestamp DESC";
        List<Post> posts = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Post post = new Post();
                post.setPostId(rs.getInt("postId"));
                post.setUserId(rs.getInt("userId"));
                post.setUsername(rs.getString("username"));
                post.setTitle(rs.getString("title"));
                post.setBody(rs.getString("body"));
                post.setTimestamp(rs.getDate("timestamp"));
                post.setPostType(rs.getString("post_type"));
                post.setLikes(rs.getInt("likes"));
                post.setDislikes(rs.getInt("dislikes"));
                posts.add(post);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }

    public boolean addPost(Post post) {
        String sql = "INSERT INTO posts (userId, username, title, body, post_type, timestamp, likes, dislikes) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, post.getUserId());
            stmt.setString(2, post.getUsername());
            stmt.setString(3, post.getTitle());
            stmt.setString(4, post.getBody());
            stmt.setString(5, post.getPostType());
            stmt.setDate(6, new java.sql.Date(post.getTimestamp().getTime()));
            stmt.setInt(7, post.getLikes());
            stmt.setInt(8, post.getDislikes());

            int rows = stmt.executeUpdate();

            stmt.close();
            conn.close();
            posts.add(post);

            return rows == 1;

        } catch (SQLException e) {
            if (e.getErrorCode() == 1452) {
                throw new RuntimeException("INVALID_USER");
            }

            if (e.getErrorCode() == 1048) {
                throw new RuntimeException("MISSING_FIELDS");
            }

            throw new RuntimeException("DB_ERROR");
        }

    }
}
