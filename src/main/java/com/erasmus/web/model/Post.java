package com.erasmus.web.model;

import java.util.Date;
import java.util.List;

public class Post {
    private int postId;
    private int userId;
    private String username;
    private String title;
    private String body;
    private Date timestamp;
    private String postType;
    private int likes;
    private int dislikes;
    private List<Post> posts;

    public int getPostId() { return postId; }
    public void setPostId(int postId) { this.postId = postId; }

    public int getUserId() { return userId; }
    public void setUserId (int userId) { this.userId = userId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username;}

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getBody() { return body; }
    public void setBody(String body) { this.body = body; }

    public Date getTimestamp() { return timestamp; }
    public void setTimestamp(Date timestamp) { this.timestamp = timestamp; }

    public String getPostType() { return postType; }
    public void setPostType(String postType) { this.postType = postType; }
    public int getLikes() { return likes; }
    public void setLikes(int likes) { this.likes = likes; }

    public int getDislikes() { return dislikes; }
    public void setDislikes(int dislikes) { this.dislikes = dislikes; }

    public List<Post> getPosts() { return posts;}
    public void setPosts(List<Post> posts) { this.posts = posts; }
}
