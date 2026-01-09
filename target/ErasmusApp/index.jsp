<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>AUEB - ERASMUS+</title>
  <link rel="stylesheet" href="css/style.css">

  <!-- Google Fonts & Font Awesome -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    /* =====================================
   📱 EXTRA SMALL DEVICES (≤ 480px)
   ===================================== */
@media (max-width: 480px) {

  /* HERO */
  .hero {
    padding: 70px 16px 90px;
  }

  .hero h1 {
    font-size: 28px;
    line-height: 1.25;
  }

  .hero p {
    font-size: 15px;
    margin-bottom: 20px;
  }

  .hero .btn {
    padding: 12px 28px;
    font-size: 15px;
  }

  /* INFO SECTION */
  .info {
    padding: 50px 16px;
    gap: 22px;
  }

  .card {
    width: 100%;
    padding: 26px 22px;
    border-radius: 18px;
  }

  .card i {
    font-size: 42px;
    margin-bottom: 16px;
  }

  .card h3 {
    font-size: 19px;
  }

  .card p {
    font-size: 14px;
  }

  .card a {
    width: 140px;
    font-size: 14px;
    padding: 9px 22px;
  }

  /* FOOTER */
  footer {
    padding: 22px 14px;
  }

  footer p {
    font-size: 13px;
  }
}

/* =====================================
   📱 SMALL DEVICES (481px – 768px)
   ===================================== */
@media (max-width: 768px) {

  .hero {
    padding: 85px 20px 100px;
  }

  .hero h1 {
    font-size: 34px;
  }

  .hero p {
    font-size: 16px;
  }

  .info {
    padding: 70px 30px;
    gap: 28px;
  }

  .card {
    width: 100%;
    max-width: 420px;
    margin: 0 auto;
  }
}

/* =====================================
   💻 TABLETS / SMALL LAPTOPS (769px – 1024px)
   ===================================== */
@media (max-width: 1024px) {

  .hero h1 {
    font-size: 40px;
  }

  .info {
    padding: 90px 40px;
  }

  .card {
    width: 300px;
  }
}

/* =====================================
   🖥️ LARGE SCREENS (≥ 1400px)
   ===================================== */
@media (min-width: 1400px) {

  .hero h1 {
    font-size: 52px;
  }

  .hero p {
    font-size: 19px;
  }

  .info {
    padding: 110px 80px;
  }
}

/* =====================================
   📱 LANDSCAPE MOBILE
   ===================================== */
