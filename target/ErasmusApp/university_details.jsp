<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.erasmus.web.model.CourseDet, com.erasmus.web.model.University" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DMST Courses</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #eef3ff;
            margin: 0;
            font-size: 18px;
        }

        .container {
            max-width: 1400px;
            margin: 50px auto;
            padding: 0 25px;
        }

        .title-box {
            text-align: center;
            margin-bottom: 40px;
        }

        .title-box h1 {
            font-size: 44px;
            color: #002147;
            margin-bottom: 12px;
            font-weight: 700;
        }

        .title-box h3 {
            font-size: 22px;
            color: #445;
            font-weight: 400;
        }

        /* SEMESTERS GRID */
        .semester-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(410px, 1fr));
            gap: 30px;
        }

        .semester-card {
            background: #ffffff;
            border-radius: 18px;
            box-shadow: 0 5px 30px rgba(0,0,0,0.12);
            padding: 30px;
            transition: 0.25s;
        }

        .semester-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 36px rgba(0,0,0,0.15);
        }

        .semester-title {
            font-size: 28px;
            color: #003366;
            font-weight: 600;
            margin-bottom: 22px;
        }

        .course-item {
            display: block;
            text-decoration: none;
            color: inherit;

            background: #f3f6ff;
            padding: 18px 20px;
            border-radius: 14px;
            margin-bottom: 16px;
            transition: 0.2s;
            cursor: pointer;
        }

        .course-item:hover {
            background: #e7edff;
        }
        .course-name {
            font-weight: 600;
            color: #222;
            margin: 0;
            font-size: 18px;

            display: flex;
            justify-content: space-between;
            align-items: center;

            gap: 16px;          /* extra space */
            width: 100%;
        }


        .course-info {
            font-size: 15px;
            color: #666;
        }

        .ects-badge {
            background: #005bbb;
            color: #fff;
            padding: 6px 14px;
            border-radius: 15px;
            font-size: 14px;
            margin-left: 10px;
            white-space: nowrap;   /* ← ΠΡΟΣΘΗΚΗ ΓΙΑ ΝΑ ΜΗ ΣΠΑΕΙ ΠΟΤΕ */
        }


        /* MAP */
        .map-box {
            position: relative;
            margin: 40px auto;
            width: 100%;
            max-width: 900px;
            border-radius: 22px;
            overflow: hidden;
            box-shadow: 0 12px 40px rgba(0,0,0,0.22);
        }

        .map-box iframe {
            width: 100%;
            height: 320px;
            border: 0;
        }

        .map-click-layer {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
            z-index: 5;
            background: rgba(0,0,0,0);
        }

        /* BEAUTIFUL SELECT DROPDOWN */
        .drop {
            width: 100%;
            padding: 14px 18px;
            font-size: 17px;
            border-radius: 12px;
            border: 2px solid #003366;
            background: #f7faff;
            font-weight: 500;
            color: #003366;
            transition: 0.25s ease;
        }

        .drop:hover {
            border-color: #005bbb;
        }

        .drop:focus {
            outline: none;
            border-color: #003366;
            box-shadow: 0 0 6px rgba(0,70,140,0.3);
        }

        /* BUTTON LOOKING LIKE COURSE ITEM */
        .orientation-btn {
            width: 100%;
            border: none;
            background: #f3f6ff;
            padding: 18px 20px;
            border-radius: 14px;
            text-align: left;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            margin-bottom: 16px;
            transition: 0.25s;
        }

        .orientation-btn:hover {
            background: #e7edff;
        }
        .back-btn {
            display: inline-block;
            margin-bottom: 18px;
            background: #003366;
            color: white;
            padding: 10px 18px;
            border-radius: 10px;
            font-weight: 600;
            text-decoration: none;
            transition: 0.2s;
            cursor: pointer;
        }
        .back-btn:hover {
            background: #001f4d;
            transform: translateX(-3px);
        }
        .orientation-btn {
            width: 100%;
            padding: 14px;
            margin-bottom: 12px;
            background: #e7edff;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            color: #003366;
            cursor: pointer;
            transition: 0.25s;
        }
        .orientation-btn:hover {
            background: #d8e4ff;
            transform: translateY(-3px);
        }
        .select-wrapper {
            position: relative;
            width: 100%;
        }

        .styled-select {
            width: 100%;
            padding: 14px 18px;
            font-size: 16px;
            border-radius: 12px;
            border: 2px solid #ccd9f6;
            background: #f7faff;
            font-weight: 500;
            color: #003366;
            cursor: pointer;
            transition: 0.25s;
            appearance: none;
        }

        /* Hover */
        .styled-select:hover {
            border-color: #7aa7e8;
        }

        /* Focus */
        .styled-select:focus {
            outline: none;
            border-color: #003366;
            box-shadow: 0 0 6px rgba(0,70,140,0.30);
        }

        /* Dropdown arrow */
        .select-wrapper::after {
            content: "▼";
            font-size: 12px;
            color: #003366;
            position: absolute;
            right: 18px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none;
        }

        /* BACKDROP */
        .modal-backdrop {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.55);
            backdrop-filter: blur(6px);
            display: flex;
            justify-content: center;
            align-items: center;
            visibility: hidden;
            opacity: 0;
            transition: 0.35s ease;
            z-index: 1500;
        }

        .modal-backdrop:target {
            visibility: visible;
            opacity: 1;
        }

        /* GLASS CONTAINER */
        .modal-glass {
            background: rgba(255,255,255,0.87);
            backdrop-filter: blur(12px);
            border-radius: 22px;
            padding: 40px 45px;
            width: 95%;
            max-width: 480px;
            box-shadow: 0 25px 55px rgba(0,0,0,0.25);
            animation: slideUp 0.35s ease;
        }

        @keyframes slideUp {
            from { transform: translateY(40px); opacity: 0; }
            to   { transform: translateY(0); opacity: 1; }
        }

        /* HEADER */
        .modal-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .modal-icon {
            font-size: 45px;
            margin-bottom: 10px;
        }

        .modal-title {
            font-size: 26px;
            font-weight: 700;
            color: #002147;
        }

        .modal-subtitle {
            font-size: 16px;
            color: #445;
            margin-top: 8px;
        }

        /* COURSE CARD */
        .modal-course-card {
            background: linear-gradient(135deg, #eef3ff, #ffffff);
            border-radius: 16px;
            padding: 22px 28px;
            border: 1px solid #d8e2ff;
            box-shadow: 0 4px 20px rgba(0,40,120,0.07);
            margin-bottom: 30px;
        }

        .course-title {
            font-size: 20px;
            font-weight: 700;
            color: #003366;
            margin-bottom: 8px;
        }

        .course-line {
            width: 60px;
            height: 3px;
            background: #005bbb;
            border-radius: 10px;
            margin-bottom: 18px;
        }

        /* INFO ROWS */
        .course-info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .label {
            color: #555;
            font-weight: 600;
        }

        .value {
            color: #002147;
            font-weight: 700;
        }

        /* NO DATA */
        .no-data {
            color: #666;
            font-size: 15px;
            text-align: center;
        }

        /* BUTTON */
        .modal-btn {
            display: block;
            background: #003366;
            color: white;
            text-align: center;
            padding: 14px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: 600;
            text-decoration: none;
            transition: 0.25s;
        }

        .modal-btn:hover {
            background: #001f4d;
            transform: translateY(-3px);
        }

        /* Click backdrop to close */
        .modal-backdrop-close {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }


        .course-item.equiv-yes {
            background: #e7ffe7 !important;
            border-left: 6px solid #2ecc71;
        }

        .course-item.equiv-no {
            background: #ffe7e7 !important;
            border-left: 6px solid #e74c3c;
        }

        .selected-box {
            margin-top: 15px;
        }

        .selected-item {
            background: #dfe9ff;
            padding: 12px 15px;
            border-radius: 12px;
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: 600;
        }

        .remove-btn {
            background: #e74c3c;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 6px 12px;
            cursor: pointer;
            font-size: 14px;
        }

        .remove-btn:hover {
            background: #c0392b;
        }

        .notice-box {
            background: #fff8d8;
            border-left: 5px solid #f4c542;
            padding: 10px 16px;
            border-radius: 10px;
            font-size: 13px;
            color: #7a6300;
            max-width: 850px;
            margin: 0 auto 25px auto;
            box-shadow: 0px 2px 6px rgba(0,0,0,0.06);
            line-height: 1.4;
            text-align: left;
        }

        /* χρώμα στο SELECT μετά την επιλογή */
        select.equiv-yes {
            background-color: #e7ffe7 !important;
            border-color: #2ecc71 !important;
            color: #1f7a1f;
            font-weight: 600;
        }

        select.equiv-no {
            background-color: #ffe7e7 !important;
            border-color: #e74c3c !important;
            color: #8b1a1a;
            font-weight: 600;
        }

        .custom-select {
            position: relative;
            margin-bottom: 12px;
        }

        .custom-select .selected {
            padding: 14px 18px;
            border-radius: 12px;
            border: 2px solid #ccd9f6;
            background: #f7faff;
            cursor: pointer;
            font-weight: 500;
        }

        .custom-select .options {
            display: none;
            position: absolute;
            width: 100%;
            background: white;
            border-radius: 12px;
            margin-top: 6px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            max-height: 260px;
            overflow-y: auto;
            z-index: 999;
        }

        .custom-select.open .options {
            display: block;
        }

        .option {
            padding: 12px 16px;
            cursor: pointer;
            font-size: 15px;
        }

        .option:hover {
            opacity: 0.9;
        }

        /* ΧΡΩΜΑΤΑ */
        .option.equiv-yes {
            background: #e7ffe7;
            color: #1f7a1f;
        }

        .option.equiv-no {
            background: #ffe7e7;
            color: #8b1a1a;
        }

        .title-with-back {
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        /* ===== MODERN BACK BUTTON ===== */
        .modern-back-btn {
            position: absolute;
            left: 0;

            display: flex;
            align-items: center;
            gap: 10px;

            padding: 10px 18px;
            border-radius: 999px;

            background: linear-gradient(135deg, #003366, #005bbb);
            color: white;

            border: none;
            cursor: pointer;

            font-size: 14px;
            font-weight: 600;
            letter-spacing: 0.3px;

            box-shadow:
                0 6px 18px rgba(0, 40, 120, 0.25),
                inset 0 0 0 1px rgba(255,255,255,0.15);

            transition: all 0.3s ease;
        }

        .modern-back-btn:hover {
            transform: translateX(-6px);
            box-shadow:
                0 10px 26px rgba(0, 40, 120, 0.35),
                inset 0 0 0 1px rgba(255,255,255,0.25);
        }

        .modern-back-btn:active {
            transform: translateX(-3px) scale(0.98);
        }

        /* Arrow */
        .back-icon {
            font-size: 18px;
            line-height: 1;
        }

        /* Text */
        .back-text {
            opacity: 0.95;
        }

        /* Center title */
        .title-center {
            text-align: center;
        }




    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<main>
    <div class="container">

        <%
            University uni = (University) request.getAttribute("university");
            Map<Integer, List<CourseDet>> detCourses =
                    (Map<Integer, List<CourseDet>>) request.getAttribute("detCourses");

            Map<Integer, Boolean> hasEquiv =
                    (Map<Integer, Boolean>) request.getAttribute("hasEquiv");

            List<CourseDet> coreMandatory7 = (List<CourseDet>) request.getAttribute("coreMandatory7");
            List<String> orientations7 = (List<String>) request.getAttribute("orientations7");

            double lat = uni.getLatitude();
            double lng = uni.getLongitude();

            String googleEmbed = "https://www.google.com/maps?q=" + lat + "," + lng + "&hl=en&z=15&output=embed";
            String googleLink = "https://www.google.com/maps?q=" + lat + "," + lng + "&hl=en";
        %>


        <div class="title-box title-with-back">
            <button class="modern-back-btn" onclick="history.back()">
                <span class="back-icon">←</span>
                <span class="back-text">Universities</span>
            </button>

            <div class="title-center">
                <h1>DMST Course Program</h1>
                <h3>
                    Available courses for:
                    <strong><%= uni.getUniversityName() %></strong>
                </h3>
            </div>
        </div>



        <!-- MAP -->
        <div class="map-box image-box">
            <a href="<%= googleLink %>" target="_blank">
                <img 
                    src="<%= uni.getImageUrl() %>" 
                    alt="University image"
                    class="university-image"
                />
                <div class="image-overlay">
                    📍 View on Map
                </div>
            </a>
        </div>


        <div class="notice-box">
            ⚠️ <b>Important Note:</b><br>
            The course equivalences shown below are based on past Erasmus approvals and should be used for guidance only.
            University courses and equivalence rules may have changed. Always confirm final equivalences with the Erasmus Office.
        </div>
        
        <%
            String selected = (String) request.getAttribute("selectedOrientation");
            String selected7 = (String) request.getAttribute("selectedOrientation7");
        %>

        <!-- SEMESTERS 1–7 -->
        <div class="semester-grid">
            <% for (int sem = 1; sem <= 5; sem++) { %>
                <div class="semester-card">
                    <div class="semester-title">Semester <%= sem %></div>

                    <% 
                        List<CourseDet> list = detCourses.get(sem);
                        if (list != null) {
                            for (CourseDet c : list) {
                    %>

                        <div class="course-item <%= Boolean.TRUE.equals(hasEquiv.get(c.getId())) ? "equiv-yes" : "equiv-no" %>"
                            onclick="openCourseModal(<%= c.getId() %>)">

                            <div class="course-name">
                                <%= c.getCourseName() %>
                                <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                            </div>

                            <div class="course-info">
                                Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %>
                            </div>

                        </div>

                    <% 
                            }
                        }
                    %>

                </div>
            <% } %>


            <!-- SEMESTER 6 -->
            <div class="semester-card">
                <div class="semester-title">Semester 6</div>
                <div id="semester6-content">
                    <!-- φορτώνεται με AJAX -->
                </div>
            </div>

            <!-- SEMESTER 7 -->
            <div class="semester-card">
                <div class="semester-title">Semester 7</div>
                <div id="semester7-content">
                    <!-- φορτώνεται με AJAX -->
                </div>
            </div>

        </div>

</main>

    <div id="course-modal" class="modal-backdrop">
        <div class="modal-glass">

            <% 
                List<com.erasmus.web.model.CourseExternal> eq =
                    (List<com.erasmus.web.model.CourseExternal>) request.getAttribute("equivalents");

                Integer timesMatched = (Integer) request.getAttribute("timesMatched");
                if (timesMatched == null) timesMatched = 0;
            %>

            <!-- HEADER -->
            <div class="modal-header">
                <div class="modal-icon">🎓</div>
                <div class="modal-title">Equivalent Course Found</div>
                <div class="modal-subtitle">
                    This match is based on past Erasmus approvals and may not reflect current course rules.
                </div>
            </div>

            <% if (eq != null && !eq.isEmpty()) { %>

                <div class="modal-course-card">
                    <div class="course-title"><%= eq.get(0).getCourseName() %></div>
                    <div class="course-line"></div>

                    <div class="course-info-row">
                        <span class="label">Code:</span>
                        <span class="value"><%= eq.get(0).getCourseCode() %></span>
                    </div>

                    <div class="course-info-row">
                        <span class="label">ECTS:</span>
                        <span class="value"><%= eq.get(0).getEcts() %></span>
                    </div>

                    <div class="course-info-row">
                        <span class="label">Times Matched:</span>
                        <span class="value">
                            <%= timesMatched %> time(s)
                            <span style="font-size:13px; color:#666;">
                                in previous years
                            </span>
                        </span>
                    </div>
                </div>

            <% } else { %>

                <div class="modal-course-card">
                    <div class="course-title">No Equivalent Courses Found</div>
                    <div class="course-line"></div>
                    <p class="no-data">
                        There is no historical equivalence recorded for this course.
                    </p>
                </div>

            <% } %>

            <a href="#" class="modal-btn">Close</a>
            <a href="#" class="modal-backdrop-close"></a>

        </div>
    </div>




    <%@ include file="footer.jsp" %>
    <script>
        const UNIVERSITY_ID = <%= uni.getUniversityId() %>;
        let selectedOrientation = "<%= selected != null ? selected : "" %>";
        let selectedOrientation7 = "<%= selected7 != null ? selected7 : "" %>";


        function loadSemester6(orientation) {
            if (orientation === null) {
                selectedOrientation = "";
            } else {
                selectedOrientation = orientation;
            }

            let url = "UniversityDetailsServlet?ajax=load6&id=" + UNIVERSITY_ID;

            if (selectedOrientation) {
                url += "&orientation=" + encodeURIComponent(selectedOrientation);
            }

            fetch(url)
                .then(r => r.text())
                .then(html => {
                    document.getElementById("semester6-content").innerHTML = html;
                });
        }


        function loadSemester7(orientation) {
            if (orientation === null) {
                selectedOrientation7 = "";
            } else {
                selectedOrientation7 = orientation;
            }

            let url = "UniversityDetailsServlet?ajax=load7&id=" + UNIVERSITY_ID;

            if (selectedOrientation7) {
                url += "&orientation7=" + encodeURIComponent(selectedOrientation7);
            }

            fetch(url)
                .then(r => r.text())
                .then(html => {
                    document.getElementById("semester7-content").innerHTML = html;
                });
        }



        let selectedElective6 = null;

        function toggleDropdown(sem) {
            document.getElementById("elective" + sem)
                .classList.toggle("open");
        }

        function selectElective(sem, id, name) {
            if (sem === 6) {
                selectedElective6 = id;
            } else if (sem === 7) {
                selectedElective7 = id;
            }

            const box = document.querySelector("#elective" + sem + " .selected");
            box.innerText = name;

            document.getElementById("elective" + sem)
                .classList.remove("open");
        }


        function addElective6() {
            if (!selectedElective6) return;

            let url = "UniversityDetailsServlet?ajax=add6"
                + "&id=" + UNIVERSITY_ID
                + "&add6=" + selectedElective6
                + "&orientation=" + encodeURIComponent(selectedOrientation);

            fetch(url)
                .then(r => r.text())
                .then(html => {
                    document.getElementById("semester6-content").innerHTML = html;
                });
        }

        function addElective7() {
            if (!selectedElective7) return;

            let url = "UniversityDetailsServlet?ajax=add7"
                + "&id=" + UNIVERSITY_ID
                + "&add7=" + selectedElective7
                + "&orientation7=" + encodeURIComponent(selectedOrientation7);

            fetch(url)
                .then(r => r.text())
                .then(html => {
                    document.getElementById("semester7-content").innerHTML = html;
                });
        }


        function removeElective6(courseId) {
            let url = "UniversityDetailsServlet?ajax=remove6"
                + "&id=" + UNIVERSITY_ID
                + "&remove6=" + courseId;
            if (selectedOrientation) {
                url += "&orientation=" + encodeURIComponent(selectedOrientation);
            }


            fetch(url)
                .then(r => r.text())
                .then(html => {
                    document.getElementById("semester6-content").innerHTML = html;
                });
        }

        function removeElective7(courseId) {
            let url = "UniversityDetailsServlet?ajax=remove7"
                + "&id=" + UNIVERSITY_ID
                + "&remove7=" + courseId;

            if (selectedOrientation7) {
                url += "&orientation7=" + encodeURIComponent(selectedOrientation7);
            }

            if (selectedOrientation) {
                url += "&orientation=" + encodeURIComponent(selectedOrientation);
            }


            fetch(url)
                .then(r => r.text())
                .then(html => {
                    document.getElementById("semester7-content").innerHTML = html;
                });
        }
        function openCourseModal(courseId) {
            fetch(
                "UniversityDetailsServlet"
                + "?ajax=courseModal"
                + "&id=<%= uni.getUniversityId() %>"
                + "&detId=" + courseId
            )
            .then(r => r.text())
            .then(html => {
                const old = document.getElementById("course-modal");
                if (old) old.remove();

                document.body.insertAdjacentHTML("beforeend", html);
                location.hash = "course-modal";
            });
        }
        /* ====== ΧΡΩΜΑ SELECT ΓΙΑ SEMESTER 6 ====== */
        document.addEventListener("change", function (e) {
            if (e.target && e.target.id === "add6-select") {
                const select = e.target;
                const option = select.selectedOptions[0];

                select.classList.remove("equiv-yes", "equiv-no");

                if (option && option.classList.length > 0) {
                    select.classList.add(option.className);
                }
            }
        });

        /* ====== ΧΡΩΜΑ SELECT ΓΙΑ SEMESTER 7 ====== */
        document.addEventListener("change", function (e) {
            if (e.target && e.target.id === "add7-select") {
                const select = e.target;
                const option = select.selectedOptions[0];

                select.classList.remove("equiv-yes", "equiv-no");

                if (option && option.classList.length > 0) {
                    select.classList.add(option.className);
                }
            }
        });


        window.addEventListener("DOMContentLoaded", () => {
            loadSemester6(selectedOrientation || null);
            loadSemester7(selectedOrientation7 || null);
        });



    </script>

    </body>
</html>
