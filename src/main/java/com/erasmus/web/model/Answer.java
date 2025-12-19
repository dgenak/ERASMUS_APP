package com.erasmus.web.model;
import java.util.Date;
import java.util.List;

    public class Answer {
        private int answerId;
        private int questionPostId;

        private int userId;
        private String username;

        private String body;
        private Date timestamp;
        private int likes;
        private int dislikes;
        private List<Post> answers;

        public int getAnswerId() { return answerId; }
        public void setAnswerId(int answerId) { this.answerId = answerId; }

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

        public int getLikes() { return likes; }
        public void setLikes(int likes) { this.likes = likes; }

        public int getDislikes() { return dislikes; }
        public void setDislikes(int dislikes) { this.dislikes = dislikes; }

        public List<Post> getAnswers() { return answers; }
        public void setAnswers(List<Post> answers) { this.answers = answers; }
    }

