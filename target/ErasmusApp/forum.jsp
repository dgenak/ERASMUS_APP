<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.erasmus.web.model.ForumPost" %>

<!DOCTYPE html>
<html lang="el">
<head>
  <meta charset="UTF-8">
  <title>UniEra+ | Erasmus Forum</title>
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

    main {
      flex: 1;
      max-width: 1000px;
      margin: 2.5rem auto;
      background: #ffffff;
      border-radius: 16px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
      padding: 3rem;
      animation: fadeIn 0.6s ease-in-out;
    }

    h1 {
      text-align: center;
      color: #003366;
      font-size: 2rem;
      margin-bottom: 0.5rem;
    }

    p.subtitle {
      text-align: center;
      color: #666;
      margin-bottom: 2rem;
      font-size: 1rem;
    }

    /* === BUTTONS === */
    .buttons {
      display: flex;
      justify-content: center;
      gap: 15px;
      margin-bottom: 2rem;
    }

    .btn {
      border: none;
      border-radius: 10px;
      cursor: pointer;
      font-weight: 600;
      padding: 12px 22px;
      font-size: 15px;
      transition: all 0.3s ease;
      text-decoration: none;
      color: inherit;
    }

    .btn.primary {
      background: linear-gradient(135deg, #0073e6, #00aaff);
      color: white;
      box-shadow: 0 4px 12px rgba(0, 115, 230, 0.3);
    }

    .btn.secondary {
      background-color: #e6f0ff;
      color: #003366;
      border: 1px solid #99ccff;
    }

    /* === POSTS === */
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
    }

    .no-posts {
      text-align: center;
      color: #555;
      font-size: 1.2rem;
      margin: 3rem 0;
    }
  </style>
</head>

<body>
  <%@ include file="header.jsp" %>

  <main>
    <h1><i class="fa-solid fa-comments"></i> Erasmus Forum</h1>
    <p class="subtitle">Exchange experiences and advice with other students!</p>

    <!-- Main Buttons -->
    <div class="buttons">
      <a href="forum.jsp?action=newPost" class="btn primary">
        <i class="fa-solid fa-plus"></i> Ask a question
      </a>

      <a href="forum.jsp?action=newExperience" class="btn secondary">
        <i class="fa-solid fa-share-nodes"></i> Share experience
      </a>
    </div>

    <!-- Load Posts Button -->
    <div class="buttons">
      <a href="ForumServlet?action=load" class="btn secondary">
        <i class="fa-solid fa-rotate-right"></i> Load All Posts
      </a>
    </div>

    <!-- POSTS SECTION -->
    <%
      List<ForumPost> posts = (List<ForumPost>) request.getAttribute("posts");
      String actionPosts = request.getParameter("action");
    %>

    <div class="posts">
      <%
        if ("load".equals(actionPosts)) {

          if (posts != null && !posts.isEmpty()) {

            for (ForumPost post : posts) {
      %>

        <div class="post">
          <div class="post-header">
            <div class="avatar"><%= post.getUsername().substring(0,1).toUpperCase() %></div>
            <div>
              <h3><%= post.getTitle() %></h3>
              <small>by <strong><%= post.getUsername() %></strong> on <%= post.getTimestamp() %></small>
            </div>
          </div>
          <p><%= post.getBody() %></p>
        </div>

      <%
            }
          } else {
      %>

        <div class="no-posts">
          <i class="fa-solid fa-circle-info" style="font-size: 2rem; color: #0073e6;"></i><br>
          No posts available.
        </div>

      <%
          }
        }
      %>
    </div>

    <!-- NEW POST FORM -->
    <%
      String action = request.getParameter("action");
      boolean showForm = "newPost".equals(action) || "newExperience".equals(action);
    %>

    <div id="newPostForm" style="display:<%= showForm ? "block" : "none" %>;">
      <h3><i class="fa-solid fa-pen-to-square"></i> Create New Post</h3>

      <form id="postForm" action="ForumServlet" method="post">
        <input id="postTitle" name="postTitle" placeholder="Post Title">
        <textarea id="postBody" name="postBody" placeholder="Tell us your experience or ask a question..."></textarea>

        <button type="submit" class="btn primary">
          <i class="fa-solid fa-paper-plane"></i> Submit
        </button>

        <a href="forum.jsp" class="btn secondary">
          <i class="fa-solid fa-xmark"></i> Cancel
        </a>
      </form>
    </div>

    <!-- STATUS ALERTS -->
    <%
      String status = request.getParameter("status");

      if ("success".equals(status)) {
    %>

      <div class="alert success">
        <i class="fa-solid fa-check-circle"></i>
        Your post was submitted!
      </div>

    <% } else if ("error".equals(status)) { %>

      <div class="alert error">
        <i class="fa-solid fa-exclamation-circle"></i>
        Error submitting your post.
      </div>

    <% } %>

  </main>

  <%@ include file="footer.jsp" %>

</body>
</html>
