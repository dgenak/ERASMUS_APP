<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.util.List, com.erasmus.web.model.CourseExternal" %>

    <div id="course-modal" class="modal-backdrop">
        <div class="modal-glass">

            <% 
                List<CourseExternal> eq =
                    (List<CourseExternal>) request.getAttribute("equivalents");

                Integer timesMatched =
                    (Integer) request.getAttribute("timesMatched");
                if (timesMatched == null) timesMatched = 0;
            %>

            <div class="modal-header">
                <div class="modal-icon">🎓</div>
                <div class="modal-title">Equivalent Course Found</div>
                <div class="modal-subtitle">
                    This match is based on past Erasmus approvals
                </div>
            </div>

            <% if (eq != null && !eq.isEmpty()) { %>

                <div class="modal-course-card">
                    <div class="course-title"><%= eq.get(0).getCourseName() %></div>

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
                        <span class="value"><%= timesMatched %></span>
                    </div>
                </div>

            <% } else { %>

                <div class="modal-course-card">
                    <div class="course-title">No Equivalent Courses Found</div>
                    <p class="no-data">
                        There is no historical equivalence recorded for this course.
                    </p>
                </div>

            <% } %>

            <a href="#" class="modal-btn">Close</a>
            <a href="#" class="modal-backdrop-close"></a>

        </div>
    </div>
