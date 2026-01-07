<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.erasmus.web.model.Post" %>
<%@ page import="com.erasmus.web.dao.ReplyDAO" %>
<%@ page import="com.erasmus.web.model.Reply" %>

<!DOCTYPE html>
<html lang="el">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>UniEra+ | Erasmus Forum</title>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    html, body {
      width: 100%;
      margin: 0;
      padding: 0;
    }


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

/* === MAIN CONTENT === */
main {
  flex: 1;
  width: 100%;
  max-width: 1000px;
  margin: 2.5rem auto;
  background: #ffffff;
  border-radius: 16px;
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
  padding: 3rem;
  animation: fadeIn 0.6s ease-in-out;
}

/* === MOBILE FIX === */
@media (max-width: 768px) {
  main {
    max-width: 100%;
    margin: 1.2rem;
    padding: 1.5rem;
    border-radius: 12px;
  }
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
    transform: scale(1.05)
  }

  .section-divider {
  width: 80px;
  height: 4px;
  background-color: #00c4b4;
  border-radius: 4px;
  margin: 0 auto 2rem auto;
}


  /* === POSTS === */
  .post {
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 3px 15px rgba(0, 0, 0, 0.08);
    padding: 25px;
    margin-bottom: 25px;
    transition: transform 0.2s ease, box-shadow 0.3s ease;
  }

  .post:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.12);
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

  .post-footer {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
    gap: 20px;
    margin-top: 15px;
    color: #555;
    font-size: 14px;
  }

  .post-footer span {
    cursor: pointer;
    transition: color 0.2s ease;
  }

  .post-footer span:hover {
    color: #0073e6;
  }

  .post-footer .btn {
    margin-top: 12px;
    flex-basis: 100%;
    align-self: flex-start;
  }

  .no-posts {
    text-align: center;
    color: #555;
    font-size: 1.2rem;
    margin: 3rem 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
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

  .reply-form {
    margin-top: 10px;
    margin-left: 55px;
  }

  .reply-form textarea {
    width: 100%;
    padding: 10px;
    border-radius: 10px;
    border: 1px solid #ccc;
    resize: none;
    font-family: inherit;
    font-size: 14px;
  }

  .reply-actions {
  margin-top: 20px; 
}


  .reply-form button {
    margin-top: 8px;
  }

  /* === NEW POST === */
  #newPostForm {
    background: #f0f7ff;
    border: 1px solid #bcdcff;
    border-radius: 12px;
    padding: 25px;
    margin-top: 30px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.08);
  }

  #newPostForm input,
  #newPostForm textarea {
    width: 100%;
    border-radius: 10px;
    border: 1px solid #ccc;
    padding: 10px;
    font-family: inherit;
    font-size: 15px;
  }

  #newPostForm textarea {
    margin-top: 10px;
    height: 120px;
    resize: none;
  }

  #newPostForm button {
    margin-top: 10px;
  }

  /* === ALERTS === */
  .alert {
    max-width: 1000px;
    margin: 1rem auto;
    padding: 1rem 1.5rem;
    border-radius: 10px;
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 1rem;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    animation: slideDown 0.5s ease-in-out;
  }

  .alert.success {
    background-color: #e6ffed;
    border: 1px solid #66d17f;
    color: #2d7a3e;
  }

  .alert.error {
    background-color: #ffe6e6;
    border: 1px solid #ff4d4d;
    color: #a80000;
  }

  @keyframes slideDown {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
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

    h1 {
      font-size: 1.5rem;
    }

    .buttons {
      flex-direction: column;
      align-items: center;
    }

    .btn {
      width: 90%;
    }

    .post {
      padding: 15px;
    }

    #newPostForm {
      padding: 30px 40px;
    }
  }

</style>

</head>

