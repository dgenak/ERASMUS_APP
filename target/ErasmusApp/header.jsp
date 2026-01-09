<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      crossorigin="anonymous" referrerpolicy="no-referrer"/>

<%
    com.erasmus.web.model.User loggedUser =
        (com.erasmus.web.model.User) session.getAttribute("authUser");

    if (loggedUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String currentPath = request.getServletPath();
%>

<header class="global-header">
  <div class="header-wrapper">

    <!-- LOGO -->
    <div class="logo-area">
      <div class="logo-circle">EU</div>
      <div class="logo-text">
        <h1>UniEra +</h1>
        <span>AUEB - DMST</span>
      </div>
    </div>

    <!-- AUTH SECTION -->
    <div class="auth-section">
      <% if (loggedUser != null) { %>
        <div class="user-info-header">
          <span class="user-name" id="userProfileToggle">
            Hello,
            <strong>
              <%= loggedUser.getFirstName() %> <%= loggedUser.getLastName() %>
            </strong>
          </span>
          <a class="logout-btn" href="LogoutServlet">Logout</a>
        </div>
      <% } %>
    </div>

    <!-- NAV -->
    <nav class="main-nav">
      <ul>
        <li><a href="index.jsp" class="<%= currentPath.contains("index.jsp") ? "active" : "" %>">
          <i class="fas fa-home"></i> HOME</a></li>

        <li><a href="/ismgroup29/universities" class="<%= currentPath.contains("universities") ? "active" : "" %>">
          <i class="fas fa-university"></i> UNIVERSITIES</a></li>

        <li><a href="forum.jsp" class="<%= currentPath.contains("forum.jsp") ? "active" : "" %>">
          <i class="fas fa-comments"></i> FORUM</a></li>

        <li>
          <a href="/ismgroup29/applications.jsp"
            class="<%= currentPath.contains("applications.jsp") ? "active" : "" %>">
            <i class="fas fa-file-alt"></i> APPLICATIONS
          </a>
        </li>


      </ul>


    </nav>
      <!-- ☰ MENU BUTTON -->
      <label for="sidebarToggle" class="menu-button">
        <i class="fas fa-bars"></i> MENU
      </label>
  </div>
</header>

<!-- ✅ MUST BE OUTSIDE HEADER -->

<input type="checkbox" id="sidebarToggle" hidden>

<div class="modal-overlay"></div>

<div class="sidebar">
  <div class="sidebar-header">
    <h3>User Menu</h3>
    <label class="sidebar-close" for="sidebarToggle">&times;</label>
  </div>

  <div class="sidebar-content">
    <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
    <a href="/ismgroup29/universities"><i class="fas fa-university"></i> Universities</a>
    <a href="forum.jsp"><i class="fas fa-comments"></i> Forum</a>
    <a href="/ismgroup29/applications.jsp">
      <i class="fas fa-file-alt"></i> Applications
    </a>



    <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
  </div>
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
    z-index: 5000;
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
    top: 170px;
    right: -340px;
    width: 300px;
    height: 100%;
    background: #fff;
    box-shadow: -3px 0 15px rgba(0,0,0,0.2);
    transition: right 0.4s ease;
    z-index: 4000;
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
    border-radius: 16px;
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
    border-radius: 16px;
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



/* OVERLAY */
.modal-overlay {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.45);
  backdrop-filter: blur(4px);
  display: none;
  z-index: 3000;
}

/* MODAL */
.profile-modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) scale(0.95);
  width: 560px;
  background: white;
  border-radius: 14px;
  box-shadow: 0 20px 60px rgba(0,0,0,0.3);
  display: none;
  z-index: 5000;
  animation: modalFade 0.25s ease forwards;
  max-width: 92vw;
}

@keyframes modalFade {
  to {
    transform: translate(-50%, -50%) scale(1);
  }
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 20px;
  border-bottom: 1px solid #eee;
}

.modal-close {
  font-size: 1.4rem;
  cursor: pointer;
}


.modal-body label {
  font-size: 0.85rem;
  font-weight: 500;
}

.modal-body input {
  padding: 8px 10px;
  border-radius: 6px;
  border: 1px solid #ccc;
}

.modal-actions {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  margin-top: 15px;
}

