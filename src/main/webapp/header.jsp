<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="global-header">
  <div class="header-wrapper">
    <!-- ΛΟΓΟΤΥΠΟ -->
    <div class="logo-area">
      <div class="logo-circle">EU</div>
      <div class="logo-text">
        <h1>UniEra +</h1>
        <span>AUEB - DMST</span>
      </div>
    </div>


    <div class="auth-section">
      <!-- User info (hidden by default) -->
      <div class="user-info-header" id="userInfoHeader" style="display: none;">
        <span>Καλώς ήρθες, <span id="userNameHeader"></span>!</span>
        <button class="logout-btn" onclick="logout()">Αποσύνδεση</button>
      </div>
      
      <!-- Login/Signup buttons -->
      <div class="auth-buttons-header" id="authButtonsHeader">
        <button type='button' class="auth-btn-header login-btn" onclick="window.location.href='login.html'">Login</button>
        <button type='button' class="auth-btn-header signup-btn" onclick="window.location.href='register.html'">Register</button>
      </div>
    </div>

    <!-- ΜΕΝΟΥ ΠΛΟΗΓΗΣΗΣ -->
    <nav class="main-nav">
      <ul>
        <li><a href="index.jsp"><i class="fas fa-home"></i> HOME</a></li>
        <li><a href="/ismgroup29/universities"><i class="fas fa-university"></i> UNIVERSITIES</a></li>
        <li><a href="forum.jsp"><i class="fas fa-comments"></i> FORUM</a></li>
        <li><a href="applications.jsp"><i class="fas fa-file-alt"></i> APPLICATIONS</a></li>
      </ul>

      <!-- ΚΟΥΜΠΙ ΜΕΝΟΥ μέσα στο flex -->
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
    background-color: rgb(241, 242, 242);
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
      padding: 10px 18px; /* ✅ ίδιο με .main-nav a */
      line-height: 1;     /* ✅ σταθεροποιεί το ύψος */
      box-sizing: border-box; /* ✅ αποτρέπει φούσκωμα */
      transform: none;    /* ✅ αποτρέπει τυχόν αναπήδηση */
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
  /* === AUTH SECTION - HEADER === */
  .auth-section {
    position: absolute;
    top: 1rem;
    right: 1.5rem;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    gap: 8px;
    z-index: 1001;
  }

  .auth-buttons-header {
    display: flex;
    gap: 10px;
    align-items: center;
  }

  .user-info-header {
    display: flex;
    align-items: center;
    gap: 12px;
    background: rgba(255, 255, 255, 0.15);
    padding: 6px 16px;
    border-radius: 20px;
    color: white;
    font-size: 0.85rem;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  }

  .auth-btn-header {
    padding: 6px 18px;
    border: 2px solid #66b3ff;
    border-radius: 20px;
    color: white;
    text-decoration: none;
    font-size: 0.85rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    font-family: 'Poppins', sans-serif;
    position: relative;
    overflow: hidden;
  }

  .auth-btn-header::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
    transition: left 0.5s ease;
  }

  .auth-btn-header:hover::before {
    left: 100%;
  }

  .login-btn {
    background: linear-gradient(135deg, rgba(102, 179, 255, 0.3), rgba(102, 179, 255, 0.1));
    box-shadow: 0 2px 8px rgba(102, 179, 255, 0.3);
  }

  .signup-btn {
    background: linear-gradient(135deg, rgba(102, 179, 255, 0.6), rgba(102, 179, 255, 0.3));
    box-shadow: 0 2px 8px rgba(102, 179, 255, 0.4);
  }

  .auth-btn-header:hover {
    background: #66b3ff;
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(102, 179, 255, 0.5);
    border-color: #99ccff;
  }

  .logout-btn {
    padding: 4px 12px;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.15), rgba(255, 255, 255, 0.05));
    border: 1px solid rgba(255, 255, 255, 0.3);
    border-radius: 15px;
    color: white;
    font-size: 0.75rem;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    font-family: 'Poppins', sans-serif;
    backdrop-filter: blur(10px);
  }

  .logout-btn:hover {
    background: rgba(255, 255, 255, 0.25);
    transform: translateY(-1px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
  }

  #userNameHeader {
    font-weight: 600;
    color: #99ccff;
    font-size: 0.85rem;
  }

  /* === RESPONSIVE === */
  @media (max-width: 900px) {
    .auth-section {
      position: static;
      align-items: center;
      margin-bottom: 1rem;
      order: 2;
    }
    
    .header-wrapper {
      flex-direction: column;
    }
    
    .user-info-header {
      flex-direction: column;
      gap: 8px;
      text-align: center;
      padding: 8px 12px;
    }
    
    .auth-buttons-header {
      justify-content: center;
    }
  }

  @media (max-width: 480px) {
    .auth-buttons-header {
      flex-direction: column;
      gap: 8px;
    }
    
    .auth-btn-header {
      width: 140px;
      text-align: center;
      padding: 5px 12px;
      font-size: 0.8rem;
    }
    
    .auth-section {
      right: 1rem;
    }
  }
</style>



  <script>
    document.addEventListener("DOMContentLoaded", () => {
        const currentPath = window.location.pathname;

        document.querySelectorAll(".main-nav a").forEach(link => {
            const linkPath = link.getAttribute("href");

            if (currentPath.includes(linkPath)) {
                link.classList.add("active");
            }
        });
    });

  </script>
  <script>
    // Check login status for header
      function checkLoginStatus() {
        const user = localStorage.getItem('currentUser');
        const authButtons = document.getElementById('authButtonsHeader');
        const userInfo = document.getElementById('userInfoHeader');
        const userName = document.getElementById('userNameHeader');
        
        if (user) {
          // User is logged in
          const userData = JSON.parse(user);
          userName.textContent = userData.name;
          userInfo.style.display = 'flex';
          authButtons.style.display = 'none';
        } else {
          // User is not logged in
          userInfo.style.display = 'none';
          authButtons.style.display = 'flex';
        }
      }

// Logout function
function logout() {
  localStorage.removeItem('currentUser');
  checkLoginStatus();
  // Redirect to home page
  window.location.href = 'index.jsp';
}

// Run when page loads
document.addEventListener('DOMContentLoaded', checkLoginStatus);
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
    <a href="#"><i class="fas fa-user"></i> My profile</a>
    <a href="#"><i class="fas fa-file-alt"></i> My applications</a>
    <a href="#"><i class="fas fa-cog"></i> Settings</a>
    <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
  </div>
</div>
