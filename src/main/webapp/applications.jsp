<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ERASMUS+ | Applications</title>

  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      color: #343a40;
      line-height: 1.6;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      background: #f4f7fb;
    }

    main {
      flex: 1;
      max-width: 1000px;
      margin: 2rem auto;
      padding: 0 2rem;
      width: 100%;
    }

    .content-card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      padding: 2.5rem;
      animation: fadeIn 0.5s ease;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .section-title {
      font-size: 2rem;
      color: #003366;
      margin-bottom: 1.5rem;
      text-align: center;
    }

    .form-group {
      margin-bottom: 1.2rem;
    }

    .form-label {
      display: block;
      margin-bottom: 0.4rem;
      font-weight: 500;
    }

    .form-control {
      width: 100%;
      padding: 0.8rem 1rem;
      border: 1px solid #ced4da;
      border-radius: 8px;
      font-family: inherit;
      transition: border-color 0.3s;
    }

    .form-control:focus {
      outline: none;
      border-color: #00509e;
      box-shadow: 0 0 0 3px rgba(0, 80, 158, 0.1);
    }

    .btn {
      background: #00509e;
      color: white;
      border: none;
      padding: 0.8rem 1.5rem;
      border-radius: 30px;
      font-weight: 500;
      cursor: pointer;
      transition: 0.3s;
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
    }

    .btn:hover {
      background: #003d80;
      transform: translateY(-2px);
    }

    footer {
      background: #003366;
      color: white;
      text-align: center;
      padding: 1.5rem 0;
      margin-top: auto;
    }

    /* Sidebar */
    .sidebar {
      position: fixed;
      top: 0;
      right: -350px;
      width: 350px;
      height: 100%;
      background: white;
      box-shadow: -5px 0 15px rgba(0, 0, 0, 0.1);
      transition: 0.3s;
      z-index: 1000;
      overflow-y: auto;
    }

    .sidebar.active {
      right: 0;
    }

    .sidebar-header {
      padding: 1.5rem;
      background: #00509e;
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .sidebar-content {
      padding: 1.5rem;
    }

    .sidebar-action {
      display: block;
      margin: 10px 0;
      padding: 10px;
      background: #f8f9fa;
      border-radius: 8px;
      text-decoration: none;
      color: #343a40;
      transition: background 0.3s;
    }

    .sidebar-action:hover {
      background: #e3f2fd;
      color: #00509e;
    }
  </style>
</head>

<body>

  <main>
    <div class="content-card">
      <h2 class="section-title">Erasmus+ Application Form</h2>
      <form id="applicationForm">
        <div class="form-group">
          <label class="form-label">Full Name:</label>
          <input type="text" class="form-control" id="studentName" required>
        </div>

        <div class="form-group">
          <label class="form-label">Student ID:</label>
          <input type="text" class="form-control" id="studentId" required>
        </div>

        <div class="form-group">
          <label class="form-label">Department:</label>
          <select class="form-control" id="department" required>
            <option value="">-- Select Department --</option>
            <option value="Economics">Economics</option>
            <option value="Management Science and Technology">Management Science and Technology</option>
            <option value="Informatics">Informatics</option>
            <option value="Statistics">Statistics</option>
          </select>
        </div>

        <div class="form-group">
          <label class="form-label">Chosen University:</label>
          <input type="text" class="form-control" id="university" required>
        </div>

        <div class="form-group">
          <label class="form-label">Country:</label>
          <input type="text" class="form-control" id="country" required>
        </div>

        <div class="form-group">
          <label class="form-label">Months of Stay:</label>
          <input type="number" class="form-control" id="months" min="1" max="12" required>
        </div>

        <div class="form-group">
          <label class="form-label">Message / Additional Information:</label>
          <textarea class="form-control" id="notes" rows="4" placeholder="Write any special requests or notes..."></textarea>
        </div>

        <button type="button" class="btn" onclick="submitApplication()">
          <i class="fas fa-paper-plane"></i> Submit Application
        </button>
      </form>
    </div>
  </main>

  <!-- ====== SIDEBAR ====== -->
  <div class="sidebar" id="sidebar">
    <div class="sidebar-header">
      <h3>User Menu</h3>
      <button class="btn" onclick="toggleSidebar()">✕</button>
    </div>
    <div class="sidebar-content">
      <a href="/ErasmusApp/profile.jsp" class="sidebar-action"><i class="fas fa-user"></i> My Profile</a>
      <a href="#" class="sidebar-action"><i class="fas fa-file-alt"></i> My Applications</a>
      <a href="#" class="sidebar-action"><i class="fas fa-cog"></i> Settings</a>
      <a href="#" class="sidebar-action" onclick="alert('You have been logged out!')"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
  </div>

  <script>
    function toggleSidebar() {
      document.getElementById("sidebar").classList.toggle("active");
    }

    function submitApplication() {
      const form = {
        name: document.getElementById("studentName").value.trim(),
        id: document.getElementById("studentId").value.trim(),
        department: document.getElementById("department").value,
        university: document.getElementById("university").value.trim(),
        country: document.getElementById("country").value.trim(),
        months: document.getElementById("months").value,
        notes: document.getElementById("notes").value.trim()
      };

      if (!form.name || !form.id || !form.department || !form.university || !form.country || !form.months) {
        alert("Please fill in all required fields!");
        return;
      }

      console.log("Application submitted:", form);
      alert("Your application has been successfully submitted!");
      document.getElementById("applicationForm").reset();
    }
  </script>
  <%@ include file="footer.jsp" %>
</body>
</html>
