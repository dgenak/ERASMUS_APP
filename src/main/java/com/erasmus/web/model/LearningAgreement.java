package com.erasmus.web.model;

public class LearningAgreement {

    // ===== BASIC INFO =====
    private int learningAgreementId;
    private int applicationId;
    private int ownerUserId;
    private String title;

    // ===== STUDENT INFO =====
    private String lastName;
    private String firstName;
    private String dob;
    private String nationality;
    private String gender;
    private String studyCycle;
    private String fieldEducation;

    // ===== SENDING INSTITUTION =====
    private String sendingName;
    private String sendingFaculty;
    private String sendingCode;
    private String sendingAddress;
    private String sendingCountry;
    private String sendingContact;

    // ===== RECEIVING INSTITUTION =====
    private String receivingName;
    private String receivingFaculty;
    private String receivingCode;
    private String receivingAddress;
    private String receivingCountry;
    private String receivingContact;

    // ===== STUDY PERIOD =====
    private String periodFrom;
    private String periodTo;
    private String courseLink;

    // ===== TABLE A =====
    private String a1Code;
    private String a1Title;
    private String a1Semester;
    private Integer a1Ects;

    private String a2Code;
    private String a2Title;
    private String a2Semester;
    private Integer a2Ects;

    private String a3Code;
    private String a3Title;
    private String a3Semester;
    private Integer a3Ects;

    // ===== LANGUAGE COMPETENCE =====
    private Boolean langA1;
    private Boolean langA2;
    private Boolean langB1;
    private Boolean langB2;
    private Boolean langC1;
    private Boolean langC2;
    private Boolean langNative;

    // ===== TABLE B =====
    private String b1Code;
    private String b1Title;
    private String b1Semester;
    private Integer b1Ects;

    private String b2Code;
    private String b2Title;
    private String b2Semester;
    private Integer b2Ects;

    private String b3Code;
    private String b3Title;
    private String b3Semester;
    private Integer b3Ects;

    // ===== CONSTRUCTOR =====
    public LearningAgreement() {}

    // ===== GETTERS & SETTERS =====

    public int getLearningAgreementId() {
        return learningAgreementId;
    }

    public void setLearningAgreementId(int learningAgreementId) {
        this.learningAgreementId = learningAgreementId;
    }

    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public int getOwnerUserId() {
        return ownerUserId;
    }

