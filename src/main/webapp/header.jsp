<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="global-header">
  <div class="header-wrapper">
    <!-- ΛΟΓΟΤΥΠΟ -->
    <div class="logo-area">
      <div class="logo-circle">EU</div>
      <div class="logo-text">
        <h1>UniEra +</h1>
        <span>Οικονομικό Πανεπιστήμιο Αθηνών</span>
      </div>
    </div>


    <!-- ΜΕΝΟΥ ΠΛΟΗΓΗΣΗΣ -->
    <nav class="main-nav">
      <ul>
        <li><a href="index.jsp"><i class="fas fa-home"></i> HOME</a></li>
        <li><a href="universities.jsp"><i class="fas fa-university"></i> UNIVERSITIES</a></li>
        <li><a href="forum.jsp"><i class="fas fa-comments"></i> FORUM</a></li>
        <li><a href="applications.jsp"><i class="fas fa-file-alt"></i> APPLICATIONS</a></li>
      </ul>

      <!-- ✅ ΚΟΥΜΠΙ ΜΕΝΟΥ μέσα στο flex -->
      <button class="menu-button" id="menuButton">
        <i class="fas fa-bars"></i> MENU
      </button>
    </nav>

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
    background-color: rgb(116, 238, 222);
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

  .logo-circle:hover {
    transform: scale(1.08);
  }

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

    /* === NAVIGATION === */
    .main-nav {
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      margin-top: 0.8rem;
      padding: 0 3rem;
      gap: 50px;
    }

    .main-nav ul {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 40px;
      list-style: none;
      margin: 0;
      padding: 0;
    }

    /* === LINKS === */
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

    /* === ΚΟΥΜΠΙ ΜΕΝΟΥ === */
    .menu-button {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;

      height: 38px;
      width: 100px;
      background: #f5f7fa;
      color: #003366;
      border: none;
      border-radius: 8px;
      font-weight: 600;
      font-size: 0.9rem;
      line-height: 1;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
      flex-shrink: 0;
    }

    .menu-button:hover {
      background: #e0ecff;
      color: #002855;
      transform: scale(1.05);
    }

    .menu-button i {
      font-size: 0.9rem;
    }


  /* === SIDEBAR === */
  .sidebar {
    position: fixed;
    top: 0;
    right: -340px;
    width: 300px;
    height: 100%;
    background: #fff;
    box-shadow: -3px 0 15px rgba(0,0,0,0.2);
    transition: right 0.4s ease;
    z-index: 2000;
    display: flex;
    flex-direction: column;
    padding: 20px;
  }

  .sidebar.active {
    right: 0;
  }

  .sidebar-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #003366;
    color: white;
    padding: 10px 15px;
    border-radius: 8px;
  }

  .sidebar-close {
    background: none;
    border: none;
    color: white;
    font-size: 1.5rem;
    cursor: pointer;
  }

  .sidebar-content {
    margin-top: 20px;
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .sidebar-content a {
    display: flex;
    align-items: center;
    gap: 10px;
    background: #f5f7fa;
    color: #333;
    padding: 10px 12px;
    border-radius: 8px;
    text-decoration: none;
    transition: all 0.3s ease;
  }

  .sidebar-content a:hover {
    background: #e0ecff;
    color: #003366;
  }

  .main-nav {
    background: transparent !important;
    box-shadow: none !important;
    border: none !important;
  }


  /* === RESPONSIVE === */
  @media (max-width: 900px) {
    .main-nav ul {
      flex-direction: column;
      gap: 10px;
    }

    .main-nav a {
      justify-content: center;
      width: 100%;
    }
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
  <script>
    document.addEventListener("DOMContentLoaded", function() {
      var sidebar = document.getElementById("sidebar");
      var menuButton = document.getElementById("menuButton");
      var closeSidebar = document.getElementById("closeSidebar");

      menuButton.addEventListener("click", function() {
        sidebar.classList.add("active");
      });
      closeSidebar.addEventListener("click", function() {
        sidebar.classList.remove("active");
      });
    });
  </script>


</header>
<!-- SIDEBAR -->
<div class="sidebar" id="sidebar">
  <div class="sidebar-header">
    <h3>Μενού Χρήστη</h3>
    <button class="sidebar-close" id="closeSidebar">&times;</button>
  </div>

  <div class="sidebar-content">
    <a href="#"><i class="fas fa-user"></i> Το προφίλ μου</a>
    <a href="#"><i class="fas fa-file-alt"></i> Οι δηλώσεις μου</a>
    <a href="#"><i class="fas fa-cog"></i> Ρυθμίσεις</a>
    <a href="#"><i class="fas fa-sign-out-alt"></i> Αποσύνδεση</a>
  </div>
</div>
