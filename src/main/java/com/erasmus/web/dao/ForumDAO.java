package com.erasmus.web.dao;

import com.erasmus.web.model.ForumPost;
import java.util.*;

public class ForumDAO {

    private static final List<ForumPost> posts = new ArrayList<>();
    private static int idCounter = 1;

    static {
        ForumPost p1 = new ForumPost();
        p1.setId(idCounter++);
        p1.setUsername("Maria");
        p1.setTitle("Εμπειρία στη Βαρκελώνη");
        p1.setBody("Πέρασα υπέροχα στο Universitat de Barcelona! Πολύ ζωντανή πόλη και καλό πρόγραμμα Erasmus.");
        p1.setTimestamp(new Date());
        posts.add(p1);

        ForumPost p2 = new ForumPost();
        p2.setId(idCounter++);
        p2.setUsername("Nikos");
        p2.setTitle("Πανεπιστήμιο της Βιέννης");
        p2.setBody("Πολύ καλή εμπειρία, αλλά κάνει κρύο τον χειμώνα!");
        p2.setTimestamp(new Date());
        posts.add(p2);
    }

    public List<ForumPost> getAllPosts() {
        return new ArrayList<>(posts);
    }

    public void addPost(ForumPost post) {
        post.setId(idCounter++);
        post.setTimestamp(new Date());
        posts.add(post);
    }
}
