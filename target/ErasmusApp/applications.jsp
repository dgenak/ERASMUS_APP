<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.erasmus.web.model.Application" %>
<%@ page import="com.erasmus.web.model.LearningAgreement" %>



<%
List<Application> apps =
    (List<Application>) request.getAttribute("applications");

List<LearningAgreement> las =
    (List<LearningAgreement>) request.getAttribute("learningAgreements");
%>

<%
    Application selectedApplication =
        (Application) request.getAttribute("selectedApplication");

    com.erasmus.web.model.LearningAgreement la =
        (com.erasmus.web.model.LearningAgreement) request.getAttribute("la");



%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ERASMUS+ | Applications</title>

  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    .applications-list {
      display: flex;
      gap: 1rem;
      flex-wrap: wrap;
      margin-bottom: 2rem;
    }
    

    .application-card {
      background: #f1f6ff;
      padding: 1rem;
      border-radius: 10px;
      width: 220px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
      position: relative;
    }

    .btn-small {
      display: inline-block;
      margin-top: 0.5rem;
      padding: 0.4rem 0.8rem;
      background: #00509e;
      color: white;
      border-radius: 20px;
      text-decoration: none;
      font-size: 0.85rem;
    }

    body {
      font-family: 'Poppins', sans-serif;
      color: #343a40;
      background: #f4f7fb;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    main {
      flex: 1;
      max-width: 1400px;
      margin: 2rem auto;
      padding: 0 2rem;
      width: 100%;
    }

    .content-card {
      width: 100%;
      max-width: 1400px;
      background: white;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      padding: 2.5rem;
      animation: fadeIn 0.5s ease;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .section-title {
      font-size: 2rem;
      color: #003366;
      text-align: center;
      margin-bottom: 2rem;
      font-weight: 600;
    }

    /* Buttons */
    .form-buttons {
      display: flex;
      justify-content: center;
      gap: 2rem;
      flex-wrap: wrap;
      margin-bottom: 3rem;
    }

    .btn-large {
      background: #00509e;
      color: white;
      padding: 1rem 2rem;
      border: none;
      border-radius: 40px;
      font-size: 1.1rem;
      font-weight: 500;
      cursor: pointer;
      transition: 0.3s;
      display: inline-flex;
      align-items: center;
      gap: 0.7rem;
      text-decoration: none;
    }

    .btn-large:hover {
      background: #003d80;
      transform: translateY(-2px);
    }

    /* Dropdown / Accordion */
    .accordion {
      margin-top: 1rem;
    }

    .accordion-item {
      background: #f8f9fa;
      border-radius: 8px;
      margin-bottom: 10px;
      overflow: hidden;
      box-shadow: 0 5px 20px rgba(0,0,0,0.05);
    }

    .accordion-title {
      padding: 1rem;
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: #e9f2ff;
    }

    .accordion-content {
      max-height: 0;
      overflow: hidden;
      padding: 0 1rem;
      background: white;
      border-top: 1px solid #d0d7e1;
      transition: max-height 0.35s ease, padding 0.35s ease;
    }

    .accordion-item.active .accordion-content {
      max-height: 760px;
      padding: 1rem;
    }

    .accordion-title i {
      transition: 0.3s;
    }

    .accordion-item.active .accordion-content {
      display: block;
    }

    .accordion-item.active .accordion-title i {
      transform: rotate(90deg);
    }

    .form-page-container {
      position: relative;
      background: white;
      border-radius: 12px;
      padding: 2rem;
      min-height: 350px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.08);
      margin-bottom: 3rem;
      overflow: hidden;
    }

    /* Pages */
    .form-page {
      display: none;
      animation: fadeIn 0.3s ease;
    }

    .form-page.active {
      display: block;
    }

    /* Arrows */
    .nav-arrow {
      position: absolute;
      top: 15px;
      width: 45px;
      height: 45px;
      background: none;
      border-radius: 100%;
      border: 2px solid #003d80;
      font-size: 2rem;
      cursor: pointer;
      color: #003d80;
      font-weight: bold;
    }

    .nav-arrow:hover {
      transform: scale(1.15);
      background-color: #e6f0ff;
    }
    
    /* Individual positions */
    #nextBtn {
      right: 15px;            /* top-right */
    }
    
    #prevBtn {
      left: 15px;             /* top-left */
    }

    #prevBtn { left: 10px; }
    #nextBtn { right: 10px; }

    /* Placeholder styles */
    .sub-title {
      text-align: center;
      font-size: 1.5rem;
      color: #003366;
      margin-bottom: 1rem;
    }

    .form-desc {
      text-align: center;
      margin-bottom: 1.5rem;
      color: #666;
    }

    .input-box {
      width: 100%;
      padding: 0.8rem;
      border: 1px solid #ccc;
      border-radius: 8px;
    }




  </style>

