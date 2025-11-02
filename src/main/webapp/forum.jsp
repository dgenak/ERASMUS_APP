<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="el">
<head>
  <meta charset="UTF-8">
  <title>ERASMUS+ | Forum</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      color: #1f2a44;
      margin: 0;
      padding: 0;
    }

    main {
      max-width: 900px;
      margin: 2rem auto;
      background: #f0efef;
      border-radius: 12px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.08);
      padding: 40px;
    }

    h1 {
      font-size: 28px;
      color: #003366;
      border-bottom: 3px solid #007bff;
      display: inline-block;
      margin-bottom: 15px;
      padding-bottom: 5px;
    }

    p.subtitle {
      color: #555;
      font-size: 15px;
      margin-bottom: 25px;
    }

    .buttons {
      display: flex;
      gap: 12px;
      margin-bottom: 25px;
    }

    .btn {
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-weight: 500;
      padding: 10px 20px;
      font-size: 15px;
      transition: all 0.3s ease;
    }

    .btn.primary {
      background-color: #0059b3;
      color: #fff;
    }

    .btn.secondary {
      background-color: #e9eef7;
      color: #003366;
    }

    .post {
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 3px 12px rgba(0,0,0,0.07);
      padding: 22px;
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
      width: 48px;
      height: 48px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: bold;
      font-size: 18px;
    }

    .reply {
      background: #f9f9ff;
      padding: 10px 15px;
      margin: 10px 0 0 50px;
      border-left: 3px solid #007bff;
      border-radius: 8px;
    }

    .reply strong { color: #003366; }
    .reply small { color: #888; }

    .reply-form {
      margin-top: 10px;
    }

    .reply-form textarea {
      width: 100%;
      padding: 8px;
      border-radius: 8px;
      border: 1px solid #ccc;
      resize: none;
      font-family: inherit;
    }

    .reply-form button { margin-top: 8px; }

    .post-footer {
      display: flex;
      gap: 15px;
      font-size: 14px;
      color: #666;
    }

    .post-footer i {
      cursor: pointer;
      margin-right: 5px;
    }
  </style>
</head>

<body>
  <%@ include file="header.jsp" %>
  <main>
    <h1>Erasmus Forum</h1>
    <p class="subtitle">Μοιράσου την εμπειρία σου και μάθε από άλλους φοιτητές.</p>

    <div class="buttons">
      <button class="btn primary" onclick="openNewPostForm()">+ Νέα Ερώτηση</button>
      <button class="btn secondary" onclick="openNewPostForm()">💬 Μοιράσου Εμπειρία</button>
    </div>

    <div id="forumContainer">Φόρτωση...</div>

    <div id="newPostForm" style="display:none; margin-top:20px;">
      <h3>Νέα Δημοσίευση</h3>
      <input id="postTitle" placeholder="Τίτλος" style="width:100%;padding:8px;">
      <textarea id="postBody" placeholder="Περιεχόμενο..." style="width:100%;height:100px;margin-top:10px;"></textarea>
      <button class="btn primary" onclick="submitPost()">Δημοσίευση</button>
      <button class="btn secondary" onclick="closeNewPostForm()">Ακύρωση</button>
    </div>
  </main>

  <script>
    async function loadForumPosts() {
      try {
        const res = await fetch('/api/forumPosts');
        const posts = await res.json();
        const container = document.getElementById('forumContainer');
        container.innerHTML = '';

        posts.forEach(p => {
          const repliesHtml = (p.replies || []).map(r => `
            <div class="reply">
              <strong>\${r.username}</strong>
              <small>\${new Date(r.timestamp).toLocaleDateString('el-GR')}</small>
              <p>\${r.body}</p>
            </div>
          `).join('');

          const postHtml = `
            <div class="post">
              <div class="post-header">
                <div class="avatar">\${p.username ? p.username[0].toUpperCase() : 'A'}</div>
                <div>
                  <strong>\${p.username}</strong>
                  <small>\${new Date(p.timestamp).toLocaleDateString('el-GR')}</small>
                </div>
              </div>
              <h3>\${p.title}</h3>
              <p>\${p.body}</p>
              <div class="post-footer">
                <span onclick="likePost(\${p.id})"><i class="fa-regular fa-thumbs-up"></i> \${p.likes}</span>
                <span onclick="dislikePost(\${p.id})"><i class="fa-regular fa-thumbs-down"></i> \${p.dislikes}</span>
                <span onclick="toggleReplyForm(\${p.id})"><i class="fa-solid fa-reply"></i> Απάντηση</span>
              </div>
              <div class="reply-form" id="replyForm-\${p.id}" style="display:none;">
                <textarea id="replyText-\${p.id}" placeholder="Γράψε την απάντησή σου..."></textarea>
                <button class="btn primary" onclick="submitReply(\${p.id})">Αποστολή</button>
              </div>
              \${repliesHtml}
            </div>
          `;

          container.insertAdjacentHTML('beforeend', postHtml);
        });
      } catch (err) {
        console.error('Σφάλμα φόρτωσης:', err);
      }
    }

    function openNewPostForm() {
      document.getElementById('newPostForm').style.display = 'block';
    }

    function closeNewPostForm() {
      document.getElementById('newPostForm').style.display = 'none';
    }

    async function submitPost() {
      const title = document.getElementById('postTitle').value.trim();
      const body = document.getElementById('postBody').value.trim();
      if (!title || !body) {
        alert('Συμπληρώστε όλα τα πεδία');
        return;
      }

      const post = { username: 'Anonymous', title: title, body: body };
      await fetch('/api/forumPosts', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(post)
      });
      closeNewPostForm();
      loadForumPosts();
    }

    async function likePost(id) {
      await fetch(`/api/forumPosts/\${id}/like`, { method: 'POST' });
      loadForumPosts();
    }

    async function dislikePost(id) {
      await fetch(`/api/forumPosts/\${id}/dislike`, { method: 'POST' });
      loadForumPosts();
    }

    function toggleReplyForm(id) {
      const form = document.getElementById(`replyForm-\${id}`);
      form.style.display = (form.style.display === 'none') ? 'block' : 'none';
    }

    async function submitReply(id) {
      const text = document.getElementById(`replyText-\${id}`).value.trim();
      if (!text) {
        alert('Γράψε κάτι');
        return;
      }

      const reply = {
        username: 'Anonymous',
        body: text,
        timestamp: new Date().toISOString()
      };

      await fetch(`/api/forumPosts/\${id}/reply`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(reply)
      });
      loadForumPosts();
    }

    document.addEventListener('DOMContentLoaded', loadForumPosts);
  </script>
</body>
</html>
