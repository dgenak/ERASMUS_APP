<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.erasmus.web.model.CourseDet" %>

<%
    List<CourseDet> coreMandatory7 =
        (List<CourseDet>) request.getAttribute("coreMandatory7");

    List<CourseDet> mand7 =
        (List<CourseDet>) request.getAttribute("mandatory7");

    List<CourseDet> elec7 =
        (List<CourseDet>) request.getAttribute("electives7");

    List<CourseDet> chosen7 =
        (List<CourseDet>) request.getAttribute("chosen7");

    List<String> orientations7 =
        (List<String>) request.getAttribute("orientations7");

    String selected7 =
        (String) request.getAttribute("selectedOrientation7");

    Map<Integer, Boolean> hasEquiv =
        (Map<Integer, Boolean>) request.getAttribute("hasEquiv");
%>

<!-- ================= CORE MANDATORY ================= -->
<h3 class="orient-title">Mandatory Courses (for all orientations)</h3>

<% if (coreMandatory7 != null) { %>
    <% for (CourseDet c : coreMandatory7) { %>
        <div class="course-item <%= Boolean.TRUE.equals(hasEquiv.get(c.getId())) ? "equiv-yes" : "equiv-no" %>">
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
<% if (selected7 == null) { %>

    <h3 class="orient-title">Choose Orientation</h3>

    <% if (orientations7 != null) { %>
        <% for (String o : orientations7) { %>
            <button class="orientation-btn"
                    onclick="loadSemester7('<%= o %>')">
                <%= o %>
            </button>
        <% } %>
    <% } %>

<% } else { %>

    <!-- BACK -->
    <button class="back-btn" onclick="loadSemester7(null)">
        ← Back to Orientations
    </button>

    <!-- ================= MANDATORY PER ORIENTATION ================= -->
    <h3 class="orient-title">Mandatory Courses – <%= selected7 %></h3>

    <% if (mand7 != null) { %>
        <% for (CourseDet c : mand7) { %>
            <div class="course-item <%= Boolean.TRUE.equals(hasEquiv.get(c.getId())) ? "equiv-yes" : "equiv-no" %>">
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

    <% if (chosen7 != null && !chosen7.isEmpty()) { %>
        <h4 class="orient-title">Selected Electives</h4>

        <% for (CourseDet c : chosen7) { %>
            <div class="course-item <%= Boolean.TRUE.equals(hasEquiv.get(c.getId())) ? "equiv-yes" : "equiv-no" %>">
                <div class="course-name">
                    <%= c.getCourseName() %>
                    <span class="ects-badge"><%= c.getEcts() %> ECTS</span>
                </div>
                <div class="course-info">
                    Code: <%= c.getCourseCode() %> | Period: <%= c.getPeriod() %>
                </div>

                <button class="remove-btn"
                        onclick="removeElective7(<%= c.getId() %>)">
                    Remove
                </button>
            </div>
        <% } %>
    <% } %>

    <!-- ================= ADD ELECTIVE ================= -->
    <div class="custom-select" id="elective7">
        <div class="selected" onclick="toggleDropdown(7)">
            -- Select Elective Course --
        </div>

        <div class="options">
            <% if (elec7 != null) {
                for (CourseDet c : elec7) {
                    boolean eq = Boolean.TRUE.equals(hasEquiv.get(c.getId()));
            %>
                <div class="option <%= eq ? "equiv-yes" : "equiv-no" %>"
                    onclick="selectElective(7, <%= c.getId() %>, '<%= c.getCourseName().replace("'", "\\'") %>')">
                    <%= c.getCourseName() %> (<%= c.getEcts() %> ECTS)
                </div>
            <% }} %>
        </div>
    </div>

    <button class="orientation-btn" onclick="addElective7()">
        Add
    </button>


<% } %>