    public void setOwnerUserId(int ownerUserId) {
        this.ownerUserId = ownerUserId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStudyCycle() {
        return studyCycle;
    }

    public void setStudyCycle(String studyCycle) {
        this.studyCycle = studyCycle;
    }

    public String getFieldEducation() {
        return fieldEducation;
    }

    public void setFieldEducation(String fieldEducation) {
        this.fieldEducation = fieldEducation;
    }

    public String getSendingName() {
        return sendingName;
    }

    public void setSendingName(String sendingName) {
        this.sendingName = sendingName;
    }

    public String getSendingFaculty() {
        return sendingFaculty;
    }

    public void setSendingFaculty(String sendingFaculty) {
        this.sendingFaculty = sendingFaculty;
    }

    public String getSendingCode() {
        return sendingCode;
    }

    public void setSendingCode(String sendingCode) {
        this.sendingCode = sendingCode;
    }

    public String getSendingAddress() {
        return sendingAddress;
    }

    public void setSendingAddress(String sendingAddress) {
        this.sendingAddress = sendingAddress;
    }

    public String getSendingCountry() {
        return sendingCountry;
    }

    public void setSendingCountry(String sendingCountry) {
        this.sendingCountry = sendingCountry;
    }

    public String getSendingContact() {
        return sendingContact;
    }

    public void setSendingContact(String sendingContact) {
        this.sendingContact = sendingContact;
    }

    public String getReceivingName() {
        return receivingName;
    }

    public void setReceivingName(String receivingName) {
        this.receivingName = receivingName;
    }

    public String getReceivingFaculty() {
        return receivingFaculty;
    }

    public void setReceivingFaculty(String receivingFaculty) {
        this.receivingFaculty = receivingFaculty;
    }

    public String getReceivingCode() {
        return receivingCode;
    }

    public void setReceivingCode(String receivingCode) {
        this.receivingCode = receivingCode;
    }

    public String getReceivingAddress() {
        return receivingAddress;
    }

    public void setReceivingAddress(String receivingAddress) {
        this.receivingAddress = receivingAddress;
    }

    public String getReceivingCountry() {
        return receivingCountry;
    }

    public void setReceivingCountry(String receivingCountry) {
        this.receivingCountry = receivingCountry;
    }

    public String getReceivingContact() {
        return receivingContact;
    }

    public void setReceivingContact(String receivingContact) {
        this.receivingContact = receivingContact;
    }

    public String getPeriodFrom() {
        return periodFrom;
    }

    public void setPeriodFrom(String periodFrom) {
        this.periodFrom = periodFrom;
    }

    public String getPeriodTo() {
        return periodTo;
    }

    public void setPeriodTo(String periodTo) {
        this.periodTo = periodTo;
    }

    public String getCourseLink() {
        return courseLink;
    }

    public void setCourseLink(String courseLink) {
        this.courseLink = courseLink;
    }
    public Boolean isLangA1() { return langA1; }
    public void setLangA1(Boolean langA1) { this.langA1 = langA1; }

    public Boolean isLangA2() { return langA2; }
    public void setLangA2(Boolean langA2) { this.langA2 = langA2; }

    public Boolean isLangB1() { return langB1; }
    public void setLangB1(Boolean langB1) { this.langB1 = langB1; }

    public Boolean isLangB2() { return langB2; }
    public void setLangB2(Boolean langB2) { this.langB2 = langB2; }

    public Boolean isLangC1() { return langC1; }
    public void setLangC1(Boolean langC1) { this.langC1 = langC1; }

    public Boolean isLangC2() { return langC2; }
    public void setLangC2(Boolean langC2) { this.langC2 = langC2; }

    public Boolean isLangNative() { return langNative; }
    public void setLangNative(Boolean langNative) { this.langNative = langNative; }
// ===== TABLE A : A1 =====
public String getA1Code() {
    return a1Code;
}

public void setA1Code(String a1Code) {
    this.a1Code = a1Code;
}

public String getA1Title() {
    return a1Title;
}

public void setA1Title(String a1Title) {
    this.a1Title = a1Title;
}

public String getA1Semester() {
    return a1Semester;
}

public void setA1Semester(String a1Semester) {
    this.a1Semester = a1Semester;
}

public Integer getA1Ects() {
    return a1Ects;
}

public void setA1Ects(Integer a1Ects) {
    this.a1Ects = a1Ects;
}


// ===== TABLE A : A2 =====
public String getA2Code() {
    return a2Code;
}

public void setA2Code(String a2Code) {
    this.a2Code = a2Code;
}

public String getA2Title() {
    return a2Title;
}

public void setA2Title(String a2Title) {
    this.a2Title = a2Title;
}

public String getA2Semester() {
    return a2Semester;
}

public void setA2Semester(String a2Semester) {
    this.a2Semester = a2Semester;
}

public Integer getA2Ects() {
    return a2Ects;
}

public void setA2Ects(Integer a2Ects) {
    this.a2Ects = a2Ects;
}


// ===== TABLE A : A3 =====
public String getA3Code() {
    return a3Code;
}

public void setA3Code(String a3Code) {
    this.a3Code = a3Code;
}

public String getA3Title() {
    return a3Title;
}

public void setA3Title(String a3Title) {
    this.a3Title = a3Title;
}

public String getA3Semester() {
    return a3Semester;
}

public void setA3Semester(String a3Semester) {
    this.a3Semester = a3Semester;
}

public Integer getA3Ects() {
    return a3Ects;
}

public void setA3Ects(Integer a3Ects) {
    this.a3Ects = a3Ects;
}

    public String getB1Code() {
        return b1Code;
    }

    public void setB1Code(String b1Code) {
        this.b1Code = b1Code;
    }

    public String getB1Title() {
        return b1Title;
    }

    public void setB1Title(String b1Title) {
        this.b1Title = b1Title;
    }

    public String getB1Semester() {
        return b1Semester;
    }

    public void setB1Semester(String b1Semester) {
        this.b1Semester = b1Semester;
    }

    public Integer getB1Ects() {
        return b1Ects;
    }

    public void setB1Ects(Integer b1Ects) {
        this.b1Ects = b1Ects;
    }


    // ===== TABLE B : B2 =====
    public String getB2Code() {
        return b2Code;
    }

    public void setB2Code(String b2Code) {
        this.b2Code = b2Code;
    }

    public String getB2Title() {
        return b2Title;
    }

    public void setB2Title(String b2Title) {
        this.b2Title = b2Title;
    }

    public String getB2Semester() {
        return b2Semester;
    }

    public void setB2Semester(String b2Semester) {
        this.b2Semester = b2Semester;
    }

    public Integer getB2Ects() {
        return b2Ects;
    }

    public void setB2Ects(Integer b2Ects) {
        this.b2Ects = b2Ects;
    }


    // ===== TABLE B : B3 =====
    public String getB3Code() {
        return b3Code;
    }

    public void setB3Code(String b3Code) {
        this.b3Code = b3Code;
    }

    public String getB3Title() {
        return b3Title;
    }

    public void setB3Title(String b3Title) {
        this.b3Title = b3Title;
    }

    public String getB3Semester() {
        return b3Semester;
    }

    public void setB3Semester(String b3Semester) {
        this.b3Semester = b3Semester;
    }

    public Integer getB3Ects() {
        return b3Ects;
    }

    public void setB3Ects(Integer b3Ects) {
        this.b3Ects = b3Ects;
    }


}
