<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.erasmus.web.model.CourseDet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Select DMST Courses</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
<<<<<<< HEAD
        body { font-family: 'Poppins', sans-serif; background: #eef3ff; margin: 0; font-size: 18px; }
        .container { max-width: 1400px; margin: 40px auto; padding: 0 25px; }
        .title-box { text-align: center; margin-bottom: 40px; }
        .title-box h1 { font-size: 42px; color: #002147; font-weight: 700; }
        .semester-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(410px, 1fr)); gap: 30px; }
        .semester-card { background: #fff; border-radius: 18px; box-shadow: 0 5px 30px rgba(0,0,0,0.12); padding: 30px; }
        .semester-title { font-size: 26px; font-weight: 600; color: #003366; margin-bottom: 20px; }
=======

        body {
            font-family: 'Poppins', sans-serif;
            background: #eef3ff;
            margin: 0;
            font-size: 17px;
        }

        .container {
            max-width: 1400px;
            margin: 40px auto;
            padding: 0 25px;
        }

        .title-box h1 {
            font-size: 44px;
            font-weight: 700;
            color: #002147;
            text-align: center;
            margin-bottom: 10px;
        }

        .title-box p {
            text-align: center;
            color: #556;
            margin-bottom: 30px;
        }

        /* GRID */
        .semester-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(420px, 1fr));
            gap: 30px;
        }

        /* SEMESTER CARD */
        .semester-card {
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 26px rgba(0,0,0,0.15);
            transition: 0.25s ease;
        }

        .semester-card:hover {
            transform: translateY(-5px);
        }

        .semester-title {
            font-size: 27px;
            font-weight: 600;
            color: #003366;
            margin-bottom: 20px;
        }
>>>>>>> 66da0a6 (f1)

        /* COURSE SELECTION BUTTON STYLE */
        .course-item {
<<<<<<< HEAD
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

=======
            padding: 16px 18px;
            background: #f3f6ff;
            border-radius: 14px;
            margin-bottom: 14px;
            cursor: pointer;
            transition: 0.25s ease;
            border: 2px solid transparent;
        }

        .course-item:hover {
            background: #e5edff;
        }

        .course-item.selected {
            background: #cfe1ff;
            border-color: #003b80;
            transform: scale(1.02);
        }

        .course-name {
            font-weight: 600;
            font-size: 17px;
        }

        /* ELECTIVES DROPDOWN */
        .dropdown-header {
            margin-top: 12px;
            background: #e8efff;
            padding: 12px 15px;
            border-radius: 12px;
            cursor: pointer;
            font-weight: 600;
            color: #003366;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: 0.25s;
        }

        .dropdown-header:hover {
            background: #d7e6ff;
        }

        .dropdown-content {
            display: none;
            margin-top: 10px;
        }

        .dropdown-content.open {
            display: block;
        }

        /* BUTTONS */
        .orientation-btn {
            display: block;
            padding: 14px;
            background: #e7edff;
            margin-bottom: 10px;
            color: #003366;
            font-weight: 600;
            text-align: center;
            border-radius: 10px;
            transition: 0.25s;
            text-decoration: none;
        }

