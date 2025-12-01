<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.erasmus.web.model.Country" %>
<%@ page import="com.erasmus.web.model.University" %>

<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <title>Erasmus+ Universities</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        html, body {
            height: 100%;
            margin: 0;
        }

        body {
            background: #eef3ff;
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
            max-width: 1000px;
            margin: 40px auto;
            padding: 2rem;
        }

        .card {
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 6px 26px rgba(0,0,0,0.10);
        }

        h2 {
            font-size: 2rem;
            color: #002147;
            display: flex;
            align-items: center;
            gap: 12px;
            margin-top: 0;
            margin-bottom: 25px;
            font-weight: 700;
        }

        label {
            font-weight: 600;
            color: #003366;
            font-size: 1rem;
        }

        select {
            width: 100%;
            padding: 14px;
            margin-top: 8px;
            border-radius: 10px;
            border: 1px solid #cbd6ee;
            font-size: 1rem;
            background: #f9fbff;
            transition: 0.2s;
        }

        select:hover {
            border-color: #7aa7e8;
        }

        select:focus {
            outline: none;
            border-color: #003366;
            box-shadow: 0 0 6px rgba(0,70,140,0.3);
        }

        button {
            margin-top: 20px;
            padding: 14px;
            width: 100%;
            background: #003366;
            color: white;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            transition: 0.2s;
        }

        button:hover {
            background: #001f4d;
        }

        hr {
            margin: 35px 0;
            border: none;
            border-top: 1px solid #d4dbee;
        }

        .universities-list {
            display: grid;
            grid-template-columns: 1fr;
            gap: 15px;
        }

        .university-item {
            background: #f3f7ff;
            padding: 15px 18px;
            border-radius: 12px;
            font-weight: 600;
            color: #003366;
            border: 1px solid #d7e2f7;
            transition: 0.2s;
        }

        .university-item:hover {
            background: #e7edff;
            transform: translateX(5px);
        }

        .university-item a {
            text-decoration: none;
            color: #003366;
            display: block;
        }
        /* ===== Modern Select (NO JS) ===== */
        .select-wrapper {
            position: relative;
            width: 100%;
        }

        .custom-select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;

            width: 100%;
            padding: 14px 18px;
            font-size: 1rem;
            font-weight: 500;

            border-radius: 12px;
            border: 1px solid #c8d7f0;
            background: #f9fbff;

            color: #003366;
            cursor: pointer;
            transition: 0.25s ease;
        }

        /* Hover */
        .custom-select:hover {
            border-color: #7aa7e8;
        }

        /* Focus */
        .custom-select:focus {
            outline: none;
            border-color: #003366;
            box-shadow: 0 0 6px rgba(0, 70, 140, 0.3);
        }

        /* Dropdown arrow */
        .select-wrapper:after {
            content: "▼";
            font-size: 12px;
            color: #003366;

            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none;
        }

        /* ===== Modern Button ===== */
        .modern-btn {
            margin-top: 18px;
            padding: 14px;
            width: 100%;
            background: linear-gradient(135deg, #003b80, #002147);
            border: none;
            color: white;

            border-radius: 12px;
            font-size: 1.12rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.25s ease;
        }

        .modern-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
            background: linear-gradient(135deg, #004a9f, #002147);
        }

    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<main>

    <%
        List<Country> countries = (List<Country>) request.getAttribute("countries");
        List<University> universities = (List<University>) request.getAttribute("universities");
        String selectedCountryId = request.getAttribute("selectedCountryId") != null
                                   ? request.getAttribute("selectedCountryId").toString()
                                   : "";
    %>

    <div class="card">

        <h2><i class="fa-solid fa-globe"></i> Erasmus+ Universities</h2>

        <form method="get" action="universities">

            <label>Choose a country</label>

            <div class="select-wrapper">
                <select name="countryId" class="custom-select">
                    <option value="">-- Choose a country --</option>

                    <%
                        if (countries != null) {
                            for (Country c : countries) {
                    %>
                        <option value="<%= c.getCountryId() %>"
                            <%= selectedCountryId.equals(String.valueOf(c.getCountryId())) ? "selected" : "" %>>
                            <%= c.getCountryName() %>
                        </option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>

            <button type="submit" class="modern-btn">Load Universities</button>
        </form>

        <%
            if (universities != null) {
        %>

        <hr>


        <h3 style="color:#003366; font-size:1.4rem; margin-bottom:20px;">Available Universities</h3>

        <div class="universities-list">

        <%
            if (universities.isEmpty()) {
        %>
                <div style="background:#ffecec; color:#900; padding:12px; border-radius:10px;">
                    No universities found for this country.
                </div>
        <%
            } else {
                for (University u : universities) {
        %>

            <div class="university-item">
                <a href="UniversityDetailsServlet?id=<%= u.getUniversityId() %>">
                    <%= u.getUniversityName() %>
                </a>
            </div>

        <%
                }
            }
        %>

        </div>

        <%
            }
        %>
        <%
        List<University> allUnis = (List<University>) request.getAttribute("allUnis");
        %>

        <h3 style="color:#003366; font-size:1.4rem; margin:30px 0 15px;">
            All Partner Universities
        </h3>

        <div style="
            width:100%;
            height:450px;
            border-radius: 18px;
            overflow:hidden;
            box-shadow: 0 8px 26px rgba(0,0,0,0.20);
            margin-bottom:35px;">
            
            <iframe src="https://www.google.com/maps/d/embed?mid=1BrL8o3VWxsxsmxFSqdzUfcDYc7DVpb4&ehbc=2E312F&noprof=1" width="640" height="480"></iframe>

        </div>


    </div>

</main>

<%@ include file="footer.jsp" %>

</body>
</html>