.btn-cancel {
  background: #e0e0e0;
  border: none;
  padding: 6px 14px;
  border-radius: 6px;
  cursor: pointer;
}

.btn-save {
  background: #0059b3;
  color: white;
  border: none;
  padding: 6px 14px;
  border-radius: 6px;
  cursor: pointer;
}
/* === PROFILE FORM === */
.profile-form {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 24px 28px; 
}
.profile-form *,
.profile-form *::before,
.profile-form *::after {
  box-sizing: border-box;
}

/* Full width rows */
.profile-form .form-group:nth-child(5),
.profile-form .form-group:nth-child(6),
.profile-form .form-group:nth-child(7),
.profile-form .form-group:nth-child(8),
.profile-form .modal-actions {
  grid-column: span 2;
}


.form-group {
  display: flex;
  flex-direction: column;
}

.form-group label {
  font-size: 0.75rem;
  font-weight: 600;
  color: #555;
  margin-bottom: 4px;
  text-transform: uppercase;
  letter-spacing: 0.4px;
}

.form-group input,
.form-group select {
  width: 100%;
  padding: 14px 14px; 
  border-radius: 10px;
  border: 1px solid #d0d7e2;
  font-size: 0.9rem;
  transition: all 0.25s ease;
  background: #f9fbff;
}

.form-group input:focus,
.form-group select:focus {
  outline: none;
  border-color: #0059b3;
  background: white;
  box-shadow: 0 0 0 3px rgba(0, 89, 179, 0.15);
}

select:disabled {
  background: #f0f2f5;
  color: #777;
  cursor: not-allowed;
}

/* Modal header upgrade */
.profile-modal {
  width: 520px;
  max-width: 92vw;
}

.modal-body {
  padding: 28px 30px;
}

.modal-header h3 {
  font-size: 1.2rem;
  font-weight: 700;
  color: #003366;
}

/* Buttons */
.modal-actions {
  grid-column: span 2;
  margin-top: 10px;
}

.btn-save {
  background: linear-gradient(135deg, #0059b3, #0073e6);
  padding: 8px 18px;
  border-radius: 10px;
  font-weight: 600;
}

.btn-save:hover {
  transform: translateY(-1px);
  box-shadow: 0 6px 18px rgba(0, 89, 179, 0.35);
}

.btn-cancel {
  border-radius: 10px;
}
.profile-modal {
  animation: modalFade 0.25s ease forwards;
}
.profile-modal {
  animation: modalFade 0.35s cubic-bezier(.25,.8,.25,1) forwards;
}
.field {
  position: relative;
}

.field input {
  width: 100%;
  padding: 14px 12px;
  box-sizing: border-box;
  border-radius: 10px;
  border: 1.5px solid #d0d7e2;
  background: #f9fbff;
}

.field label {
  position: absolute;
  left: 12px;
  top: 50%;
  transform: translateY(-50%);
  font-size: 0.75rem;
  color: #6b7280;
  background: white;
  padding: 0 6px;
  pointer-events: none;
  transition: 0.2s ease;
}

.field input:focus + label,
.field input:not(:placeholder-shown) + label {
  top: -6px;
  font-size: 0.65rem;
  color: #0059b3;
}
/* ===============================
   📱 MOBILE HEADER – CLEAN & PRO
   =============================== */
/* ===============================
📱 MOBILE NAV GRID (INDEX STYLE)
=============================== */
@media (max-width: 480px) {
  :root {
    --header-height: 150px;
  }
  .sidebar {
    transform: translateX(0) scale(0.98);
    transition: right 0.35s ease, transform 0.35s ease;
    width: 240px;              /* ⬅️ ΠΙΟ ΣΤΕΝΟ */
    right: -260px;             /* ⬅️ ΚΡΥΒΕΤΑΙ ΣΩΣΤΑ */
    top: 150px;                /* ⬅️ ΚΑΤΩ ΑΠΟ HEADER */
    height: calc(100vh - 150px);
    padding: 14px;
    border-radius: 18px 0 0 18px;
  }
  
  #sidebarToggle:checked ~ .sidebar {
    transform: translateX(0) scale(1);
  }
  
  .sidebar-header {
    padding: 8px 12px;
    border-radius: 12px;
  }

  .sidebar-header h3 {
    font-size: 0.9rem;
  }

  .sidebar-close {
    font-size: 1.2rem;
  }

  .sidebar-content {
    margin-top: 14px;
    gap: 8px;
  }

  .sidebar-content a {
    padding: 10px 12px;
    font-size: 0.85rem;
    border-radius: 12px;
  }

  .sidebar-content a i {
    font-size: 0.9rem;
  }
  /* ===== HEADER ===== */
  .global-header {
    padding: 0.35rem 0 0.45rem;
  }

  /* ===== LOGO AREA ===== */
  .logo-area {
    gap: 6px;
    margin-bottom: 0.15rem;
  }

  /* ===== LOGO CIRCLE ===== */
  .logo-circle {
    width: 36px;
    height: 36px;
    font-size: 1rem;
  }

  /* ===== LOGO TEXT ===== */
  .logo-text h1 {
    font-size: 1.1rem;
    line-height: 1.1;
  }

  .logo-text span {
    display: none; /* ⬅️ ΚΡΥΒΟΥΜΕ ΤΟ SUBTITLE */
  }

  /* ===== AUTH SECTION ===== */
  .auth-section {
    margin: 6px 0;
  }

  .user-info-header {
    padding: 3px 8px;
    font-size: 0.68rem;
    gap: 6px;
  }

  .logout-btn {
    padding: 2px 8px;
    font-size: 0.65rem;
  }

  /* ===== NAV ===== */
  .main-nav {
    margin-top: 0.2rem;
  }

  .main-nav ul {
    gap: 16px;
  }

  .main-nav a {
    -webkit-tap-highlight-color: transparent;
    background: transparent;
    box-shadow: none;
    border-radius: 16;
  
    padding: 6px 10px;
    font-size: 0.75rem;

  }

  /* ===== MENU BUTTON ===== */
  .menu-button {
    height: 30px;
    width: 80px;
    font-size: 0.7rem;
    gap: 4px;
  }

  .menu-button i {
    font-size: 0.75rem;
  }
}
                                                                

