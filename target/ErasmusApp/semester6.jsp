<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.erasmus.web.model.CourseDet" %>

<%
    List<CourseDet> coreMandatory6 =
        (List<CourseDet>) request.getAttribute("coreMandatory6");

    List<CourseDet> mand6 =
        (List<CourseDet>) request.getAttribute("mandatory6");

    List<CourseDet> elec6 =
        (List<CourseDet>) request.getAttribute("electives6");

    List<CourseDet> chosen6 =
        (List<CourseDet>) request.getAttribute("chosen6");

    Map<Integer, Boolean> hasEquiv =
        (Map<Integer, Boolean>) request.getAttribute("hasEquiv");

    String selected =
        (String) request.getAttribute("selectedOrientation");

    List<String> orientations =
        (List<String>) request.getAttribute("orientations");
%>

<!-- ================= CORE MANDATORY ================= -->
<h3 class="orient-title">Mandatory Courses (for all orientations)</h3>

<% if (coreMandatory6 != null) { %>
    <% for (CourseDet c : coreMandatory6) { %>
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
    <% } %>
<% } %>

<!-- ================= ORIENTATION SELECTION ================= -->
<% if (selected == null) { %>

    <h3 class="orient-title">Choose Orientation</h3>

    <% if (orientations != null) { %>
        <% for (String o : orientations) { %>
            <button class="orientation-btn"
                    onclick="loadSemester6('<%= o %>')">
                <%= o %>
            </button>
        <% } %>
    <% } %>

<% } else { %>

    <!-- BACK -->
    <button class="back-btn" onclick="loadSemester6(null)">
        ← Back to Orientations
    </button>

    <!-- ================= MANDATORY PER ORIENTATION ================= -->
    <h3 class="orient-title">Mandatory Courses – <%= selected %></h3>

    <% if (mand6 != null) { %>
        <% for (CourseDet c : mand6) { %>
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
        <% } %>
    <% } %>

    <!-- ================= ELECTIVES ================= -->
    <h3 class="electives-title">Elective Courses</h3>

    <% if (chosen6 != null && !chosen6.isEmpty()) { %>
        <h4 class="orient-title">Selected Electives</h4>

        <% for (CourseDet c : chosen6) { %>
            <div class="course-item <%= Boolean.TRUE.equals(hasEquiv.get(c.getId())) ? "equiv-yes" : "equiv-no" %>"
     onclick="openCourseModal(<%= c.getId() %>)">

                <div class="course-name">
                    <%= c.getCourseName() %>
                    <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                </div>
                <div class="course-info">
                    Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %>
                </div>

                <button class="remove-btn"
                        onclick="event.stopPropagation(); removeElective6(<%= c.getId() %>)">
                    Remove
                </button>
            </div>
        <% } %>
    <% } %>

    <!-- ================= ADD ELECTIVE ================= -->
    <div class="select-wrapper">
        <div class="custom-select" id="elective6">
            <div class="selected" onclick="toggleDropdown(6)">
                -- Select Elective Course --
            </div>

            <div class="options">
                <% if (elec6 != null) {
                    for (CourseDet c : elec6) {
                        boolean eq = Boolean.TRUE.equals(hasEquiv.get(c.getId()));
                %>
                    <div class="option <%= eq ? "equiv-yes" : "equiv-no" %>"
                        onclick="selectElective(6, <%= c.getId() %>, '<%= c.getCourseName().replace("'", "\\'") %>')">
                        <%= c.getCourseName() %> (<%= c.getEcts() %> ECTS)
                    </div>
                <% }} %>
            </div>
        </div>

        <button class="orientation-btn" onclick="addElective6()">
            Add
        </button>
    </div>
<% } %>
