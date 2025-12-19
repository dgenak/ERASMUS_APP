package com.erasmus.web.test;

import com.erasmus.web.dao.ForumDAO;
import com.erasmus.web.model.Post;

import java.sql.Date;
import java.util.List;

public class TestForumDAO {

    public static void main(String[] args) {

        System.out.println("Starting ForumDAO test...");

        ForumDAO dao = new ForumDAO();

        try {
            Post testPost = new Post();
            testPost.setUserId(7);                 
            testPost.setUsername("balaskasmarkos");
            testPost.setTitle("DAO TEST POST");
            testPost.setBody("This post was inserted via TestForumDAO.");
            testPost.setPostType("QUESTION");     
            testPost.setTimestamp(new Date(0));
            testPost.setLikes(0);
            testPost.setDislikes(0);

        dao.addPost(testPost);

        System.out.println("✔ Post insertion attempted");
            List<Post> posts = dao.getAllPosts();

            if (posts == null) {
                System.out.println("ERROR: posts list is NULL. DAO did not return anything.");
                return;
            }

            if (posts.isEmpty()) {
                System.out.println("Connected to database, but table is EMPTY (0 posts).");
            } else {
                System.out.println("✅ SUCCESS: Retrieved " + posts.size() + " posts from the database.");
                System.out.println("Here is the first post:");
                Post p = posts.get(0);
                System.out.println("-----------------------------------");
                System.out.println("ID: " + p.getPostId());
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
