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

        /* COURSE ITEM */
        .course-item {
            background: #f3f6ff;
            padding: 18px 20px;
            border-radius: 14px;
            margin-bottom: 16px;
            transition: 0.2s;
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

            double lat = uni.getLatitude();
            double lng = uni.getLongitude();

            String googleEmbed = "https://www.google.com/maps?q=" + lat + "," + lng + "&hl=en&z=15&output=embed";
            String googleLink = "https://www.google.com/maps?q=" + lat + "," + lng + "&hl=en";
        %>

        <div class="title-box">
            <h1>DMST Course Program</h1>
            <h3>Available courses for: <strong><%= uni.getUniversityName() %></strong></h3>
        </div>

        <!-- MAP -->
        <div class="map-box">
            <iframe loading="lazy" src="<%= googleEmbed %>"></iframe>
            <a href="<%= googleLink %>" target="_blank" class="map-click-layer"></a>
        </div>

        <!-- SEMESTERS 1–6 -->
        <div class="semester-grid">

            <% for (int sem = 1; sem <= 5; sem++) { %>
                <div class="semester-card">
                    <div class="semester-title">Semester <%= sem %></div>

                    <% for (CourseDet c : detCourses.get(sem)) { %>
                        <div class="course-item">
                            <div class="course-name">
                                <%= c.getCourseName() %>
                                <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                            </div>
                            <div class="course-info">
                                Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %>
                            </div>
                        </div>
                    <% } %>
                </div>
            <% } %>

            <!-- SEMESTER 6 -->
            <div class="semester-card">
                <div class="semester-title">Semester 6</div>

                <%
                    List<String> orientations = (List<String>) request.getAttribute("orientations");
                    String selected = (String) request.getAttribute("selectedOrientation");
                    List<CourseDet> mand6 = (List<CourseDet>) request.getAttribute("mandatory6");
                    List<CourseDet> elec6 = (List<CourseDet>) request.getAttribute("electives6");
                %>
                <%
                    List<CourseDet> coreMandatory6 = (List<CourseDet>) request.getAttribute("coreMandatory6");
                %>
                <h3 class="orient-title">Mandatory Courses (for all orientations)</h3>

                <% for (CourseDet c : coreMandatory6) { %>
                    <div class="course-item">
                        <div class="course-name">
                            <%= c.getCourseName() %>
                            <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                        </div>
                        <div class="course-info">
                            Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %>
                        </div>
                    </div>
                <% } %>

                <% if (selected == null) { %>
                    

                    <h3 class="orient-title">Choose Orientation</h3>

                    <% for (String o : orientations) { %>
                        <form method="get" action="" style="margin:0;padding:0;">
                            <input type="hidden" name="id" value="<%= uni.getUniversityId() %>">
                            <input type="hidden" name="orientation" value="<%= o %>">

                            <button class="orientation-btn">
                                <%= o %>
                            </button>
                        </form>
                    <% } %>

                <% } else { %>

                    <!-- BACK BUTTON -->
                    <a href="?id=<%= uni.getUniversityId() %>" class="back-btn">
                        ← Back to Orientations
                    </a>

                    <h3 class="orient-title">
                        Mandatory Courses – <%= selected %>
                    </h3>

                    <% for (CourseDet c : mand6) { %>
                        <div class="course-item">
                            <div class="course-name">
                                <%= c.getCourseName() %>
                                <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                            </div>
                            <div class="course-info">
                                Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %>
                            </div>
                        </div>
                    <% } %>

                    <h3 class="electives-title">Elective Courses</h3>

                    <div class="select-wrapper">
                        <select class="styled-select">
                            <option value="">-- Select Elective Course --</option>
                            <% for (CourseDet c : elec6) { %>
                                <option><%= c.getCourseName() %> (<%= c.getEcts() %> ECTS)</option>
                            <% } %>
                        </select>
                    </div>

                <% } %>

            </div>
            <!-- SEMESTER 7 -->
            <div class="semester-card">
                <div class="semester-title">Semester 7</div>

                <%
                    List<CourseDet> coreMandatory7 = (List<CourseDet>) request.getAttribute("coreMandatory7");
                    List<String> orientations7 = (List<String>) request.getAttribute("orientations");

                    String selected7 = (String) request.getAttribute("selectedOrientation7");

                    List<CourseDet> mand7 = (List<CourseDet>) request.getAttribute("mandatory7");
                    List<CourseDet> elec7 = (List<CourseDet>) request.getAttribute("electives7");
                %>

                <h3 class="orient-title">Mandatory Courses (for all orientations)</h3>

                <% for (CourseDet c : coreMandatory7) { %>
                    <div class="course-item">
                        <div class="course-name">
                            <%= c.getCourseName() %>
                            <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                        </div>
                        <div class="course-info">
                            Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %>
                        </div>
                    </div>
                <% } %>

                <% if (selected7 == null) { %>

                    <h3 class="orient-title">Choose Orientation</h3>

                    <% for (String o : orientations7) { %>
                        <form method="get" action="" style="margin:0;padding:0;">
                            <input type="hidden" name="id" value="<%= uni.getUniversityId() %>">
                            <input type="hidden" name="orientation7" value="<%= o %>">

                            <button class="orientation-btn">
                                <%= o %>
                            </button>
                        </form>
                    <% } %>

                <% } else { %>

                    <a href="?id=<%= uni.getUniversityId() %>" class="back-btn">
                        ← Back to Orientations
                    </a>

                    <h3 class="orient-title">Mandatory Courses – <%= selected7 %></h3>

                    <% for (CourseDet c : mand7) { %>
                        <div class="course-item">
                            <div class="course-name">
                                <%= c.getCourseName() %>
                                <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                            </div>
                            <div class="course-info">
                                Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %>
                            </div>
                        </div>
                    <% } %>

                    <h3 class="electives-title">Elective Courses</h3>

                    <div class="select-wrapper">
                        <select class="styled-select">
                            <option value="">-- Select Elective Course --</option>
                            <% for (CourseDet c : elec7) { %>
                                <option><%= c.getCourseName() %> (<%= c.getEcts() %> ECTS)</option>
                            <% } %>
                        </select>
                    </div>

                <% } %>

            </div>




        </div>  <!-- close semester-grid -->

    </div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>
