<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    /* === REPLIES === */
    .reply {
      background: #f5f9ff;
      padding: 12px 15px;
      margin: 12px 0 0 55px;
      border-left: 4px solid #007bff;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    .reply strong { color: #003366; }
    .reply small { color: #888; font-size: 12px; }

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

    #newPostForm input, #newPostForm textarea {
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
    /* === RESPONSIVE FIX FOR MOBILE === */
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
      padding: 15px;
    }
  }


  </style>
</head>

<body>
  <%@ include file="header.jsp" %>

  <main>
    <h1><i class="fa-solid fa-comments"></i> Erasmus Forum</h1>
    <p class="subtitle">Exchange experiences and advice with other students who are participating or have participated in the Erasmus+ program!</p>

    <div class="buttons">
      <button class="btn primary" onclick="openNewPostForm()"><i class="fa-solid fa-plus"></i> Ask a question</button>
      <button class="btn secondary" onclick="openNewPostForm()"><i class="fa-solid fa-share-nodes"></i> Share Experience</button>
    </div>

    <div id="forumContainer">🔄 Loading posts...</div>

    <div id="newPostForm" style="display:none;">
      <h3><i class="fa-solid fa-pen-to-square"></i> Create New Post</h3>
      <input id="postTitle" placeholder="Post Title">
      <textarea id="postBody" placeholder="Tell us about your experience or ask a question..."></textarea>
      <button class="btn primary" onclick="submitPost()"><i class="fa-solid fa-paper-plane"></i> Δημοσίευση</button>
      <button class="btn secondary" onclick="closeNewPostForm()">Ακύρωση</button>
    </div>
  </main>

  <%@ include file="footer.jsp" %>

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
              <small> | \${new Date(r.timestamp).toLocaleDateString('el-GR')}</small>
              <p>\${r.body}</p>
            </div>
          `).join('');

          const postHtml = `
            <div class="post">
              <div class="post-header">
                <div class="avatar">\${p.username ? p.username[0].toUpperCase() : 'A'}</div>
                <div>
                  <strong>\${p.username}</strong><br>
                  <small>\${new Date(p.timestamp).toLocaleString('el-GR')}</small>
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
      window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
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

      const post = { username: 'Anonymous', title, body };
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
      form.style.display = form.style.display === 'none' ? 'block' : 'none';
    }

    async function submitReply(id) {
      const text = document.getElementById(`replyText-\${id}`).value.trim();
      if (!text) {
        alert('Γράψε κάτι');
        return;
      }

      const reply = { username: 'Anonymous', body: text, timestamp: new Date().toISOString() };
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