</head>

<body>

  <main>
    <div class="content-card">
        <!-- Page Title -->
        <h2 class="section-title">Kickstart your Erasmus+ Experience!</h2>

        <!-- Container for the two forms -->
        <div class="form-page-container">
        
          <!-- Left arrow (visible only on page 2) -->
          <button id="prevBtn" class="nav-arrow" style="display:none;">&#8592;</button>
        
          <!-- Right arrow (visible only on page 1) -->
          <button id="nextBtn" class="nav-arrow">&#8594;</button>
        
          <!-- Form Pages -->
          <div id="formPage1" class="form-page active">
            <h2 style="text-align:center; font-weight:bold; margin-bottom:20px;" class="sub-title">
                PROGRAMME ERASMUS+ STUDENT APPLICATION FORM - PAGE 1
            </h2>
            <form action="SaveApplicationFormServlet" method="post">
                <input type="hidden" name="applicationId"
                      value="<%= selectedApplication != null ? selectedApplication.getApplicationId() : "" %>">

                <div class="pdf-section">
                  <h3>Application Title</h3>
                  <input type="text" name="title" class="input-box"
                        value="<%= selectedApplication != null ? selectedApplication.getTitle() : "" %>"
                        placeholder="e.g. Erasmus Spain 2025">
                </div>

                <div class="pdf-section">
                  <h3>STUDENT’S PERSONAL DATA</h3>
                
                  <table class="pdf-table">
                    <tr>
                      <td>Family name:</td>
                      <td>
                        <input type="text" name="familyName"
                              value="<%= selectedApplication != null ? selectedApplication.getFamilyName() : "" %>">
                      </td>

                    </tr>
                    <tr>
                      <td>First name(s):</td>
                      <td><input type="text" name="firstName"
                            value="<%= selectedApplication != null ? selectedApplication.getFirstName() : "" %>">
                      </td>
                    </tr>
                    <tr>
                      <td>Date of birth:</td>
                      <td><input type="date" name="dob"
                            value="<%= selectedApplication != null && selectedApplication.getDob() != null
                            ? selectedApplication.getDob()
                            : "" %>">
                      </td>
                    </tr>
                    <tr>
                      <td>Sex (M/F):</td>
                      <td><input type="text" name="sex"
                            value="<%= selectedApplication != null ? selectedApplication.getSex() : "" %>"
                            placeholder="M / F">
                      </td>
                    </tr>
                    <tr>
                      <td>Nationality:</td>
                      <td><input type="text" name="nationality"
                            value="<%= selectedApplication != null ? selectedApplication.getNationality() : "" %>">
                      </td>
                    </tr>
                    <tr>
                      <td>Place of birth:</td>
                      <td><input type="text" name="placeOfBirth"
                            value="<%= selectedApplication != null ? selectedApplication.getPlaceOfBirth() : "" %>">
                      </td>
                    </tr>
                    <tr>
                      <td>Email address:</td>
                      <td><input type="email" name="email"
                            value="<%= selectedApplication != null ? selectedApplication.getEmail() : "" %>">
                      </td>
                    </tr>
                    <tr>
                      <td>Current address:</td>
                      <td><textarea name="currentAddress"><%= 
                        selectedApplication != null ? selectedApplication.getCurrentAddress() : "" 
                      %></textarea>
                      </td>
                    </tr>
                    <tr>
                      <td>Permanent address (if different):</td>
                      <td><textarea name="permanentAddress"><%= 
                        selectedApplication != null ? selectedApplication.getPermanentAddress() : "" 
                      %></textarea>
                      </td>
                    </tr>
                    <tr>
                      <td>Current address valid until:</td>
                      <td><input type="date" name="validUntil"></td>
                    </tr>
                    <tr>
                      <td>Tel. number:</td>
                      <td><input type="text" name="tel1"
                            value="<%= selectedApplication != null ? selectedApplication.getTel1() : "" %>">
                      </td>
                    </tr>
                    <tr>
                      <td>Tel. number (2):</td>
                      <td><input type="text" name="tel2"
                            value="<%= selectedApplication != null ? selectedApplication.getTel2() : "" %>">
                      </td>
                    </tr>
                  </table>
                </div>
                
                <br>
                
                <div class="pdf-section">
                  <h3>LIST OF INSTITUTIONS WHICH WILL RECEIVE THIS APPLICATION FORM</h3>
                
                  <table class="pdf-table">
                    <tr>
                      <th>Institution</th>
                      <th>Country</th>
                      <th>Period of Study — From</th>
                      <th>To</th>
                      <th>Duration (months)</th>
                      <th>ECTS Credits</th>
                    </tr>
                  
                    <!-- Row 1 -->
                    <tr>
                      <td><input type="text" name="inst1"></td>
                      <td><input type="text" name="inst1Country"></td>
                      <td><input type="month" name="inst1From"></td>
                      <td><input type="month" name="inst1To"></td>
                      <td><input type="number" name="inst1Duration"></td>
                      <td><input type="number" name="inst1ECTS"></td>
                    </tr>
                  
                    <!-- Row 2 -->
                    <tr>
                      <td><input type="text" name="inst2"></td>
                      <td><input type="text" name="inst2Country"></td>
                      <td><input type="month" name="inst2From"></td>
                      <td><input type="month" name="inst2To"></td>
                      <td><input type="number" name="inst2Duration"></td>
                      <td><input type="number" name="inst2ECTS"></td>
                    </tr>
                  
                    <!-- Row 3 -->
                    <tr>
                      <td><input type="text" name="inst3"></td>
                      <td><input type="text" name="inst3Country"></td>
                      <td><input type="month" name="inst3From"></td>
                      <td><input type="month" name="inst3To"></td>
                      <td><input type="number" name="inst3Duration"></td>
                      <td><input type="number" name="inst3ECTS"></td>
                    </tr>
                  </table>
                </div>
                
                <h2 style="text-align:center" class="sub-title">
                    PROGRAMME ERASMUS+ STUDENT APPLICATION FORM - PAGE 2
                </h2>
              
                <!-- REASONS FOR STUDYING ABROAD -->
                <div class="pdf-section">
                  <h3>REASONS FOR STUDYING ABROAD</h3>
                  <textarea name="studyReasons" rows="6" class="input-box" placeholder="Briefly state the reasons why you wish to study abroad..."></textarea>
                </div>
              
                <br>
              
                <!-- LANGUAGE COMPETENCE -->
                <div class="pdf-section">
                  <h3>LANGUAGE COMPETENCE</h3>
                  <table class="pdf-table">
                    <tr>
                      <td>Mother tongue:</td>
                      <td><input type="text" name="motherTongue"></td>
                    </tr>
                    <tr>
                      <td>Language of instruction at home institution:</td>
                      <td>
                        <select name="homeLang">
                          <option value="">--Select--</option>
                          <option value="GR">GR</option>
                          <option value="EN">EN</option>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <th>Other languages</th>
                      <th>I have sufficient knowledge to follow lectures</th>
                      <th>I would have sufficient knowledge with extra preparation</th>
                    </tr>
                    <tr>
                      <td><input type="text" name="otherLang1"></td>
                      <td><input type="checkbox" name="otherLang1_sufficient"></td>
                      <td><input type="checkbox" name="otherLang1_extra"></td>
                    </tr>
                    <tr>
                      <td><input type="text" name="otherLang2"></td>
                      <td><input type="checkbox" name="otherLang2_sufficient"></td>
                      <td><input type="checkbox" name="otherLang2_extra"></td>
                    </tr>
                  </table>
                </div>
              
                <br>
              
                <!-- WORK EXPERIENCE -->
                <div class="pdf-section">
                  <h3>WORK EXPERIENCE RELATED TO CURRENT STUDY</h3>
                  <table class="pdf-table">
                    <tr>
                      <th>Type of Work Experience</th>
                      <th>Firm / Organization</th>
                      <th>Dates</th>
                      <th>Country</th>
                    </tr>
                    <tr>
                      <td><input type="text" name="workType1"></td>
                      <td><input type="text" name="workOrg1"></td>
                      <td><input type="text" name="workDates1"></td>
                      <td><input type="text" name="workCountry1"></td>
                    </tr>
                    <tr>
                      <td><input type="text" name="workType2"></td>
                      <td><input type="text" name="workOrg2"></td>
                      <td><input type="text" name="workDates2"></td>
                      <td><input type="text" name="workCountry2"></td>
                    </tr>
                  </table>
                </div>
              
                <br>
              
                <!-- PREVIOUS / CURRENT STUDIES -->
                <div class="pdf-section">
                  <h3>PREVIOUS / CURRENT STUDIES</h3>
                  <label><input type="checkbox" name="degreeType" value="Bachelor"> Bachelor (PTYCHIO, 4 years - 240 ECTS)</label><br>
                  <label><input type="checkbox" name="degreeType" value="Master4"> Master (4 semesters - 120 ECTS)</label><br>
                  <label><input type="checkbox" name="degreeType" value="Master3"> Master (3 semesters - 90 ECTS)</label><br>
                  <label><input type="checkbox" name="degreeType" value="Master2"> Master (2 semesters - 60 ECTS)</label><br>
                  <label><input type="checkbox" name="degreeType" value="Master1"> Master (1 academic year - 75 ECTS)</label><br>
                  <label><input type="checkbox" name="degreeType" value="Doctoral"> Doctoral degree</label><br>
                  <label>Number of higher education study years prior to departure abroad: <input type="number" name="studyYears" min="1" max="20"></label><br>
                  <label>Have you already been studying abroad? <input type="checkbox" name="studyingAbroadYes" value="yes"> Yes <input type="checkbox" name="studyingAbroadNo" value="no"> No</label><br>
                  <label>If Yes, when and at which institution? <input type="text" name="studyAbroadDetails"></label>
                </div>
              
                <br>
              
                <!-- SIGNATURES -->
                <div class="pdf-section">
                  <h3>SIGNATURES</h3>
                  <label>Student’s Signature: <input type="text" name="studentSignature"></label><br>
                  <label>Date: <input type="date" name="studentDate"></label><br>
                </div>
              
                <br>
              
                <!-- RECEIVING INSTITUTION -->
                <div class="pdf-section">
                  <h3>RECEIVING INSTITUTION</h3>
                  <label><input type="checkbox" name="receivedYes"> Provisionally accepted</label><br>
                  <label><input type="checkbox" name="receivedNo"> Not accepted</label><br>
                  <label>
                    Departmental coordinator’s signature: <input type="text" name="deptSignature">
                    Date: <input type="date" name="receivingDate">
                  </label><br>
                  <label>
                    Institutional coordinator’s signature: <input type="text" name="instSignature">
                    Date: <input type="date" name="receivingDate">
                  </label><br>
                </div>

                <!-- Save button-->
                <div style="display: flex; justify-content: center; margin-top: 20px;">
                  <button type="submit" class="btn-large">
                    Save
                  </button>
                </div>
              </form>
            </div>

            <div id="formPage2" class="form-page">
              <h2 class="sub-title">LEARNING AGREEMENT</h2>

              <form action="SaveLearningAgreementServlet" method="post">

                <input type="hidden" name="learningAgreementId"
                      value="<%= la != null ? la.getLearningAgreementId() : "" %>">

                <input type="hidden" name="applicationId"
                      value="<%= selectedApplication != null ? selectedApplication.getApplicationId() : "" %>">

                <!-- TITLE -->
                <div class="pdf-section">
                  <h3>Learning Agreement Title</h3>
                  <input type="text" name="la_title" class="input-box"
                        value="<%= la != null ? la.getTitle() : "" %>">
                </div>

                <!-- ================= STUDENT INFO ================= -->
                <div class="pdf-section">
                  <h3>Student Information</h3>
                  <table class="pdf-table">
                    <tr>
                      <td>Last Name(s):</td>
                      <td><input type="text" name="la_lastName"
                                value="<%= la != null ? la.getLastName() : "" %>"></td>
                    </tr>
                    <tr>
                      <td>First Name(s):</td>
                      <td><input type="text" name="la_firstName"
                                value="<%= la != null ? la.getFirstName() : "" %>"></td>
                    </tr>
                    <tr>
                      <td>Date of Birth:</td>
                      <td><input type="date" name="la_dob"
                        value="<%= la != null && la.getDob() != null ? la.getDob() : "" %>">
                      </td>
                    </tr>
                    <tr>
                      <td>Nationality:</td>
                      <td><input type="text" name="la_nationality"
                                value="<%= la != null ? la.getNationality() : "" %>"></td>
                    </tr>
                    <tr>
                      <td>Gender:</td>
                      <td>
                        <select name="la_gender">
                          <option value="">Select</option>
                          <option value="Male" <%= la!=null && "Male".equals(la.getGender())?"selected":"" %>>Male</option>
                          <option value="Female" <%= la!=null && "Female".equals(la.getGender())?"selected":"" %>>Female</option>
                          <option value="Undefined" <%= la!=null && "Undefined".equals(la.getGender())?"selected":"" %>>Undefined</option>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <td>Study Cycle:</td>
                      <td><input type="text" name="la_studyCycle"
                                value="<%= la != null ? la.getStudyCycle() : "" %>"></td>
                    </tr>
                    <tr>
                      <td>Field of Education:</td>
                      <td><input type="text" name="la_fieldEducation"
                                value="<%= la != null ? la.getFieldEducation() : "" %>"></td>
                    </tr>
                  </table>
                </div>

                <!-- ================= SENDING ================= -->
                <div class="pdf-section">
                  <h3>Sending Institution</h3>
                  <table class="pdf-table">
                    <tr><td>Name:</td><td><input type="text" name="la_sendingName" value="<%= la!=null?la.getSendingName():"" %>"></td></tr>
                    <tr><td>Faculty:</td><td><input type="text" name="la_sendingFaculty" value="<%= la!=null?la.getSendingFaculty():"" %>"></td></tr>
                    <tr><td>Erasmus Code:</td><td><input type="text" name="la_sendingCode" value="<%= la!=null?la.getSendingCode():"" %>"></td></tr>
                    <tr><td>Address:</td><td><input type="text" name="la_sendingAddress" value="<%= la!=null?la.getSendingAddress():"" %>"></td></tr>
                    <tr><td>Country:</td><td><input type="text" name="la_sendingCountry" value="<%= la!=null?la.getSendingCountry():"" %>"></td></tr>
                    <tr><td>Contact:</td><td><input type="text" name="la_sendingContact" value="<%= la!=null?la.getSendingContact():"" %>"></td></tr>
                  </table>
                </div>

                <!-- ================= LANGUAGE ================= -->
                <div class="pdf-section">
                  <h3>Language Competence</h3>
                  <label><input type="checkbox" name="langA1" <%= la!=null && la.isLangA1()?"checked":"" %>> A1</label>
                  <label><input type="checkbox" name="langA2" <%= la!=null && la.isLangA2()?"checked":"" %>> A2</label>
                  <label><input type="checkbox" name="langB1" <%= la!=null && la.isLangB1()?"checked":"" %>> B1</label>
                  <label><input type="checkbox" name="langB2" <%= la!=null && la.isLangB2()?"checked":"" %>> B2</label>
                  <label><input type="checkbox" name="langC1" <%= la!=null && la.isLangC1()?"checked":"" %>> C1</label>
                  <label><input type="checkbox" name="langC2" <%= la!=null && la.isLangC2()?"checked":"" %>> C2</label>
                  <label><input type="checkbox" name="langNative" <%= la!=null && la.isLangNative()?"checked":"" %>> Native</label>
                </div>

                <!-- SAVE -->
                <div style="display:flex; justify-content:center; margin-top:20px;">
                  <button type="submit" class="btn-large">Save</button>
                </div>

              </form>
            </div>
        </div>
            <div style="text-align:center; margin-bottom:20px;">
              <a href="my-applications?newApp=true" class="btn-large">
                ➕ New Application
              </a>
            </div>

                  
              <!-- Saved Application Preview -->
              <h3 class="section-title" style="font-size:1.6rem;">
                My Saved Applications
              </h3>

              <div class="applications-list">
              <%

              if (apps != null && !apps.isEmpty()) {
                  for (Application a : apps) {
              %>
                  <div class="application-card" style="position:relative;">

                      <!-- DELETE BUTTON -->
                      <form action="DeleteApplicationServlet"
                            method="post"
                            style="position:absolute; top:10px; right:10px;"
                            onsubmit="return confirm('Are you sure you want to delete this application?');">

                          <input type="hidden" name="applicationId"
                                value="<%= a.getApplicationId() %>">

                          <button type="submit"
                                  style="background:none; border:none; cursor:pointer; color:#c0392b;">
                              <i class="fas fa-trash"></i>
                          </button>
                      </form>

                      <!-- CONTENT -->
                      <strong><%= a.getTitle() %></strong><br>
                      <small><%= a.getFirstName() %> <%= a.getFamilyName() %></small><br>

                      <a class="btn-small"
                        href="applications.jsp?id=<%= a.getApplicationId() %>">
                        Open
                      </a>
                  </div>
              <%
                  }
              } else {
              %>
                  <p>No saved applications yet.</p>
              <%
              }
              %>
              </div>
            <div style="text-align:center; margin-bottom:20px;">
              <a href="applications.jsp?newLA=true"
                class="btn-large">
                ➕ New Learning Agreement
              </a>
            </div>


            <h3 class="section-title" style="font-size:1.6rem;">
              My Saved Learning Agreements
            </h3>

            <div class="applications-list">
            <%

            if (las != null && !las.isEmpty()) {
                for (LearningAgreement l : las) {
            %>
                <div class="application-card" style="position:relative;">

                    <!-- DELETE LEARNING AGREEMENT -->
                    <form action="DeleteLearningAgreementServlet"
                          method="post"
                          style="position:absolute; top:10px; right:10px;"
                          onsubmit="return confirm('Delete this learning agreement?');">

                        <input type="hidden" name="learningAgreementId"
                              value="<%= l.getLearningAgreementId() %>">

                        <button type="submit"
                                style="background:none; border:none; cursor:pointer; color:#c0392b;">
                            <i class="fas fa-trash"></i>
                        </button>
                    </form>

                    <strong><%= l.getTitle() %></strong><br>

                    <a class="btn-small"
                      href="applications.jsp?id=<%= l.getApplicationId() %>">
                      Open
                    </a>
                </div>
            <%
                }
            } else {
            %>
                <p>No saved learning agreements yet.</p>
            <%
            }
            %>
            </div>


      <!-- Important Documents Section -->
      <h3 class="section-title" style="font-size:1.6rem;">Important Documents</h3>

      <!-- Accordion for PDFs -->
      <div class="accordion">

        <!-- ITEM 1 -->
        <div class="accordion-item">
          <div class="accordion-title" onclick="toggleAccordion(this)">
            <span>Learning Agreement Guidelines</span>
            <i class="fas fa-chevron-right"></i>
          </div>
          <div class="accordion-content">
            <iframe
              src="docs/Learning_agreement_studies_guidelines_final_2019.pdf"
              width="100%"
              height="1000px"
              style="border:none;"
            ></iframe>
          </div>
        </div>

        <!-- ITEM 2 -->
        <div class="accordion-item">
          <div class="accordion-title" onclick="toggleAccordion(this)">
            <span>Erasmus Student Charter</span>
            <i class="fas fa-chevron-right"></i>
          </div>
          <div class="accordion-content">
            <iframe
              src="docs/Erasmus_Student_Charter.pdf"
              width="100%"
              height="1000px"
              style="border:none;"
            ></iframe>
          </div>
        </div>

        <!-- ITEM 3 -->
        <div class="accordion-item">
          <div class="accordion-title" onclick="toggleAccordion(this)">
            <span>Erasmus Policy Statement</span>
            <i class="fas fa-chevron-right"></i>
          </div>
          <div class="accordion-content">
            <iframe
              src="docs/Erasmus-Policy-Statement.pdf"
              width="100%"
              height="1000px"
              style="border:none;"
            ></iframe>
          </div>
        </div>

      </div>

    </div>
  </main>
  <script>
    function toggleAccordion(el) {
       const item = el.parentElement;


       item.classList.toggle("active");
    }
  </script>
  <script>
    document.addEventListener("DOMContentLoaded", function () {

      let page = 1;

      const page1 = document.getElementById("formPage1");
      const page2 = document.getElementById("formPage2");

      const prevBtn = document.getElementById("prevBtn");
      const nextBtn = document.getElementById("nextBtn");

      if (!page1 || !page2 || !prevBtn || !nextBtn) {
        console.error("Form navigation elements not found");
        return;
      }

      function updatePages() {
        if (page === 1) {
          page1.classList.add("active");
          page2.classList.remove("active");
          prevBtn.style.display = "none";
          nextBtn.style.display = "block";
        } else {
          page1.classList.remove("active");
          page2.classList.add("active");
          prevBtn.style.display = "block";
          nextBtn.style.display = "none";
        }
      }

      prevBtn.addEventListener("click", function () {
        page = 1;
        updatePages();
      });

      nextBtn.addEventListener("click", function () {
        page = 2;
        updatePages();
      });

    });
  </script>

  <%@ include file="footer.jsp" %>

</body>
</html>
