<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.erasmus.web.model.CourseDet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Select Courses to Match</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body { font-family: 'Poppins', sans-serif; background: #eef3ff; margin: 0; font-size: 18px; }
        .container { max-width: 1400px; margin: 40px auto; padding: 0 25px; }
        .title-box { text-align: center; margin-bottom: 40px; }
        .title-box h1 { font-size: 42px; color: #002147; font-weight: 700; }
        .semester-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(410px, 1fr)); gap: 30px; }
        .semester-card { background: #fff; border-radius: 18px; box-shadow: 0 5px 30px rgba(0,0,0,0.12); padding: 30px; }
        .semester-title { font-size: 26px; font-weight: 600; color: #003366; margin-bottom: 20px; }

        .course-item {
            display: flex; gap: 14px;
            padding: 16px 20px; background: #f3f6ff;
            border-radius: 14px; margin-bottom: 16px;
            text-decoration: none; color: inherit;
        }

        .orientation-btn {
            display: block;                    /* ← ΤΟ ΠΙΟ ΣΗΜΑΝΤΙΚΟ */
            width: 100%;
            padding: 16px 20px;
            margin-bottom: 12px;

            background: #e7edff;
            color: #003366;
            font-size: 16px;
            font-weight: 600;

            border-radius: 12px;
            text-decoration: none;
            cursor: pointer;

            transition: 0.25s;
        }

        .orientation-btn:hover {
            background: #d8e4ff;
            transform: translateY(-3px);
        }


        .back-btn {
            display: inline-block; margin-bottom: 18px;
            padding: 9px 16px; background: #003366;
            color: #fff; border-radius: 8px; text-decoration: none;
        }

        .select-wrapper { width: 100%; }
        .styled-select {
            width: 100%; padding: 14px 18px;
            border-radius: 12px; border: 2px solid #ccd9f6;
            background: #f7faff; font-size: 16px;
            appearance: none;
        }

        .submit-btn {
            display: block; margin: 40px auto;
            padding: 16px 40px; background: #003366;
            color: white; border-radius: 14px;
            border: none; font-size: 18px;
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

    <%
        Map<Integer, List<CourseDet>> detCourses =
            (Map<Integer, List<CourseDet>>) request.getAttribute("detCourses");

        List<String> orientations =
            (List<String>) request.getAttribute("orientations");

        // orientation selections
        String selected6 = (String) request.getParameter("orientation6");
        String selected7 = (String) request.getParameter("orientation7");

        // data for semester 6 & 7
        List<CourseDet> core6 = (List<CourseDet>) request.getAttribute("coreMandatory6");
        List<CourseDet> mand6 = (List<CourseDet>) request.getAttribute("mandatory6");
        List<CourseDet> elec6 = (List<CourseDet>) request.getAttribute("electives6");

        List<CourseDet> core7 = (List<CourseDet>) request.getAttribute("coreMandatory7");
        List<CourseDet> mand7 = (List<CourseDet>) request.getAttribute("mandatory7");
        List<CourseDet> elec7 = (List<CourseDet>) request.getAttribute("electives7");
    %>


    <!-- ORIENTATIONS HANDLED OUTSIDE THE MAIN FORM -->
    <%
        boolean show6 = (selected6 != null);
        boolean show7 = (selected7 != null);
    %>


    <!-- MAIN FORM — ONLY CHECKBOXES INSIDE -->
    <form action="FindBestUniversities" method="post">

        <div class="semester-grid">

            <!-- SEMESTERS 1–5 -->
            <%
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
                                Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %>
                            </div>
                        </div>
                    </label>
                <% } %>

            </div>
            <% } %>


            <!-- SEMESTER 6 -->
            <div class="semester-card">
                <div class="semester-title">Semester 6</div>

                <h3>Mandatory (all orientations)</h3>

                <% for (CourseDet c : core6) { %>
                    <label class="course-item">
                        <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">
                        <div class="course-name"><%= c.getCourseName() %> <span class="ects-badge"><%= c.getEcts() %> ECTS</span></div>
                    </label>
                <% } %>
                
                <% if (!show6) { %>

                    <h3>Select Orientation</h3>

                    <% for (String o : orientations) { 
                        String encodedO = java.net.URLEncoder.encode(o, "UTF-8").replace("+", "%2B");
                    %>

                        <form method="get" action="CourseMatchSelect">
                            <input type="hidden" name="orientation6" value="<%= encodedO %>">
                            <button class="orientation-btn"><%= o %></button>
                        </form>

                    <% } %>

                <% } else { %>


                    <a href="CourseMatchSelect" class="back-btn">← Back</a>

                    <h3>Mandatory — <%= selected6 %></h3>

                    <% for (CourseDet c : mand6) { %>
                        <label class="course-item">
                            <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">
                            <div class="course-name"><%= c.getCourseName() %> <span class="ects-badge"><%= c.getEcts() %> ECTS</span></div>
                        </label>
                    <% } %>

                    <h3>Electives</h3>
                    <% for (CourseDet c : elec6) { %>
                        <label class="course-item">
                            <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">
                            <div>
                                <div class="course-name"><%= c.getCourseName() %> <span class="ects-badge"><%= c.getEcts() %> ECTS</span></div>
                                <div class="course-info">Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %></div>
                            </div>
                        </label>
                    <% } %>

                <% } %>
            </div>


            <!-- SEMESTER 7 -->
            <div class="semester-card">
                <div class="semester-title">Semester 7</div>

                <h3>Mandatory (all orientations)</h3>

                <% for (CourseDet c : core7) { %>
                    <label class="course-item">
                        <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">
                        <div class="course-name"><%= c.getCourseName() %> <span class="ects-badge"><%= c.getEcts() %> ECTS</span></div>
                    </label>
                <% } %>

                <% if (!show7) { %>

                    <h3>Select Orientation</h3>
                    <% for (String o : orientations) { %>
                        <%
                            String encodedO7 = java.net.URLEncoder.encode(o, "UTF-8");
                        %>
                        <form method="get" action="CourseMatchSelect">
                            <input type="hidden" name="orientation7" value="<%= encodedO7 %>">
                            <button class="orientation-btn"><%= o %></button>
                        </form>
                    <% } %>


                <% } else { %>

                    <a href="CourseMatchSelect" class="back-btn">← Back</a>

                    <h3>Mandatory — <%= selected7 %></h3>

                    <% for (CourseDet c : mand7) { %>
                        <label class="course-item">
                            <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">
                            <div class="course-name"><%= c.getCourseName() %> <span class="ects-badge"><%= c.getEcts() %> ECTS</span></div>
                        </label>
                    <% } %>

                    <h3>Electives</h3>

                    <% for (CourseDet c : elec7) { %>
                        <label class="course-item">
                            <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>">
                            <div>
                                <div class="course-name"><%= c.getCourseName() %> <span class="ects-badge"><%= c.getEcts() %> ECTS</span></div>
                                <div class="course-info">Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %></div>
                            </div>
                        </label>
                    <% } %>

                <% } %>
            </div>

        </div>

        <button type="submit" class="submit-btn">Find Best Universities</button>

    </form>

</div>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>
