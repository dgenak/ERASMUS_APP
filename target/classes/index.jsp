<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="el">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ΟΠΑ - ERASMUS+</title>
  <link rel="stylesheet" href="css/style.css">

  <!-- Google Fonts & Font Awesome -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f5f7fa;
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
      background: white;
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
  </style>
</head>

<body>
  <%@ include file="header.jsp" %>
  <!-- HERO -->
  <section class="hero">
    <h1>Καλώς Ήρθες στο ΟΠΑ - ERASMUS+</h1>
    <p>Η πύλη σου για σπουδές, συνεργασίες και εμπειρίες στο εξωτερικό.</p>
    <a href="applications.jsp" class="btn">Ξεκίνα την Αίτησή σου</a>
  </section>

  <!-- INFO CARDS -->
  <section class="info">
    <div class="card">
      <i class="fa-solid fa-book-open"></i>
      <h3>Αντιστοίχιση Μαθήματος</h3>
      <p>Δες ποια μαθήματα του ΟΠΑ αντιστοιχούν στα πανεπιστήμια του εξωτερικού και κάνε την επιλογή σου εύκολα.</p>
      <a href="universities.jsp">Μετάβαση</a>
    </div>

    <div class="card">
      <i class="fa-solid fa-comments"></i>
      <h3>Φόρουμ Συζητήσεων</h3>
      <p>Αντάλλαξε εμπειρίες και συμβουλές με άλλους φοιτητές που συμμετέχουν ή έχουν συμμετάσχει στο πρόγραμμα Erasmus+.</p>
      <a href="forum.jsp">Άνοιγμα Forum</a>
    </div>

    <div class="card">
      <i class="fa-solid fa-file-signature"></i>
      <h3>Αιτήσεις</h3>
      <p>Κάνε την αίτησή σου για συμμετοχή στο πρόγραμμα Erasmus+, απευθείας μέσα από την πλατφόρμα.</p>
      <a href="applications.jsp">Κάνε Αίτηση</a>
    </div>
  </section>

  <!-- FOOTER -->
  <footer>
    <div class="social-icons">
      <a href="#"><i class="fab fa-facebook-f"></i></a>
      <a href="#"><i class="fab fa-twitter"></i></a>
      <a href="#"><i class="fab fa-instagram"></i></a>
    </div>
    <p>© 2025 Οικονομικό Πανεπιστήμιο Αθηνών - Πρόγραμμα ERASMUS+</p>
  </footer>
</body>
</html>
