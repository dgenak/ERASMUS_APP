<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.erasmus.web.model.Country" %>
<%@ page import="com.erasmus.web.model.University" %>

<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <title>Erasmus+ Universities</title>
    <link rel="stylesheet" href="css/style.css">
 

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>

        /* ================== PAGE LAYOUT (όπως index) ================== */
        .page-section {
        width: 100%;
        padding: 48px 0;
        background: #eef3ff;
        }

        .page-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 16px;
        }


        /* ================== CARD ================== */
        .content-card {
        background: #ffffff;
        border-radius: 20px;
        padding: 2.5rem;
        box-shadow: 0 10px 30px rgba(0,0,0,0.08);
        }

        /* ================== HEADINGS ================== */
        h2 {
        font-size: 2rem;
        color: #002147;
        display: flex;
        align-items: center;
        gap: 12px;
        margin: 0 0 25px;
        font-weight: 700;
        }

        label {
        font-weight: 600;
        color: #003366;
        font-size: 1rem;
        }

        /* ================== FORM ================== */
        .select-wrapper {
        position: relative;
        width: 100%;
        }

        .custom-select {
        width: 100%;
        padding: 14px 18px;
        font-size: 1rem;
        font-weight: 500;
        border-radius: 12px;
        border: 1px solid #c8d7f0;
        background: #f9fbff;
        color: #003366;
        cursor: pointer;
        appearance: none;
        }

        .select-wrapper::after {
        content: "▼";
        position: absolute;
        right: 16px;
        top: 50%;
        transform: translateY(-50%);
        font-size: 12px;
        color: #003366;
        pointer-events: none;
        }

        .custom-select:focus {
        outline: none;
        border-color: #003366;
        box-shadow: 0 0 6px rgba(0,70,140,0.3);
        }

        /* ================== BUTTON ================== */
        .modern-btn {
        margin-top: 18px;
        width: 100%;
        padding: 14px;
        background: linear-gradient(135deg, #003b80, #002147);
        border: none;
        color: white;
        border-radius: 12px;
        font-size: 1.1rem;
        font-weight: 600;
        cursor: pointer;
        }

        .modern-btn:hover {
        background: linear-gradient(135deg, #004a9f, #002147);
        }

        /* ================== LIST ================== */
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
        border: 1px solid #d7e2f7;
        }

        .university-item a {
        text-decoration: none;
        color: #003366;
        }

        /* ================== MAP ================== */
       .map-wrapper {
            width: 100%;
            height: 420px;
            border-radius: 18px;
            overflow: hidden;
        }


        .map-wrapper iframe {
        width: 100%;
        height: 100%;
        border: 0;
        }

        @media (min-width: 1024px) {
        .map-wrapper {
            height: 500px;
        }
        }


                

    </style>
</head>

<body>

    <%@ include file="header.jsp" %>

    <main>

        <section class="page-section">
            <div class="page-container">

                <div class="content-card universities-card">
                    <%
                            List<Country> countries = (List<Country>) request.getAttribute("countries");
                            List<University> universities = (List<University>) request.getAttribute("universities");
                            String selectedCountryId = request.getAttribute("selectedCountryId") != null
                                                    ? request.getAttribute("selectedCountryId").toString()
                                                    : "";
                        %>
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
                            <a href="<%=request.getContextPath()%>/UniversityDetailsServlet?id=<%= u.getUniversityId() %>">
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

                    <div class="map-wrapper">
                        <iframe
                            src="https://www.google.com/maps/d/embed?mid=1BrL8o3VWxsxsmxFSqdzUfcDYc7DVpb4&ehbc=2E312F&noprof=1"
                            loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade">
                        </iframe>
                    </div>


                </div>
            </div>
        </section>
    </main>

<%@ include file="footer.jsp" %>

</body>
</html>