>>>>>>> 66da0a6 (f1)
        .orientation-btn:hover {
            background: #d8e4ff;
            transform: translateY(-3px);
        }


        .back-btn {
<<<<<<< HEAD
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
=======
            display: inline-block;
            margin: 10px 0 18px;
            padding: 8px 18px;
            background: #003366;
            color: white;
            border-radius: 8px;
            text-decoration: none;
>>>>>>> 66da0a6 (f1)
        }

        /* SUBMIT BUTTON */
        .submit-btn {
<<<<<<< HEAD
            display: block; margin: 40px auto;
            padding: 16px 40px; background: #003366;
            color: white; border-radius: 14px;
            border: none; font-size: 18px;
=======
            display: block;
            margin: 40px auto 0;
            padding: 18px 42px;
            background: linear-gradient(135deg, #003b80, #002147);
            color: white;
            border: none;
            border-radius: 14px;
            font-size: 20px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.25s;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 26px rgba(0,0,0,0.2);
>>>>>>> 66da0a6 (f1)
        }

    </style>

    <script>
        // Highlight selected course
        function toggleSelect(el) {
            el.classList.toggle("selected");
            const box = el.querySelector("input");
            box.checked = !box.checked;
        }

        // Dropdown toggle
        function toggleDropdown(id) {
            document.getElementById(id).classList.toggle("open");
        }
    </script>

</head>

<body>

<%@ include file="header.jsp" %>

<main>
<div class="container">

    <div class="title-box">
<<<<<<< HEAD
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

=======
        <h1>Select DMST Courses</h1>
        <p>Choose the courses you want to match. We will find the 3 best partner universities for you.</p>
    </div>

    <%
        Map<Integer, List<CourseDet>> detCourses = (Map<Integer, List<CourseDet>>) request.getAttribute("detCourses");
        List<String> orientations = (List<String>) request.getAttribute("orientations");

        String selected6 = request.getParameter("orientation6");
        String selected7 = request.getParameter("orientation7");

        List<CourseDet> core6 = (List<CourseDet>) request.getAttribute("coreMandatory6");
        List<CourseDet> mand6 = (List<CourseDet>) request.getAttribute("mandatory6");
        List<CourseDet> elec6 = (List<CourseDet>) request.getAttribute("electives6");

        List<CourseDet> core7 = (List<CourseDet>) request.getAttribute("coreMandatory7");
        List<CourseDet> mand7 = (List<CourseDet>) request.getAttribute("mandatory7");
        List<CourseDet> elec7 = (List<CourseDet>) request.getAttribute("electives7");
    %>

    <form action="/ismgroup29/FindBestUniversities" method="post">

        <div class="semester-grid">

            <!-- SEMESTERS 1–5 -->
            <% for (int sem = 1; sem <= 5; sem++) {
                List<CourseDet> list = detCourses.get(sem); %>

                <div class="semester-card">
                    <div class="semester-title">Semester <%= sem %></div>

                    <% for (CourseDet c : list) { %>
                        <div class="course-item" onclick="toggleSelect(this)">
                            <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>" hidden>
                            <div>
                                <div class="course-name"><%= c.getCourseName() %> — <%= c.getEcts() %> ECTS</div>
                                <div style="font-size:14px;color:#666;">Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %></div>
                            </div>
                        </div>
                    <% } %>
                </div>

            <% } %>

            <!-- SEMESTER 6 -->
            <div class="semester-card">
                <div class="semester-title">Semester 6</div>

                <h3>Mandatory (all orientations)</h3>

                <% for (CourseDet c : core6) { %>
                    <div class="course-item" onclick="toggleSelect(this)">
                        <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>" hidden>
                        <div class="course-name"><%= c.getCourseName() %> — <%= c.getEcts() %> ECTS</div>
                    </div>
                <% } %>

                <% if (selected6 == null) { %>
                    <h3>Select Orientation</h3>

                    <% for (String o : orientations) {
                        String enc = java.net.URLEncoder.encode(o, "UTF-8"); %>

                        <a href="/ismgroup29/CourseMatchSelect?orientation6=<%= enc %>" class="orientation-btn"><%= o %></a>

                    <% } %>

                <% } else { %>

                    <a href="/ismgroup29/CourseMatchSelect" class="back-btn">← Back</a>

                    <h3>Mandatory — <%= selected6 %></h3>

                    <% for (CourseDet c : mand6) { %>
                        <div class="course-item" onclick="toggleSelect(this)">
                            <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>" hidden>
                            <div class="course-name"><%= c.getCourseName() %> — <%= c.getEcts() %> ECTS</div>
                        </div>
                    <% } %>

                    <!-- Electives Dropdown -->
                    <div class="dropdown-header" onclick="toggleDropdown('dropdown6')">
                        Electives (Click to expand)
                        <i class="fa-solid fa-chevron-down"></i>
                    </div>

                    <div class="dropdown-content" id="dropdown6">
                        <% for (CourseDet c : elec6) { %>
                            <div class="course-item" onclick="toggleSelect(this)">
                                <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>" hidden>
                                <div class="course-name"><%= c.getCourseName() %> — <%= c.getEcts() %> ECTS</div>
                            </div>
                        <% } %>
                    </div>

                <% } %>
            </div>

            <!-- SEMESTER 7 -->
            <div class="semester-card">
                <div class="semester-title">Semester 7</div>

                <h3>Mandatory (all orientations)</h3>

                <% for (CourseDet c : core7) { %>
                    <div class="course-item" onclick="toggleSelect(this)">
                        <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>" hidden>
                        <div class="course-name"><%= c.getCourseName() %> — <%= c.getEcts() %> ECTS</div>
                    </div>
                <% } %>

                <% if (selected7 == null) { %>

                    <h3>Select Orientation</h3>

                    <% for (String o : orientations) {
                        String enc7 = java.net.URLEncoder.encode(o, "UTF-8"); %>

                        <a href="/ismgroup29/CourseMatchSelect?orientation7=<%= enc7 %>" class="orientation-btn"><%= o %></a>

                    <% } %>

                <% } else { %>

                    <a href="/ismgroup29/CourseMatchSelect" class="back-btn">← Back</a>

                    <h3>Mandatory — <%= selected7 %></h3>

                    <% for (CourseDet c : mand7) { %>
                        <div class="course-item" onclick="toggleSelect(this)">
                            <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>" hidden>
                            <div class="course-name"><%= c.getCourseName() %> — <%= c.getEcts() %> ECTS</div>
                        </div>
                    <% } %>

                    <!-- Electives Dropdown -->
                    <div class="dropdown-header" onclick="toggleDropdown('dropdown7')">
                        Electives (Click to expand)
                        <i class="fa-solid fa-chevron-down"></i>
                    </div>

                    <div class="dropdown-content" id="dropdown7">
                        <% for (CourseDet c : elec7) { %>
                            <div class="course-item" onclick="toggleSelect(this)">
                                <input type="checkbox" name="selectedCourse" value="<%= c.getCourseCode() %>" hidden>
                                <div class="course-name"><%= c.getCourseName() %> — <%= c.getEcts() %> ECTS</div>
                            </div>
                        <% } %>
                    </div>

>>>>>>> 66da0a6 (f1)
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
