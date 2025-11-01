<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="el">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ERASMUS+ | Forum</title>
  <link rel="stylesheet" href="css/style.css">

  <!-- Google Fonts & Font Awesome -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    /* ===== ΒΑΣΙΚΑ ΣΤΥΛ ===== */
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f5f7fa; /* ίδιο με τις άλλες σελίδες */
        color: #1f2a44;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }


    main {
        flex: 1;
        max-width: 900px;
        margin: 2rem auto;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        padding: 40px;
    }


    main:hover {
      box-shadow: 0 8px 30px rgba(0,0,0,0.12);
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

    /* ===== ΚΟΥΜΠΙΑ ===== */
    .buttons {
      display: flex;
      gap: 12px;
      margin-bottom: 25px;
      flex-wrap: wrap;
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

    .btn.primary:hover {
      background-color: #004999;
      transform: translateY(-2px);
    }

    .btn.secondary {
      background-color: #e9eef7;
      color: #003366;
    }

    .btn.secondary:hover {
      background-color: #dbe5f5;
      transform: translateY(-2px);
    }

    /* ===== ΔΗΜΟΣΙΕΥΣΕΙΣ ===== */
    .post {
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 3px 12px rgba(0,0,0,0.07);
      padding: 22px;
      margin-bottom: 25px;
      transition: transform 0.2s ease;
    }

    .post:hover {
      transform: translateY(-3px);
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
      box-shadow: 0 3px 8px rgba(0,0,0,0.15);
    }

    .post-header strong {
      color: #003366;
      font-size: 16px;
    }

    .post-header small {
      color: #888;
      display: block;
      font-size: 13px;
    }

    .post h3 {
      margin: 10px 0;
      color: #002855;
      font-size: 18px;
    }

    .post p {
      color: #444;
      font-size: 15px;
      margin-bottom: 15px;
    }

    .post-footer {
      display: flex;
      align-items: center;
      gap: 15px;
      color: #666;
      font-size: 14px;
    }

    .post-footer i {
      margin-right: 5px;
      color: #555;
      cursor: pointer;
      transition: color 0.2s;
    }

    .post-footer i:hover {
      color: #007bff;
    }

    /* ===== ΝΕΑ ΔΗΜΟΣΙΕΥΣΗ ===== */
    #newPostForm {
      display: none;
      background: #f9fbff;
      border-radius: 12px;
      padding: 25px;
      box-shadow: 0 3px 12px rgba(0,0,0,0.08);
      margin-top: 25px;
    }

    input, textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 12px;
      border-radius: 8px;
      border: 1px solid #ccd4e0;
      font-family: inherit;
    }

    textarea {
      resize: none;
      height: 100px;
    }

    footer {
      text-align: center;
      margin-top: 40px;
      color: #666;
      font-size: 13px;
    }

    /* ===== RESPONSIVE ===== */
    @media (max-width: 768px) {
      main {
        padding: 30px 25px;
      }
      h1 {
        font-size: 24px;
      }
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
      <button class="btn secondary">💬 Μοιράσου Εμπειρία</button>
    </div>

    <div id="forumContainer">
      <p>Φόρτωση δημοσιεύσεων...</p>
    </div>

    <!-- Νέα Δημοσίευση -->
    <div id="newPostForm">
      <h3>Δημιούργησε νέα δημοσίευση</h3>
      <input type="text" id="postTitle" placeholder="Τίτλος">
      <textarea id="postBody" placeholder="Περιεχόμενο..."></textarea>
      <button class="btn primary" onclick="submitPost()">Δημοσίευση</button>
      <button class="btn secondary" onclick="closeNewPostForm()">Ακύρωση</button>
    </div>

    <footer>
      © 2025 Οικονομικό Πανεπιστήμιο Αθηνών - ERASMUS+
    </footer>
  </main>

  <script>
    document.addEventListener("DOMContentLoaded", loadForumPosts);

    async function loadForumPosts() {
      try {
        const res = await fetch("/ErasmusApp/api/forumPosts");
        if (!res.ok) throw new Error("Σφάλμα φόρτωσης δεδομένων");
        const posts = await res.json();

        const container = document.getElementById("forumContainer");
        container.innerHTML = "";

        if (posts.length === 0) {
          container.innerHTML = "<p>Δεν υπάρχουν ακόμα δημοσιεύσεις.</p>";
          return;
        }

        posts.forEach(p => {
          const div = document.createElement("div");
          div.className = "post";

          const dateStr = new Date(p.timestamp).toLocaleDateString("el-GR");
          div.innerHTML = `
            <div class="post-header">
              <div class="avatar">${p.username ? p.username[0].toUpperCase() : "A"}</div>
              <div>
                <strong>${p.username || "Anonymous"}</strong>
                <small>${dateStr}</small>
              </div>
            </div>
            <h3>${p.title || "Χωρίς τίτλο"}</h3>
            <p>${p.body || "Χωρίς περιεχόμενο"}</p>
            <div class="post-footer">
              <i class="fa-regular fa-thumbs-up"></i>0
              <span><i class="fa-solid fa-reply"></i> Απάντηση</span>
            </div>
          `;
          container.appendChild(div);
        });
      } catch (e) {
        document.getElementById("forumContainer").innerHTML = "<p>⚠️ Αποτυχία φόρτωσης δημοσιεύσεων.</p>";
        console.error(e);
      }
    }

    function openNewPostForm() {
      document.getElementById("newPostForm").style.display = "block";
    }

    function closeNewPostForm() {
      document.getElementById("newPostForm").style.display = "none";
    }

    async function submitPost() {
      const title = document.getElementById("postTitle").value.trim();
      const body = document.getElementById("postBody").value.trim();

      if (!title || !body) {
        alert("Παρακαλώ συμπληρώστε όλα τα πεδία.");
        return;
      }

      const post = {
        username: "Anonymous",
        title,
        body,
        timestamp: new Date().toISOString()
      };

      try {
        const res = await fetch("/ErasmusApp/api/forumPosts", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(post)
        });

        if (res.ok) {
          alert("Η δημοσίευση προστέθηκε επιτυχώς!");
          closeNewPostForm();
          loadForumPosts();
        } else {
          alert("Σφάλμα κατά την υποβολή.");
        }
      } catch (e) {
        alert("⚠️ Αποτυχία αποστολής δεδομένων.");
      }
    }
  </script>
</body>
</html>
