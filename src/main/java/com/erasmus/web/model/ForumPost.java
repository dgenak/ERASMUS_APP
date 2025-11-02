package com.erasmus.web.model;

import java.util.Date;
import java.util.List;

public class ForumPost {
    private int id;
    private String username;
    private String title;
    private String body;
    private Date timestamp;
    private int likes;
    private int dislikes;
    private List<ForumReply> replies;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getBody() { return body; }
    public void setBody(String body) { this.body = body; }

    public Date getTimestamp() { return timestamp; }
    public void setTimestamp(Date timestamp) { this.timestamp = timestamp; }

    public int getLikes() { return likes; }
    public void setLikes(int likes) { this.likes = likes; }

    public int getDislikes() { return dislikes; }
    public void setDislikes(int dislikes) { this.dislikes = dislikes; }

    public List<ForumReply> getReplies() { return replies; }
    public void setReplies(List<ForumReply> replies) { this.replies = replies; }
}
