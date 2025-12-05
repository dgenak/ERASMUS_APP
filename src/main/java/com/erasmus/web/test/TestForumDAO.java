package com.erasmus.web.test;

import com.erasmus.web.dao.ForumDAO;
import com.erasmus.web.model.ForumPost;

import java.util.List;

public class TestForumDAO {

    public static void main(String[] args) {

        System.out.println("⚡ Starting ForumDAO test...");

        ForumDAO dao = new ForumDAO();

        try {
            List<ForumPost> posts = dao.getAllPosts();

            if (posts == null) {
                System.out.println("❌ ERROR: posts list is NULL. DAO did not return anything.");
                return;
            }

            if (posts.isEmpty()) {
                System.out.println("⚠ Connected to database, but table is EMPTY (0 posts).");
            } else {
                System.out.println("✅ SUCCESS: Retrieved " + posts.size() + " posts from the database.");
                System.out.println("Here is the first post:");
                ForumPost p = posts.get(0);
                System.out.println("-----------------------------------");
                System.out.println("ID: " + p.getId());
                System.out.println("Username: " + p.getUsername());
                System.out.println("Title: " + p.getTitle());
                System.out.println("Body: " + p.getBody());
                System.out.println("Timestamp: " + p.getTimestamp());
                System.out.println("-----------------------------------");
            }

        } catch (Exception e) {
            System.out.println("❌ ERROR: Unable to retrieve posts.");
            e.printStackTrace();
        }
    }
}
