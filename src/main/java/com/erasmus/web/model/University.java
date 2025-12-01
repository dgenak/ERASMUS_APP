package com.erasmus.web.model;

public class University {

    private int universityId;
    private String universityName;
    private int countryId;

    public University() {}

    public University(int universityId, String universityName, int countryId) {
        this.universityId = universityId;
        this.universityName = universityName;
        this.countryId = countryId;
    }

    public int getUniversityId() { return universityId; }
    public void setUniversityId(int universityId) { this.universityId = universityId; }

    public String getUniversityName() { return universityName; }
    public void setUniversityName(String universityName) { this.universityName = universityName; }

    public int getCountryId() { return countryId; }
    public void setCountryId(int countryId) { this.countryId = countryId; }

    private double latitude;
    private double longitude;

    public double getLatitude() { return latitude; }
    public void setLatitude(double latitude) { this.latitude = latitude; }

    public double getLongitude() { return longitude; }
    public void setLongitude(double longitude) { this.longitude = longitude; }

    public University(int universityId, String universityName, int countryId, double latitude, double longitude) {

        this.universityId = universityId;
        this.universityName = universityName;
        this.countryId = countryId;
        this.latitude = latitude;
        this.longitude = longitude;
    }


}
