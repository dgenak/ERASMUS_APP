package com.erasmus.web.model;

public class CourseDet {

    private int id;
    private int semester;
    private String courseName;
    private String courseCode;
    private String period;
    private int ects;
    private boolean mandatory;

    public CourseDet() {}

    public CourseDet(int id, int semester, String courseName, String courseCode,
                     String period, int ects, boolean mandatory) {
        this.id = id;
        this.semester = semester;
        this.courseName = courseName;
        this.courseCode = courseCode;
        this.period = period;
        this.ects = ects;
        this.mandatory = mandatory;
    }

    public int getId() { return id; }
    public int getSemester() { return semester; }
    public String getCourseName() { return courseName; }
    public String getCourseCode() { return courseCode; }
    public String getPeriod() { return period; }
    public int getEcts() { return ects; }
    public boolean isMandatory() { return mandatory; }
}
