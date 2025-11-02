package com.erasmus.web.controller;

import org.springframework.web.bind.annotation.*;
import java.util.*;
import com.erasmus.web.model.ForumPost;
import com.erasmus.web.model.ForumReply;

@RestController
@RequestMapping("/api/forumPosts")
@CrossOrigin(origins = "*") // επιτρέπει requests από το JSP frontend
public class ForumController {

    private List<ForumPost> posts = new ArrayList<>();
    private int nextId = 1;

    // Επιστρέφει όλες τις δημοσιεύσεις
    @GetMapping
    public List<ForumPost> getAllPosts() {
        return posts;
    }

    // Δημιουργεί νέα δημοσίευση
    @PostMapping
    public ForumPost createPost(@RequestBody ForumPost post) {
        post.setId(nextId++);
        post.setTimestamp(new Date());
        post.setLikes(0);
        post.setDislikes(0);
        post.setReplies(new ArrayList<>());
        posts.add(post);
        return post;
    }

    // Κάνει like σε δημοσίευση
    @PostMapping("/{id}/like")
    public void likePost(@PathVariable int id) {
        posts.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .ifPresent(p -> p.setLikes(p.getLikes() + 1));
    }

    // Κάνει dislike σε δημοσίευση
    @PostMapping("/{id}/dislike")
    public void dislikePost(@PathVariable int id) {
        posts.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .ifPresent(p -> p.setDislikes(p.getDislikes() + 1));
    }

    // Προσθέτει απάντηση σε δημοσίευση
    @PostMapping("/{id}/reply")
    public void replyToPost(@PathVariable int id, @RequestBody ForumReply reply) {
        posts.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .ifPresent(p -> {
                    reply.setTimestamp(new Date());
                    p.getReplies().add(reply);
                });
    }
}
