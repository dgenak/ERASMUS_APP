package com.erasmus.web.model;

public class University {
    private int id;
    private String name;
    private String country;
    private String city;
    private String department;
    private String description;

    public University() {}

    public University(int id, String name, String country, String city, String department, String description) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.city = city;
        this.department = department;
        this.description = description;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
