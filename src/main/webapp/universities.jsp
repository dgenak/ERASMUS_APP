<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="el">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ERASMUS+ | Αντιστοίχιση Μαθημάτων</title>

  <!-- Εμφάνιση και γραμματοσειρές -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    body {
      margin: 0;
      background: #f5f8ff;
      font-family: 'Poppins', sans-serif;
      color: #1a1a1a;
    }

    main {
      max-width: 1100px;
      margin: 50px auto;
      padding: 2rem;
    }

    /* === Κεντρική κάρτα === */
    .content-card {
      background: #fff;
      border-radius: 15px;
      padding: 2.5rem;
      box-shadow: 0 8px 25px rgba(0,0,0,0.1);
      transition: transform 0.3s ease;
    }
    .content-card:hover {
      transform: translateY(-3px);
    }

    /* === Επικεφαλίδα === */
    .section-title {
      font-size: 1.8rem;
      font-weight: 600;
      color: #003366;
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 2rem;
    }

    .section-title i {
      font-size: 1.5rem;
      color: #0073e6;
    }

    /* === Φόρμες επιλογών === */
    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-group label {
      font-weight: 600;
      color: #002855;
    }

    .form-control {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccd6eb;
      border-radius: 8px;
      font-size: 1rem;
      background: #f9fbff;
      transition: all 0.3s ease;
    }

    .form-control:hover, .form-control:focus {
      border-color: #0073e6;
      outline: none;
      background: #fff;
    }

    /* === Εμφάνιση μαθημάτων === */
    .semesters-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 20px;
      margin-top: 1.5rem;
    }

    .semester-card {
      background: #eaf4ff;
      border-radius: 12px;
      padding: 1.5rem;
      transition: all 0.3s ease;
      border: 1px solid #cde2ff;
    }

    .semester-card:hover {
      background: #d9ecff;
      transform: translateY(-3px);
    }

    .semester-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 0.8rem;
    }

    .semester-title {
      color: #003366;
      font-size: 1.2rem;
      font-weight: 600;
    }

    .semester-badge {
      background: #0073e6;
      color: #fff;
      font-size: 0.8rem;
      padding: 4px 10px;
      border-radius: 8px;
    }

    .course-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .course-item {
      background: #fff;
      border-radius: 8px;
      margin-bottom: 8px;
      padding: 10px 12px;
      cursor: pointer;
      transition: all 0.2s ease;
      border: 1px solid #e0e8ff;
    }

    .course-item:hover {
      background: #0073e6;
      color: #fff;
      transform: translateX(5px);
    }

    /* === Αποτέλεσμα Αντιστοίχισης === */
    #mappingResult {
      margin-top: 30px;
      background: #f0f8ff;
      border-left: 5px solid #0073e6;
      border-radius: 10px;
      padding: 1.5rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.05);
      display: none;
    }

    #mappingResult h3 {
      color: #003366;
      margin-bottom: 10px;
    }

    /* === Banner Section === */
    .banner {
      background: linear-gradient(120deg, #003366, #0073e6);
      color: white;
      border-radius: 14px;
      padding: 2rem 2.5rem;
      margin-bottom: 2rem;
      box-shadow: 0 6px 20px rgba(0,0,0,0.2);
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
    }

    .banner h1 {
      font-size: 1.8rem;
      font-weight: 600;
    }

    .banner p {
      max-width: 600px;
      color: #e0eaff;
      line-height: 1.5;
    }

    .banner i {
      font-size: 3rem;
      color: #aeefff;
    }

    footer {
      background: #003366;
      color: #cce0ff;
      text-align: center;
      padding: 1.2rem;
      margin-top: 50px;
      font-size: 0.9rem;
    }
  </style>
</head>

<body>
  <%@ include file="header.jsp" %>

  <main>
    <div class="banner">
      <div>
        <h1><i class="fa-solid fa-globe-europe"></i> Erasmus+ Αντιστοίχιση Μαθημάτων ΔΕΤ</h1>
        <p>Εξερευνήστε πανεπιστήμια σε όλη την Ευρώπη και δείτε πώς τα μαθήματα του Τμήματος Διοικητικής Επιστήμης & Τεχνολογίας αντιστοιχούν με αυτά του εξωτερικού.</p>
      </div>
      <i class="fa-solid fa-book-open-reader"></i>
    </div>

    <div class="content-card">
      <h2 class="section-title"><i class="fa-solid fa-university"></i> Επιλογή Πανεπιστημίου</h2>

      <!-- Επιλογή Χώρας -->
      <div class="form-group">
        <label><strong>Επιλέξτε Χώρα:</strong></label>
        <select id="countrySelect" class="form-control">
          <option value="">-- Επιλογή Χώρας --</option>
        </select>
      </div>

      <!-- Επιλογή Πανεπιστημίου -->
      <div class="form-group">
        <label><strong>Επιλέξτε Πανεπιστήμιο:</strong></label>
        <select id="universitySelect" class="form-control">
          <option value="">-- Επιλογή Πανεπιστημίου --</option>
        </select>
      </div>

      <!-- Λίστα Μαθημάτων -->
      <div id="coursesContainer" class="semesters-grid"></div>

      <!-- Αποτέλεσμα Αντιστοίχισης -->
      <div id="mappingResult"></div>
    </div>
  </main>

  <footer>
    &copy; 2025 Οικονομικό Πανεπιστήμιο Αθηνών — ERASMUS+
  </footer>

  <script>
    // === Φόρτωση επιλογών ===
    $(document).ready(function() {

      // Χώρες
      $.getJSON('/ErasmusApp/api/universities/countries', function(countries) {
        countries.forEach(function(c) {
          $('#countrySelect').append('<option value="' + c + '">' + c + '</option>');
        });
      });

      // Πανεπιστήμια ανά χώρα
      $('#countrySelect').on('change', function() {
        var country = $(this).val();
        $('#universitySelect').html('<option value="">-- Επιλογή Πανεπιστημίου --</option>');
        $('#coursesContainer').empty();
        $('#mappingResult').hide();

        if (country) {
          $.getJSON('/ErasmusApp/api/universities/byCountry?country=' + encodeURIComponent(country), function(unis) {
            unis.forEach(function(u) {
              $('#universitySelect').append('<option value="' + u + '">' + u + '</option>');
            });
          });
        }
      });

      // Μαθήματα ανά πανεπιστήμιο
      $('#universitySelect').on('change', function() {
        var university = $(this).val();
        $('#coursesContainer').empty();
        $('#mappingResult').hide();

        if (university) {
          $.getJSON('/ErasmusApp/api/universities/dmstCourses', function(data) {
            for (var semester in data) {
              if (data.hasOwnProperty(semester)) {
                var courses = data[semester];
                var html = "<div class='semester-card'>" +
                             "<div class='semester-header'>" +
                               "<h3 class='semester-title'>" + semester + "</h3>" +
                               "<span class='semester-badge'>Μαθήματα</span>" +
                             "</div><ul class='course-list'>";
                courses.forEach(function(c) {
                  html += "<li class='course-item' onclick=\"showMapping('" + university + "', '" + c + "')\">" + c + "</li>";
                });
                html += "</ul></div>";
                $('#coursesContainer').append(html);
              }
            }
          });
        }
      });
    });

    // === Εμφάνιση αντιστοίχισης ===
    function showMapping(university, dmstCourse) {
      $.get("/ErasmusApp/api/universities/mapping?university=" + 
            encodeURIComponent(university) + 
            "&dmstCourse=" + encodeURIComponent(dmstCourse),
        function(result) {
          $('#mappingResult')
            .html("<h3><i class='fa-solid fa-arrows-left-right'></i> " + dmstCourse + "</h3><p><strong>Αντιστοίχιση:</strong> " + result + "</p>")
            .fadeIn(300);
        }
      );
    }
  </script>
</body>
</html>
