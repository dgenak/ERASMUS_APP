package com.erasmus.web.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.erasmus.web.model.Reply;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ReplyDAO {
    private static final String JDBC_URL =
            "jdbc:mysql://195.251.249.131:3306/ismgroup29?useSSL=false&serverTimezone=UTC";

    private static final String JDBC_USER = "ismgroup29";
    private static final String JDBC_PASSWORD = "r2m$e9";
    
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    public List<Reply> getReplies (int postId) {
        List<Reply> replies = new ArrayList<>();
        String sql = "SELECT * FROM replies WHERE postId = ?";

        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, postId);
            ResultSet rs = stmt.executeQuery();

            while(rs.next()) {
                Reply r = new Reply();
                r.setReplyId(rs.getInt("replyId"));
                r.setQuestionId(rs.getInt("postId"));
                r.setUserId(rs.getInt("userId"));
                r.setUsername(rs.getString("username"));
                r.setBody(rs.getString("body"));
                r.setTimestamp(rs.getTimestamp("timestamp"));

                replies.add(r);

            }

            rs.close();
            stmt.close();
            conn.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return replies;

    }

    public boolean addReply (Reply reply) {
        String sql = "INSERT INTO replies (postId, userId, username, body,) VALUES (?, ?, ?, ?,)";

        try{
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1,reply.getQuestionId());
            stmt.setInt(2,reply.getUserId());
            stmt.setString(3,reply.getUsername());
            stmt.setString(4,reply.getBody());

            return stmt.executeUpdate() == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
}
