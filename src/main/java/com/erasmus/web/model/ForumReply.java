package com.erasmus.web.model;

import java.util.Date;

public class ForumReply {
    private String username;
    private String body;
    private Date timestamp;

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getBody() { return body; }
    public void setBody(String body) { this.body = body; }

    public Date getTimestamp() { return timestamp; }
    public void setTimestamp(Date timestamp) { this.timestamp = timestamp; }
}
