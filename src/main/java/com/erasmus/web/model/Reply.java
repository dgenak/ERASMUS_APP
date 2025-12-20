package com.erasmus.web.model;
import java.util.Date;
import java.util.List;

    public class Reply {
        private int replyId;
        private int questionPostId;

        private int userId;
        private String username;

        private String body;
        private Date timestamp;
        private List<Reply> replies;

        public int getReplyId() { return replyId; }
        public void setReplyId(int replyId) { this.replyId = replyId; }

        public int getQuestionId() { return questionPostId; }
        public void setQuestionId(int questionId) { this.questionPostId = questionId; }

        public int getUserId() { return userId; }
        public void setUserId(int userId) { this.userId = userId; }

        public String getUsername() { return username; }
        public void setUsername(String username) { this.username = username; }

        public String getBody() { return body; }
        public void setBody(String body) { this.body = body; }

        public Date getTimestamp() { return timestamp; }
        public void setTimestamp(Date timestamp) { this.timestamp = timestamp; }

        public List<Reply> getReplies() { return replies; }
        public void setReplies (List<Reply> replies) { this.replies = replies; }
    }

