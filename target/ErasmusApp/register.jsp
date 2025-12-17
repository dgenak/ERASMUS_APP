<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register - Uniera</title>
  <style>
    :root {
      --primary: #00509e;
      --primary-dark: #003366;
      --primary-light: #0073e6;
      --secondary: #ff6b6b;
      --accent: #4ecdc4;
      --light: #f8f9fa;
      --dark: #343a40;
      --gray: #6c757d;
      --light-gray: #e9ecef;
      --border-radius: 12px;
      --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      --transition: all 0.3s ease;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #f5f7fa 0%, #e4edf5 100%);
      color: var(--dark);
      line-height: 1.6;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    header {
      background: linear-gradient(135deg, var(--primary-dark), var(--primary));
      color: white;
      padding: 2rem 0;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
      text-align: center;
    }

    .header-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 2rem;
    }

    .app-name {
      font-size: 3rem;
      font-weight: 900;
      color: white;
      text-shadow: 0 2px 6px rgba(0,0,0,0.3);
      margin-bottom: 0.5rem;
    }

    .header-title {
      font-size: 2rem;
      font-weight: 600;
      color: white;
    }

    .main-container {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 2rem;
      position: relative;
      overflow: hidden;
    }

    .background-overlay {
      position: absolute;
      top: 50%;
      left: 18%;
      width: 100%;
      max-width: 500px;
      height: 100%;
      max-height: 500px;
      transform: translate(-50%, -50%);
      background-image: url('imgtravel.jpg');
      background-size: contain;
      background-repeat: no-repeat;
      background-position: center;
      opacity: 0.08;
      z-index: 0;
      pointer-events: none;
      filter: blur(1px);
    }

    .content-card {
      background: rgba(255, 255, 255, 0.96);
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      padding: 3rem;
      max-width: 480px;
      width: 100%;
      animation: fadeIn 0.6s ease;
      position: relative;
      z-index: 1;
      text-align: left;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .section-title {
      font-size: 2rem;
      color: var(--primary-dark);
      margin-bottom: 1.5rem;
      position: relative;
      padding-bottom: 0.5rem;
      text-align: center;
    }

    .section-title::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 60px;
      height: 4px;
      background: var(--accent);
      border-radius: 2px;
    }

    form label {
      font-weight: 600;
      color: var(--dark);
      display: block;
      margin-bottom: 0.3rem;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
      width: 100%;
      padding: 0.8rem;
      margin-bottom: 1rem;
      border-radius: var(--border-radius);
      border: 1px solid var(--light-gray);
      transition: var(--transition);
      font-size: 1rem;
    }

    input:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(0,80,158,0.15);
    }

    .password-wrapper {
      position: relative;
    }

    .toggle-password {
      position: absolute;
      right: 0.9rem;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      opacity: 0.6;
      user-select: none;
      transition: opacity 0.2s;
    }

    .toggle-password:hover { opacity: 1; }

    .error {
      color: var(--secondary);
      font-size: 0.9rem;
      display: none;
      margin-top: -0.5rem;
      margin-bottom: 1rem;
    }

    .btn {
      padding: 0.9rem 1.5rem;
      border: none;
      border-radius: 8px;
      font-weight: 600;
      cursor: pointer;
      transition: var(--transition);
      font-size: 1rem;
      width: 100%;
      margin-top: 0.5rem;
    }

    .btn-primary { background: var(--primary); color: white; }
    .btn-primary:hover { background: var(--primary-dark); transform: scale(1.02); }

    footer {
      background: var(--primary-dark);
      color: white;
      padding: 2rem 0;
      margin-top: auto;
      text-align: center;
    }
    .server-error {
      background: #ffe6e6;
      color: #a10000;
      padding: 12px 16px;
      border-radius: 10px;
      margin-bottom: 1.2rem;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 10px;
      border: 1px solid #ffb3b3;
    }


    .footer-text { color: rgba(255,255,255,0.7); }
  </style>
</head>
<body>
  <header>
    <div class="header-container">
      <div class="app-name">UNIERA</div>
      <div class="header-title">Welcome!</div>
    </div>
  </header>

  <main class="main-container">
    <div class="background-overlay"></div>

    <div class="content-card">
      <h2 class="section-title">Register</h2>
      <% String error = (String) request.getAttribute("error"); %>

      <% if (error != null) { %>
        <div class="server-error">
          <i class="fas fa-circle-exclamation"></i>
          <%= error %>
        </div>
      <% } %>


      <!-- 🔥 FIXED FORM -->
      <form action="RegisterServlet" method="post" onsubmit="return validatePasswords()">

        <label for="firstname">First name:</label>
        <input type="text" id="firstname" name="firstname" required>

        <label for="lastname">Last name:</label>
        <input type="text" id="lastname" name="lastname" required>

        <div class="form-group password-wrapper">
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" required>
          <span class="toggle-password" onclick="togglePassword('password', this)">👁</span>
        </div>

        <div class="form-group password-wrapper">
          <label for="confirmPassword">Re-enter Password:</label>
          <input type="password" id="confirmPassword" required>
          <span class="toggle-password" onclick="togglePassword('confirmPassword', this)">👁</span>
          <div class="error" id="errorMessage">Passwords do not match!</div>
        </div>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <button type="submit" class="btn btn-primary">Register</button>
      </form>

    </div>
  </main>

  <footer>
    <div class="footer-text">&copy; 2025 UNIERA. All rights reserved.</div>
  </footer>


<script>
  function togglePassword(id, el) {
    const input = document.getElementById(id);
    input.type = input.type === "password" ? "text" : "password";
  }

  function validatePasswords() {
    const p1 = document.getElementById("password");
    const p2 = document.getElementById("confirmPassword");
    const error = document.getElementById("errorMessage");

    if (p1.value !== p2.value) {
      error.style.display = "block";
      return false;
    }

    return true;
  }
</script>

</body>
</html>