@media (max-width: 900px) {

  /* Header layout */
  .header-wrapper {
    flex-direction: column;
    align-items: center;
  }

  /* AUTH */
  .auth-section {
    position: static;
    margin: 12px 0;
  }

  .user-info-header {
    width: 90%;
    justify-content: space-between;
  }

  /* NAV CONTAINER */
  .main-nav {
    width: 100%;
    margin-top: 16px;
  }

  /* GRID NAV BUTTONS */
  .main-nav ul {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 14px;
    padding: 0 16px;
  }

  .main-nav li {
    width: 100%;
  }

  /* BUTTON STYLE */
  .main-nav a {
    -webkit-tap-highlight-color: transparent;
    background: transparent;
    box-shadow: none;
    border-radius: 16px;
  
    justify-content: center;
    width: 100%;
    padding: 14px 0;
    font-size: 0.9rem;

  }

  .main-nav a.active {
    background: white;
    color: #003366;
  }

  /* MENU BUTTON (προαιρετικό αν θες sidebar) */
  .menu-button {
    margin-top: 16px;
  }
}

/* ===============================
   📱 SIDEBAR TOGGLE (NO JS)
   =============================== */

/* Όταν είναι τσεκαρισμένο το checkbox */
#sidebarToggle:checked ~ .sidebar {
  right: 0;
}

/* Overlay όταν ανοίγει το sidebar */
#sidebarToggle:checked ~ .modal-overlay {
  display: block;
}



</style>

<script>
document.addEventListener("DOMContentLoaded", function () {

  const openBtn = document.getElementById("userProfileToggle");
  const modal = document.getElementById("profileModal");
  const overlay = document.getElementById("profileModalOverlay");
  const closeBtn = document.getElementById("closeProfileModal");
  const cancelBtn = document.getElementById("cancelProfile");

  function openModal() {
    modal.style.display = "block";
    overlay.style.display = "block";
  }

  function closeModal() {
    modal.style.display = "none";
    overlay.style.display = "none";
  }

  openBtn.addEventListener("click", openModal);
  closeBtn.addEventListener("click", closeModal);
  cancelBtn.addEventListener("click", closeModal);
  overlay.addEventListener("click", closeModal);
});
</script>
