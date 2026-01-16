<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.erasmus.web.model.Post" %>
<%@ page import="com.erasmus.web.model.Reply" %>

<%
    Post post = (Post) request.getAttribute("post");
    List<Reply> replies = (List<Reply>) request.getAttribute("replies");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Question</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    /* === GENERAL === */
    html, body {
      height: 100%;
      margin: 0;
      display: flex;
      flex-direction: column;
      font-family: 'Poppins', sans-serif;
      background: #f4f7fb;
      color: #1f2a44;
    }

    *, *::before, *::after {
      box-sizing: border-box;
    }

    main {
      flex: 1;
      width: 1000px;
      max-width: 1000px;
      min-width: 1000px;
      margin: 2.5rem auto;
      background: #ffffff;
      border-radius: 16px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
      padding: 3rem;
      animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    h1 {
      text-align: center;
      color: #003366;
      font-size: 2rem;
      margin-bottom: 0.5rem;
    }

    .section-divider {
      width: 80px;
      height: 4px;
      background-color: #00c4b4;
      border-radius: 4px;
      margin: 0 auto 2rem auto;
    }

    /* === BUTTONS === */
    .btn {
      border: none;
      border-radius: 10px;
      cursor: pointer;
      font-weight: 600;
      padding: 12px 22px;
      font-size: 15px;
      transition: all 0.3s ease;
      text-decoration: none;
      display: inline-block;
    }

    .btn.primary {
      background: linear-gradient(135deg, #0073e6, #00aaff);
      color: white;
      box-shadow: 0 4px 12px rgba(0, 115, 230, 0.3);
    }

    .btn.primary:hover {
      background: linear-gradient(135deg, #005bb5, #0099e6);
      transform: scale(1.05);
    }

    .btn.secondary {
      background-color: #e6f0ff;
      color: #003366;
      border: 1px solid #99ccff;
    }

    .btn.secondary:hover {
      background-color: #cce0ff;
      transform: scale(1.05);
    }

    /* === POST === */
    .post {
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 3px 15px rgba(0, 0, 0, 0.08);
      padding: 25px;
      margin-bottom: 25px;
    }

    .post-header {
      display: flex;
      align-items: center;
      gap: 15px;
      margin-bottom: 10px;
    }

    .avatar {
      background: linear-gradient(135deg, #0059b3, #66b3ff);
      width: 55px;
      height: 55px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: bold;
      font-size: 18px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
    }

    .post h3 {
      margin: 5px 0;
      color: #003366;
    }

    .post p {
      color: #333;
      line-height: 1.6;
      margin-top: 8px;
    }

    /* === REPLIES === */
    .reply {
      background: #f5f9ff;
      padding: 12px 15px;
      margin: 12px 0 0 55px;
      border-left: 4px solid #007bff;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    .reply strong {
      color: #003366;
    }

    .reply small {
      color: #888;
      font-size: 12px;
    }

    .reply-form textarea {
      width: 100%;
      padding: 10px;
      border-radius: 10px;
      border: 1px solid #ccc;
      resize: none;
      font-family: inherit;
      font-size: 14px;
      margin-top: 30px;
      margin-bottom: 20px;
    }

    /* === RESPONSIVE === */
    @media (max-width: 768px) {
      main {
        max-width: 100%;
        margin: 0;
        border-radius: 0;
        box-shadow: none;
        padding: 1.5rem 1rem;
      }
    }
  </style>
</head>

<body>
<%@ include file="header.jsp" %>

<main>
<div class="container"> 
    <h1> <i class="fa-solid fa-circle-question"></i> Question</h1>
    <div class="section-divider"></div>

<%
  if (post == null) {
%>
    <p>Post not found.</p>
<%
    return;
  }
%>

  <!-- QUESTION -->
  <div class="post">
    <div class="post-header">
        <div class="avatar">
            <%= post.getUsername().substring(0,1).toUpperCase() %>
        </div>
        <div>
            <h3> <%= post.getTitle() %></h3>
            <small>by <strong><%= post.getUsername() %></strong>
            on <%= post.getTimestamp() %></small>
        </div>
    </div> 
    <p><%= post.getBody() %></p>
</div>

  <!-- REPLIES -->
  <h3 style="margin-top:30px;">Replies (<%= replies.size() %>)</h3>

  <% if (replies != null && !replies.isEmpty()) {
       for (Reply r : replies) { %>

    <div class="reply">
      <strong><%= r.getUsername() %></strong><br>
      <%= r.getBody() %><br>
      <small><%= r.getTimestamp() %></small>
    </div>

  <% } } else { %>
    <p>No replies yet.</p>
  <% } %>

  <!-- REPLY FORM -->
    <form action="ReplyServlet" method="post" class="reply-form" id="reply-form-<%= post.getPostId() %>">
    <input type="hidden" name="postId" value="<%= post.getPostId() %>">
    <textarea name="replyBody" placeholder="Write your reply..." required></textarea>

    <button type="submit" class="btn primary">
        <i class="fa-solid fa-paper-plane"></i> Submit Reply
    </button>
  </form>

  <br>

  <a href="forum.jsp" class="btn secondary">
    ← Back to Forum
    </a>

</div>
</main>
<%@ include file="footer.jsp" %>

</body>
</html>