@media (max-height: 500px) and (orientation: landscape) {

  .hero {
    padding: 50px 20px 70px;
  }

  .hero h1 {
    font-size: 26px;
  }

  .info {
    padding: 40px 20px;
  }
}


    body {
        font-family: 'Poppins', sans-serif;
        color: #343a40;
        line-height: 1.6;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* === HERO SECTION === */
    .hero {
      width: 100%;
      background: linear-gradient(rgba(0, 51, 102, 0.85), rgba(0, 51, 102, 0.85)),
                  url('images/opa-campus.jpg') center/cover no-repeat;
      color: white;
      text-align: center;
      padding: 100px 20px 120px 20px;
      box-sizing: border-box;
    }

    .hero h1 {
      font-size: 48px;
      font-weight: 700;
      margin-bottom: 15px;
    }

    .hero p {
      font-size: 18px;
      margin-bottom: 25px;
    }

    .hero .btn {
      background-color: #66b3ff;
      color: white;
      padding: 14px 40px;
      border-radius: 30px;
      text-decoration: none;
      font-weight: 500;
      font-size: 16px;
      transition: all 0.3s ease;
    }

    .hero .btn:hover {
      background-color: #3385ff;
      transform: translateY(-2px);
    }

    /* === INFO SECTION === */
    .info {
      display: flex;
      justify-content: center;
      align-items: stretch;
      gap: 40px;
      padding: 100px 60px;
      flex-wrap: wrap;
      background-color: #f5f7fa;
      width: 100%;
      box-sizing: border-box;
    }

    .card {
      background: rgb(245, 243, 243);
      width: 330px;
      padding: 40px 30px;
      border-radius: 25px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
      text-align: center;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .card::before {
      content: '';
      position: absolute;
      width: 100%;
      height: 6px;
      top: 0;
      left: 0;
      background: linear-gradient(90deg, #003366, #3385ff);
    }

    .card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
    }

    .card i {
      font-size: 50px;
      color: #003366;
      margin-bottom: 20px;
    }

    .card h3 {
      font-size: 22px;
      color: #003366;
      margin-bottom: 15px;
      font-weight: 600;
    }

    .card p {
      font-size: 15px;
      color: #555;
      margin-bottom: 20px;
    }

    .card a {
      display: inline-block;
      margin-top: 10px;
      background-color: #003366;
      color: white;
      padding: 10px 25px;
      border-radius: 30px;
      font-weight: 500;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .card a:hover {
      background-color: #3385ff;
      transform: scale(1.05);
    }

    /* === FOOTER === */
    footer {
      background-color: #003366;
      color: white;
      text-align: center;
      padding: 30px 20px;
      width: 100%;
      box-sizing: border-box;
      margin-top: 0;
    }

    .social-icons {
      margin-top: 10px;
    }

    .social-icons a {
      color: white;
      margin: 0 10px;
      font-size: 18px;
      transition: color 0.3s;
    }

    .social-icons a:hover {
      color: #66b3ff;
    }

    footer p {
      margin-top: 15px;
      font-size: 14px;
    }

    /* === RESPONSIVE === */
    @media (max-width: 768px) {
      .hero h1 {
        font-size: 36px;
      }

      .hero p {
        font-size: 16px;
      }

      .info {
        padding: 60px 20px;
      }

      .card {
        width: 100%;
      }
    }
    html, body {
        height: 100%;
        margin: 0;
    }

    body {
        display: flex;
        flex-direction: column;
    }

    main {
        flex: 1;
    }
    .card {
      background: rgb(245, 243, 243);
      width: 330px;
      padding: 40px 30px;
      border-radius: 25px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
      text-align: center;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;

      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .card a {
      background-color: #003366;
      color: white;
      padding: 10px 25px;
      border-radius: 30px;
      font-weight: 500;
      text-decoration: none;
      transition: all 0.3s ease;
      width: 160px;
      margin: 0 auto;
      margin-top: 20px;
      text-align: center;
    }




  </style>
</head>

<body>
  <%@ include file="header.jsp" %>

  <main>
    <section class="hero">
      <h1>Welcome to UNIERA+</h1>
      <p>Your smart guide for Erasmus+ opportunities</p>
      <a href="applications.jsp" class="btn">Start Your Application</a>
    </section>

    <section class="info">
      <div class="card">
        <i class="fa-solid fa-book-open"></i>
        <h3>Course Matching</h3>
        <p>See which AUEB courses correspond to partner universities abroad and make your choices easily.</p>
        <a href="/ismgroup29/universities">Go to Page</a>
      </div>

      <div class="card">
        <i class="fa-solid fa-comments"></i>
        <h3>Discussion Forum</h3>
        <p>Exchange experiences and advice with other students...</p>
        <a href="forum.jsp">Open Forum</a>
      </div>

      <div class="card">
        <i class="fa-solid fa-file-signature"></i>
        <h3>Applications</h3>
        <p>Submit your Erasmus+ application directly...</p>
        <a href="applications.jsp">Apply Now</a>
      </div>

      <div class="card">
        <i class="fa-solid fa-magnifying-glass-chart"></i>
        <h3>Best University Finder</h3>
        <p>Select AUEB courses you want to match and find the best partner universities.</p>
        <a href="/ismgroup29/CourseMatchSelect">Find Course Matches</a>

      </div>

    </section>

    


  </main>
  <%@ include file="footer.jsp" %>
</body>
</html>
