<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="el">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ERASMUS+ | Αντιστοίχιση Μαθημάτων</title>

  <!-- Ενιαία εμφάνιση και γραμματοσειρές -->
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
  

  <!-- ====== ΚΥΡΙΟ ΠΕΡΙΕΧΟΜΕΝΟ ====== -->
  <main>
    <div class="content-card">
      <h2 class="section-title">Αντιστοίχιση Μαθημάτων ΔΕΤ</h2>

      <!-- Επιλογή Χώρας -->
      <div class="form-group">
        <label><strong>Επιλέξτε Χώρα:</strong></label><br>
        <select id="countrySelect" class="form-control">
          <option value="">-- Επιλογή Χώρας --</option>
        </select>
      </div>

      <!-- Επιλογή Πανεπιστημίου -->
      <div class="form-group">
        <label><strong>Επιλέξτε Πανεπιστήμιο:</strong></label><br>
        <select id="universitySelect" class="form-control">
          <option value="">-- Επιλογή Πανεπιστημίου --</option>
        </select>
      </div>

      <!-- Λίστα Μαθημάτων -->
      <div id="coursesContainer" class="semesters-grid"></div>

      <!-- Αποτέλεσμα Αντιστοίχισης -->
      <div id="mappingResult" class="content-card" style="display:none; background:#eaf4ff; margin-top:20px;"></div>
    </div>
  </main>

  <!-- ====== SIDEBAR ====== -->
  <div class="sidebar" id="sidebar">
    <div class="sidebar-header">
      <h3>Μενού Χρήστη</h3>
      <button class="sidebar-close" onclick="toggleSidebar()">&times;</button>
    </div>
    <div class="sidebar-content">
      <a href="#" class="sidebar-action"><i class="fas fa-user"></i> Το προφίλ μου</a>
      <a href="#" class="sidebar-action"><i class="fas fa-file-alt"></i> Οι δηλώσεις μου</a>
      <a href="#" class="sidebar-action"><i class="fas fa-cog"></i> Ρυθμίσεις</a>
      <a href="#" class="sidebar-action" onclick="alert('Αποσυνδεθήκατε!')">
        <i class="fas fa-sign-out-alt"></i> Αποσύνδεση
      </a>
    </div>
  </div>

  <!-- ====== FOOTER ====== -->
  <footer>
    &copy; 2025 Οικονομικό Πανεπιστήμιο Αθηνών - ERASMUS+
  </footer>

  <!-- ====== SCRIPT ====== -->
  <script>
    // === Sidebar toggle ===
    function toggleSidebar() {
      document.getElementById('sidebar').classList.toggle('active');
    }

    // === Dynamic επιλογές ===
    $(document).ready(function() {
      // 1️⃣ Φόρτωση χωρών
      $.getJSON('/ErasmusApp/api/universities/countries', function(countries) {
        countries.forEach(c => {
          $('#countrySelect').append(`<option value="${c}">${c}</option>`);
        });
      });

      // 2️⃣ Όταν επιλέγεται χώρα → φέρνει πανεπιστήμια
      $('#countrySelect').on('change', function() {
        const country = $(this).val();
        $('#universitySelect').html('<option value="">-- Επιλογή Πανεπιστημίου --</option>');
        $('#coursesContainer').empty();
        $('#mappingResult').hide();

        if (country) {
          $.getJSON(`/ErasmusApp/api/universities/byCountry?country=${country}`, function(unis) {
            unis.forEach(u => {
              $('#universitySelect').append(`<option value="${u}">${u}</option>`);
            });
          });
        }
      });

      // 3️⃣ Όταν επιλέγεται πανεπιστήμιο → φέρνει μαθήματα ΔΕΤ
      $('#universitySelect').on('change', function() {
        const university = $(this).val();
        $('#coursesContainer').empty();
        $('#mappingResult').hide();

        if (university) {
          $.getJSON('/ErasmusApp/api/universities/dmstCourses', function(data) {
            for (const [semester, courses] of Object.entries(data)) {
              let html = `
                <div class='semester-card'>
                  <div class='semester-header'>
                    <h3 class='semester-title'>${semester}</h3>
                    <span class='semester-badge'>Μαθήματα</span>
                  </div>
                  <ul class='course-list'>`;
              courses.forEach(c => {
                html += `
                  <li class='course-item' onclick="showMapping('${university}', '${c}')">
                    <div class='course-name'>${c}</div>
                  </li>`;
              });
              html += `</ul></div>`;
              $('#coursesContainer').append(html);
            }
          });
        }
      });
    });

    // 4️⃣ Εμφάνιση αντιστοίχισης
    function showMapping(university, dmstCourse) {
      $.get(`/ErasmusApp/api/universities/mapping?university=${encodeURIComponent(university)}&dmstCourse=${encodeURIComponent(dmstCourse)}`, function(result) {
        $('#mappingResult').html(`<h3>${dmstCourse}</h3><p><strong>Αντιστοίχιση:</strong> ${result}</p>`).show();
      });
    }
  </script>
</body>
</html>
