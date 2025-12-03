<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.erasmus.web.model.CourseDet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Select Courses to Match</title>

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
            margin: 40px auto;
            padding: 0 25px;
        }

        .title-box {
            text-align: center;
            margin-bottom: 40px;
        }

        .title-box h1 {
            font-size: 42px;
            color: #002147;
            font-weight: 700;
        }

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
            font-size: 26px;
            font-weight: 600;
            color: #003366;
            margin-bottom: 20px;
        }

        .course-item {
            display: flex;
            align-items: flex-start;
            background: #f3f6ff;
            padding: 16px 20px;
            border-radius: 14px;
            margin-bottom: 16px;
            text-decoration: none;
            color: inherit;
            transition: 0.25s;
            gap: 14px;
        }

        .course-item:hover {
            background: #e7edff;
        }

        .course-name {
            font-weight: 600;
            color: #222;
            font-size: 17px;
            margin-bottom: 4px;
        }

        .course-info {
            font-size: 14px;
            color: #666;
        }

        .ects-badge {
            background: #005bbb;
            padding: 6px 14px;
            color: white;
            border-radius: 15px;
            font-size: 13px;
            margin-left: 10px;
            white-space: nowrap;
        }

        /* Orientation Button */
        .orientation-btn {
            width: 100%;
            background: #e7edff;
            border: none;
            padding: 16px 20px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            color: #003366;
            cursor: pointer;
            margin-bottom: 12px;
            transition: 0.25s;
        }
        .orientation-btn:hover {
            background: #d8e4ff;
            transform: translateY(-3px);
        }

        .back-btn {
            display: inline-block;
            margin-bottom: 18px;
            padding: 9px 16px;
            background: #003366;
            color: white;
            border-radius: 8px;
            font-size: 15px;
            text-decoration: none;
            transition: 0.25s;
        }

        .back-btn:hover {
            background: #001f4d;
            transform: translateX(-3px);
        }

        /* SELECT DROPDOWN */
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
        .select-wrapper::after {
            content: "▼";
            position: absolute;
            right: 18px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 12px;
            color: #003366;
            pointer-events: none;
        }

        .submit-btn {
            display: block;
            margin: 40px auto;
            padding: 16px 40px;
            background: #003366;
            color: white;
            border-radius: 14px;
            border: none;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.25s;
        }
        .submit-btn:hover {
            background: #001f4d;
            transform: translateY(-3px);
        }
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<main>
    <div class="container">

        <div class="title-box">
            <h1>Select Courses to Match</h1>
        </div>

        <form action="FindBestUniversities" method="post">

            <div class="semester-grid">

                <!-- ------- SEMESTERS 1–5 ------- -->
                <%
                    Map<Integer, List<CourseDet>> detCourses =
                        (Map<Integer, List<CourseDet>>) request.getAttribute("detCourses");

                    for (int sem = 1; sem <= 5; sem++) {
                        List<CourseDet> list = detCourses.get(sem);
                %>
                <div class="semester-card">
                    <div class="semester-title">Semester <%= sem %></div>

                    <% for (CourseDet c : list) { %>
                        <label class="course-item">
                            <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">

                            <div>
                                <div class="course-name">
                                    <%= c.getCourseName() %>
                                    <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                                </div>

                                <div class="course-info">
                                    Code: <%= c.getCourseCode() %> |
                                    Period: <%= c.getPeriod() %>
                                </div>
                            </div>
                        </label>
                    <% } %>
                </div>
                <% } %>

                <!-- ------- SEMESTER 6 ------- -->
                <%
                    List<CourseDet> core6 = (List<CourseDet>) request.getAttribute("coreMandatory6");
                    List<String> orientations = (List<String>) request.getAttribute("orientations");
                    String selected6 = (String) request.getAttribute("selected6");
                %>

                <div class="semester-card">
                    <div class="semester-title">Semester 6</div>

                    <h3>Mandatory (all orientations)</h3>

                    <% for (CourseDet c : core6) { %>
                        <label class="course-item">
                            <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">
                            <div>
                                <div class="course-name">
                                    <%= c.getCourseName() %>
                                    <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                                </div>
                            </div>
                        </label>
                    <% } %>

                    <% if (selected6 == null) { %>
                        <h3>Select Orientation</h3>

                        <% for (String o : orientations) { %>
                        <form method="get" action="CourseMatchSelect">
                            <input type="hidden" name="orientation6" value="<%= o %>">
                            <button class="orientation-btn"><%= o %></button>
                        </form>
                        <% } %>

                    <% } else { %>

                        <a href="CourseMatchSelect" class="back-btn">← Back</a>

                        <h3>Mandatory — <%= selected6 %></h3>

                        <%
                            List<CourseDet> mand6 = (List<CourseDet>) request.getAttribute("mandatory6");
                            for (CourseDet c : mand6) {
                        %>
                            <label class="course-item">
                                <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">
                                <div class="course-name">
                                    <%= c.getCourseName() %>
                                    <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                                </div>
                            </label>
                        <% } %>

                        <h3>Electives</h3>
                        <div class="select-wrapper">
                            <select class="styled-select">
                                <option value="">-- Select elective --</option>
                                <%
                                    List<CourseDet> elec6 = 
                                        (List<CourseDet>) request.getAttribute("electives6");
                                    for (CourseDet c : elec6) {
                                %>
                                    <option><%= c.getCourseName() %> (<%= c.getEcts() %> ECTS)</option>
                                <% } %>
                            </select>
                        </div>

                    <% } %>
                </div>

                <!-- ------- SEMESTER 7 ------- -->
                <%
                    List<CourseDet> core7 = (List<CourseDet>) request.getAttribute("coreMandatory7");
                    String selected7 = (String) request.getAttribute("selected7");
                %>

                <div class="semester-card">
                    <div class="semester-title">Semester 7</div>

                    <h3>Mandatory (all orientations)</h3>

                    <% for (CourseDet c : core7) { %>
                        <label class="course-item">
                            <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">
                            <div class="course-name">
                                <%= c.getCourseName() %>
                                <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                            </div>
                        </label>
                    <% } %>

                    <% if (selected7 == null) { %>
                        <h3>Select Orientation</h3>

                        <% for (String o : orientations) { %>
                            <form method="get" action="CourseMatchSelect">
                                <input type="hidden" name="orientation7" value="<%= o %>">
                                <button class="orientation-btn"><%= o %></button>
                            </form>

                        <% } %>

                    <% } else { %>

                        <a href="CourseMatchSelect" class="back-btn">← Back</a>

                        <h3>Mandatory — <%= selected7 %></h3>

                        <%
                            List<CourseDet> mand7 =
                                (List<CourseDet>) request.getAttribute("mandatory7");
                            for (CourseDet c : mand7) {
                        %>
                            <label class="course-item">
                                <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">
                                <div class="course-name">
                                    <%= c.getCourseName() %>
                                    <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                                </div>
                            </label>
                        <% } %>

                        <h3>Electives</h3>
                        <div class="select-wrapper">
                            <h3>Elective Courses</h3>

                            <% for (CourseDet c : elec6) { %>
                                <label class="course-item">
                                    <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">

                                    <div>
                                        <div class="course-name">
                                            <%= c.getCourseName() %>
                                            <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                                        </div>
                                        <div class="course-info">
                                            Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %>
                                        </div>
                                    </div>
                                </label>
                            <% } %>

                        </div>

                    <% } %>
                </div>

            </div> <!-- semester grid -->

            <button type="submit" class="submit-btn">Find Best Universities</button>
        </form>

    </div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>
