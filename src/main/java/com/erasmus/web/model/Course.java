package com.erasmus.web.model;

public class Course {

    private int courseId;
    private String courseName;
    private int universityId;

    public Course() {}

    public Course(int courseId, String courseName, int universityId) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.universityId = universityId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getUniversityId() {
        return universityId;
    }

    public void setUniversityId(int universityId) {
        this.universityId = universityId;
    }
}
