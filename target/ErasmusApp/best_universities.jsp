<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.erasmus.web.model.University" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Top Matching Universities</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #d6e4ff 0%, #eef3ff 100%);
            margin: 0;
        }

        .container {
            max-width: 1150px;
            margin: 45px auto;
            padding: 0 20px;
        }

        h1 {
            text-align: center;
            font-size: 38px;
            font-weight: 700;
            color: #002147;
            margin-bottom: 40px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(340px, 1fr));
            gap: 28px;
        }

        .card {
            background: white;
            border-radius: 18px;
            padding: 26px;
            box-shadow: 0 5px 28px rgba(0,0,0,0.10);
            transition: 0.25s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 32px rgba(0,0,0,0.16);
        }

        .uni-name {
            font-size: 24px;
            font-weight: 700;
            color: #003366;
        }

        .score {
            margin-top: 8px;
            padding: 6px 16px;
            background: #003366;
            color: white;
            font-size: 13px;
            border-radius: 20px;
            display: inline-block;
        }

        .course-list {
            margin-top: 20px;
            padding: 0;
            list-style: none;
        }

        .course-item {
            padding: 10px 14px;
            border-radius: 12px;
            margin-bottom: 8px;
            font-size: 15px;
            font-weight: 500;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .match-yes {
            background: #e9ffe9;
            border-left: 5px solid #2ecc71;
            color: #1b7f3a;
        }

        .match-no {
            background: #ffeaea;
            border-left: 5px solid #e74c3c;
            color: #8b1e14;
        }

        .times-box {
            font-size: 12px;
            color: #555;
            margin-left: 8px;
        }

        .back-container {
            text-align: center;
            margin-top: 40px;
        }

        .back-btn {
            padding: 14px 34px;
            background: #003366;
            color: white;
            text-decoration: none;
            border-radius: 40px;
            font-weight: 600;
            transition: 0.25s ease;
        }

        .back-btn:hover {
            background: #001f4d;
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
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<main>

    <!-- Notice Box -->
    <div style="
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
    ">
        ⚠️ <b>Important Note:</b><br>
        The course equivalences shown below are based on past Erasmus approvals and should be used for guidance only.
        University courses and equivalence rules may have changed. Always confirm final equivalences with the Erasmus Office.
    </div>

    <div class="container">

        <h1>Your Best-Matching Universities</h1>

        <%
            List<Map.Entry<University, Integer>> top3 =
                (List<Map.Entry<University, Integer>>) request.getAttribute("top3");

            Map<String, String> courseNames =
                (Map<String, String>) request.getAttribute("courseNamesMap");

            Map<String, Boolean> matchMap =
                (Map<String, Boolean>) request.getAttribute("courseMatchInfo");

            String[] selectedCourses =
                (String[]) request.getAttribute("selectedCourses");

            Map<String, Map<Integer, Integer>> courseTimesMap =
                (Map<String, Map<Integer, Integer>>) request.getAttribute("courseTimesMap");
        %>

        <% if (top3 == null || top3.isEmpty()) { %>

            <p style="text-align:center; font-size:18px; color:#444;">
                No matching universities found for the selected courses.
            </p>

        <% } else { %>

        <div class="grid">

            <% for (Map.Entry<University, Integer> entry : top3) {
                    University u = entry.getKey();
                    int score = entry.getValue();
            %>

            <div class="card">

                <div class="uni-name"><%= u.getUniversityName() %></div>
                <div class="score">Matches: <%= score %></div>

                <ul class="course-list">
                    <% for (String code : selectedCourses) {

                        boolean match = matchMap.getOrDefault(code, false);
                        String name = courseNames.get(code);

                        int times = 0;
                        if (courseTimesMap.containsKey(code) &&
                            courseTimesMap.get(code).containsKey(u.getUniversityId())) {
                            times = courseTimesMap.get(code).get(u.getUniversityId());
                        }
                    %>

                   <li class="course-item <%= match ? "match-yes" : "match-no" %>">

                        <div style="display: flex; flex-direction: column; gap: 3px;">
                            <span><b><%= name %></b> (<%= code %>)</span>

                            <% if (times > 0) { %>
                                <span style="
                                    font-size: 12px;
                                    color: #2a5f2a;
                                    opacity: 0.85;
                                    margin-left: 4px;
                                ">
                                    Matched <b><%= times %></b> time(s) in past years
                                </span>
                            <% } else { %>
                                <span style="
                                    font-size: 12px;
                                    color: #8b1e14;
                                    opacity: 0.8;
                                    margin-left: 4px;
                                ">
                                    No recorded past matches
                                </span>
                            <% } %>
                        </div>

                        <span><%= match ? "✔" : "✘" %></span>
                    </li>


                    <% } %>
                </ul>

            </div>

            <% } %>

        </div>

        <% } %>

        <div class="back-container">
            <a href="CourseMatchSelect" class="back-btn">← Back to Course Selection</a>
        </div>

    </div>

</main>

<%@ include file="footer.jsp" %>

</body>
</html>