<body>
  <%@ include file="header.jsp" %>

  <main>
    <h1><i class="fa-solid fa-comments"></i> Erasmus Forum</h1>
    <div class="section-divider"></div>
    <p class="subtitle">Exchange experiences and advice with other students!</p>

    <!-- Main Buttons -->
    <div class="buttons">
      <a href="forum.jsp?action=newQuestion" class="btn primary">
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
      List<Post> posts = (List<Post>) request.getAttribute("posts");
      String actionPosts = request.getParameter("action");
    %>

    <div class="posts">
    <%
      if ("load".equals(actionPosts)) {
        if (posts != null && !posts.isEmpty()) {
          for (Post post : posts) {

            String type = post.getPostType();
            ReplyDAO replyDAO = new ReplyDAO();
            List<Reply> replies = replyDAO.getReplies(post.getPostId());
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

        <div class="post-footer">
          <span><i class="fa-regular fa-thumbs-up"></i> <%= post.getLikes() %></span>
          <span><i class="fa-regular fa-thumbs-down"></i> <%= post.getDislikes() %></span>
        </div>

        <% if ("QUESTION".equalsIgnoreCase(type.trim())) { %>

          <%
            if (replies != null && !replies.isEmpty()) {
              Reply firstReply = replies.get(0);
          %>
            <div class="reply">
              <strong><%= firstReply.getUsername() %></strong><br>
              <%= firstReply.getBody() %><br>
              <small><%= firstReply.getTimestamp() %></small>
            </div>
          <% } %>

          <div class="reply-actions">

            <% if (replies != null && replies.size() > 1) { %>
              <a class="btn primary"
                href="ReplyServlet?postId=<%= post.getPostId() %>">
                View All (<%= replies.size() %>)
              </a>
            <% } %>

            <button class="btn secondary reply-btn"
                    data-post-id="<%= post.getPostId() %>">
              <i class="fa-solid fa-reply"></i> Reply
            </button>
            <form action="ReplyServlet" method="post" class="reply-form" id="reply-form-<%= post.getPostId() %>" style="display:none;">
              <input type="hidden" name="postId" value="<%= post.getPostId() %>">
              <textarea name="replyBody" placeholder="Write your reply..." required></textarea>

              <button type="submit" class="btn primary">
                <i class="fa-solid fa-paper-plane"></i> Submit Reply
              </button>
            </form>
          </div>

        <% } %>

      </div>

    <%
          } // end for
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
      boolean showQuestionForm = "newQuestion".equals(action);
      boolean showExperienceForm = "newExperience".equals(action);
      boolean showForm = showQuestionForm || showExperienceForm;

      String formTitle = showQuestionForm ? "Add New Question" : "Add New Experience ";
      String placeholderTitle = showQuestionForm ? "Question Title" : "Experience Title";
      String placeholderBody = showQuestionForm ? "Ask a question..." : "Share your experience...";
      String postTypeValue = showQuestionForm ? "QUESTION" : "EXPERIENCE";
    %>

    <div id="newPostForm" style="display:<%= showForm ? "block" : "none" %>;">
      <h3><i class="fa-solid fa-pen-to-square"></i> <%= formTitle %> </h3>

      <form id="postForm" action="ForumServlet" method="post">
        <input id="postTitle" name="postTitle" placeholder="<%= placeholderTitle %>">
        <textarea id="postBody" name="postBody" placeholder="<%= placeholderBody %>"></textarea>

        <input type="hidden" name="postType" value="<%= postTypeValue %>" >

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
      String reason = request.getParameter("reason");

      if ("success".equals(status)) {
    %>

      <div class="alert success">
        <i class="fa-solid fa-check-circle"></i>
        Your post was submitted!
      </div>

    <% } else if ("error".equals(status)) { %>
      <div class="alert error">
        <i class="fa-solid fa-exclamation-circle"></i>
        <% if ("INVALID_USER".equals(reason)) { %>
              You must be logged in to share.
        <% } else if ("MISSING_FIELDS".equals(reason)) { %>
              Please fill in all required fields.
        <% } else { %>
              Database Error.
        <% } %>
      </div>

    <% } %>

  </main>

  <%@ include file="footer.jsp" %>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".reply-btn").forEach(btn => {
      btn.addEventListener("click", function () {
        const postId = this.getAttribute("data-post-id");

        const form = document.getElementById("reply-form-" + postId);
        if (form) {
          form.style.display =
            form.style.display === "none" ? "block" : "none";
        }
      });
    });
  });
</script>


</body>
</html>
