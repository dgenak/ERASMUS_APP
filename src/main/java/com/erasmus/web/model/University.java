package com.erasmus.web.model;

public class University {

    private int universityId;
    private String universityName;
    private int countryId;

    private double latitude;
    private double longitude;

    private String imageUrl;

    /* ===== Constructors ===== */

    public University() {
    }

    public University(int universityId, String universityName, int countryId,
                      double latitude, double longitude, String imageUrl) {
        this.universityId = universityId;
        this.universityName = universityName;
        this.countryId = countryId;
        this.latitude = latitude;
        this.longitude = longitude;
        this.imageUrl = imageUrl;
    }

    /* ===== Getters & Setters ===== */

    public int getUniversityId() {
        return universityId;
    }

    public void setUniversityId(int universityId) {
        this.universityId = universityId;
    }

    public String getUniversityName() {
        return universityName;
    }

    public void setUniversityName(String universityName) {
        this.universityName = universityName;
    }

    public int getCountryId() {
        return countryId;
    }

    public void setCountryId(int countryId) {
        this.countryId = countryId;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
