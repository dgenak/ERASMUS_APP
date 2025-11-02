<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="global-header">
  <div class="header-wrapper">
    <!-- ΛΟΓΟΤΥΠΟ -->
    <div class="logo-area">
      <div class="logo-circle">EU</div>
      <div class="logo-text">
        <h1>Erasmus+</h1>
        <span>Οικονομικό Πανεπιστήμιο Αθηνών</span>
      </div>
    </div>

```
<!-- ΜΕΝΟΥ ΠΛΟΗΓΗΣΗΣ -->
<nav class="main-nav">
  <ul>
    <li><a href="index.jsp"><i class="fas fa-home"></i> Αρχική</a></li>
    <li><a href="universities.jsp"><i class="fas fa-university"></i> Αντιστοίχιση Μαθημάτων</a></li>
    <li><a href="forum.jsp"><i class="fas fa-comments"></i> Forum</a></li>
    <li><a href="applications.jsp"><i class="fas fa-file-alt"></i> Αιτήσεις</a></li>
    <li><a href="info.jsp"><i class="fas fa-info-circle"></i> Πληροφορίες</a></li>
  </ul>
</nav>
```

  </div>

  <style>
    /* === HEADER === */
    .global-header {
      width: 100%;
      background: linear-gradient(90deg, #003366, #0059b3, #0073e6);
      color: white;
      font-family: 'Poppins', sans-serif;
      box-shadow: 0 5px 25px rgba(0, 0, 0, 0.25);
      position: relative;
      z-index: 1000;
      padding: 1.5rem 0 1.8rem;
    }

    .header-wrapper {
      max-width: 1300px;
      margin: 0 auto;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 0 2rem;
    }

    /* === ΛΟΓΟΤΥΠΟ === */
    .logo-area {
      display: flex;
      align-items: center;
      gap: 14px;
      margin-bottom: 0.8rem;
    }

    .logo-circle {
      background-color: white;
      color: #003366;
      width: 58px;
      height: 58px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 700;
      font-size: 1.5rem;
      box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
      transition: transform 0.3s ease;
    }

    .logo-circle:hover { transform: scale(1.08); }

    .logo-text h1 {
      font-size: 1.8rem;
      font-weight: 700;
      margin: 0;
      color: #fff;
      text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
    }

    .logo-text span {
      display: block;
      font-size: 0.9rem;
      color: #cce0ff;
      margin-top: 2px;
    }

    /* === ΜΕΝΟΥ === */
    .main-nav {
      margin-top: 0.8rem;
    }

    .main-nav ul {
      list-style: none;
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 40px;
      margin: 0;
      padding: 0;
      background: transparent; /* αφαιρεί το λευκό */
    }

    .main-nav a {
      text-decoration: none;
      font-weight: 500;
      font-size: 1rem;
      padding: 10px 18px;
      border-radius: 25px;
      display: flex;
      align-items: center;
      gap: 8px;
      color: white;
      transition: all 0.3s ease;
      background: transparent;
    }

    .main-nav a:hover {
      background: rgba(255, 255, 255, 0.15);
      transform: translateY(-2px);
      box-shadow: 0 4px 10px rgba(255, 255, 255, 0.15);
    }

    .main-nav a.active {
      background: white;
      color: #003366;
      font-weight: 600;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25);
    }

    @media (max-width: 900px) {
      .main-nav ul { flex-direction: column; gap: 10px; }
      .main-nav a { justify-content: center; width: 100%; }
    }
  </style>

  <script>
    document.addEventListener("DOMContentLoaded", () => {
      const current = location.pathname.split("/").pop();
      document.querySelectorAll(".main-nav a").forEach(link => {
        if (link.getAttribute("href") === current) {
          link.classList.add("active");
        }
      });
    });
  </script>

</header>
