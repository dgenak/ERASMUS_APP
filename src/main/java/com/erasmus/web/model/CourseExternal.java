package com.erasmus.web.model;

public class CourseExternal {

    private int id;
    private String courseName;
    private String courseCode;
    private double ects;

    public CourseExternal(int id, String courseName, String courseCode, double ects) {
        this.id = id;
        this.courseName = courseName;
        this.courseCode = courseCode;
        this.ects = ects;
    }

    public int getId() { return id; }
    public String getCourseName() { return courseName; }
    public String getCourseCode() { return courseCode; }
    public double getEcts() { return ects; }
}
