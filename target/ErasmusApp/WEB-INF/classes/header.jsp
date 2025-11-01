<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ΕΝΙΑΙΟ HEADER ΓΙΑ ΟΛΕΣ ΤΙΣ ΣΕΛΙΔΕΣ -->
<header class="global-header">
  <div class="header-top">
    <div class="header-logo">
      <div class="logo-circle">EU</div>
      <h1 class="header-title">Erasmus+</h1>
    </div>
  </div>

  <nav class="navbar">
    <ul class="nav-links">
      <li><a href="index.jsp">Αρχική</a></li>
      <li><a href="universities.jsp">Αντιστοίχιση Μαθημάτων</a></li>
      <li><a href="forum.jsp">Forum</a></li>
      <li><a href="applications.jsp">Αιτήσεις</a></li>
    </ul>
    <button class="menu-btn" onclick="toggleMenu()"><i class="fas fa-bars"></i> Μενού</button>
  </nav>

  <style>
    /* === ΕΝΙΑΙΟ HEADER ΓΙΑ ΟΛΕΣ ΤΙΣ ΣΕΛΙΔΕΣ === */
    .global-header {
      width: 100%;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      position: relative;
      z-index: 999;
    }

    /* ΠΑΝΩ ΜΠΑΡΑ */
    .header-top {
      background: linear-gradient(90deg, #003366, #0066cc);
      display: flex;
      align-items: center;
      justify-content: flex-start;
      padding: 0.8rem 2rem;
      box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
    }

    .header-logo {
      display: flex;
      align-items: center;
      gap: 15px;
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
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      flex-shrink: 0;
    }

    .header-title {
      color: white;
      font-weight: 700;
      font-size: 1.9rem;
      letter-spacing: 0.5px;
      text-shadow: 0 1px 2px rgba(0, 0, 0, 0.15);
      margin: 0;
      padding: 0;
    }

    /* === NAVIGATION === */
    .navbar {
      background-color: #f8f9fb;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0.7rem 2rem;
      border-bottom: 1px solid #dee2e6;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    }

    .nav-links {
      list-style: none;
      display: flex;
      gap: 35px;
      margin: 0;
      padding: 0;
    }

    .nav-links a {
      text-decoration: none;
      color: #003366;
      font-weight: 500;
      font-size: 16px;
      position: relative;
      transition: color 0.3s;
    }

    .nav-links a:hover,
    .nav-links a.active {
      color: #0059b3;
    }

    .nav-links a.active::after {
      content: '';
      position: absolute;
      left: 0;
      bottom: -5px;
      width: 100%;
      height: 3px;
      background: linear-gradient(90deg, #0059b3, #66b3ff);
      border-radius: 2px;
    }

    /* === ΚΟΥΜΠΙ ΜΕΝΟΥ (ΚΙΝΗΤΑ) === */
    .menu-btn {
      background-color: #0059b3;
      border: none;
      border-radius: 25px;
      padding: 8px 18px;
      color: white;
      font-weight: 500;
      cursor: pointer;
      display: none;
      align-items: center;
      gap: 6px;
    }

    .menu-btn:hover {
      background-color: #004999;
    }

    @media (max-width: 900px) {
      .nav-links {
        display: none;
        flex-direction: column;
        background: #003366;
        width: 100%;
        padding: 10px 0;
        text-align: center;
      }

      .nav-links.show {
        display: flex;
      }

      .nav-links a {
        color: white;
        padding: 12px 0;
      }

      .menu-btn {
        display: flex;
      }
    }
  </style>

  <script>
    // === Toggle Menu για κινητά ===
    function toggleMenu() {
      document.querySelector(".nav-links").classList.toggle("show");
    }

    // === Αυτόματο highlight ενεργής σελίδας ===
    document.addEventListener("DOMContentLoaded", () => {
      const current = location.pathname.split("/").pop();
      document.querySelectorAll(".nav-links a").forEach(a => {
        if (a.getAttribute("href") === current) {
          a.classList.add("active");
        }
      });
    });
  </script>
</header>
