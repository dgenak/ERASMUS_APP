<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

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
            
            <div class="pdf-section">
              <h3>STUDENT’S PERSONAL DATA</h3>
            
              <table class="pdf-table">
                <tr>
                  <td>Family name:</td>
                  <td><input type="text" name="familyName"></td>
                </tr>
                <tr>
                  <td>First name(s):</td>
                  <td><input type="text" name="firstName"></td>
                </tr>
                <tr>
                  <td>Date of birth:</td>
                  <td><input type="date" name="dob"></td>
                </tr>
                <tr>
                  <td>Sex (M/F):</td>
                  <td><input type="text" name="sex" placeholder="M / F"></td>
                </tr>
                <tr>
                  <td>Nationality:</td>
                  <td><input type="text" name="nationality"></td>
                </tr>
                <tr>
                  <td>Place of birth:</td>
                  <td><input type="text" name="placeOfBirth"></td>
                </tr>
                <tr>
                  <td>Email address:</td>
                  <td><input type="email" name="email"></td>
                </tr>
                <tr>
                  <td>Current address:</td>
                  <td><textarea name="currentAddress"></textarea></td>
                </tr>
                <tr>
                  <td>Permanent address (if different):</td>
                  <td><textarea name="permanentAddress"></textarea></td>
                </tr>
                <tr>
                  <td>Current address valid until:</td>
                  <td><input type="date" name="validUntil"></td>
                </tr>
                <tr>
                  <td>Tel. number:</td>
                  <td><input type="text" name="tel1"></td>
                </tr>
                <tr>
                  <td>Tel. number (2):</td>
                  <td><input type="text" name="tel2"></td>
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
              <button type="button" class="btn-large" onclick="saveApplicationForm()">Save</button>
            </div>
          </div>







          <div id="formPage2" class="form-page">
              <h2 class="sub-title">LEARNING AGREEMENT</h2>

              <!-- Student Info -->
              <div class="pdf-section">
                <h3>Student Information</h3>
                <table class="pdf-table">
                  <tr>
                    <td>Last Name(s):</td>
                    <td><input type="text" name="la_lastName"></td>
                  </tr>
                  <tr>
                    <td>First Name(s):</td>
                    <td><input type="text" name="la_firstName"></td>
                  </tr>
                  <tr>
                    <td>Date of Birth:</td>
                    <td><input type="date" name="la_dob"></td>
                  </tr>
                  <tr>
                    <td>Nationality:</td>
                    <td><input type="text" name="la_nationality"></td>
                  </tr>
                  <tr>
                    <td>Gender:</td>
                    <td>
                      <select name="la_gender">
                        <option value="">Select</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Undefined">Undefined</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>Study Cycle:</td>
                    <td><input type="text" name="la_studyCycle"></td>
                  </tr>
                  <tr>
                    <td>Field of Education:</td>
                    <td><input type="text" name="la_fieldEducation"></td>
                  </tr>
                </table>
              </div>
            
              <!-- Sending Institution -->
              <div class="pdf-section">
                <h3>Sending Institution</h3>
                <table class="pdf-table">
                  <tr>
                    <td>Name:</td>
                    <td><input type="text" name="la_sendingName"></td>
                  </tr>
                  <tr>
                    <td>Faculty / Department:</td>
                    <td><input type="text" name="la_sendingFaculty"></td>
                  </tr>
                  <tr>
                    <td>Erasmus Code:</td>
                    <td><input type="text" name="la_sendingCode"></td>
                  </tr>
                  <tr>
                    <td>Address:</td>
                    <td><input type="text" name="la_sendingAddress"></td>
                  </tr>
                  <tr>
                    <td>Country:</td>
                    <td><input type="text" name="la_sendingCountry"></td>
                  </tr>
                  <tr>
                    <td>Contact Person:</td>
                    <td><input type="text" name="la_sendingContact"></td>
                  </tr>
                </table>
              </div>
            
              <!-- Receiving Institution -->
              <div class="pdf-section">
                <h3>Receiving Institution</h3>
                <table class="pdf-table">
                  <tr>
                    <td>Name:</td>
                    <td><input type="text" name="la_receivingName"></td>
                  </tr>
                  <tr>
                    <td>Faculty / Department:</td>
                    <td><input type="text" name="la_receivingFaculty"></td>
                  </tr>
                  <tr>
                    <td>Erasmus Code:</td>
                    <td><input type="text" name="la_receivingCode"></td>
                  </tr>
                  <tr>
                    <td>Address:</td>
                    <td><input type="text" name="la_receivingAddress"></td>
                  </tr>
                  <tr>
                    <td>Country:</td>
                    <td><input type="text" name="la_receivingCountry"></td>
                  </tr>
                  <tr>
                    <td>Contact Person:</td>
                    <td><input type="text" name="la_receivingContact"></td>
                  </tr>
                </table>
              </div>
            
              <!-- Study Programme at Receiving Institution -->
              <div class="pdf-section">
                <h3>Study Programme at Receiving Institution</h3>
                <label>Planned Period: From <input type="month" name="la_periodFrom"> To <input type="month" name="la_periodTo"></label>
              
                <!-- Table A -->
                <h4>Table A: Courses at Receiving Institution</h4>
                <table class="pdf-table">
                  <tr>
                    <th>Component Code</th>
                    <th>Course Title</th>
                    <th>Semester</th>
                    <th>ECTS Credits</th>
                  </tr>
                  <tr>
                    <td><input type="text" name="la_a1_code"></td>
                    <td><input type="text" name="la_a1_title"></td>
                    <td><input type="text" name="la_a1_semester"></td>
                    <td><input type="number" name="la_a1_ects"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="la_a2_code"></td>
                    <td><input type="text" name="la_a2_title"></td>
                    <td><input type="text" name="la_a2_semester"></td>
                    <td><input type="number" name="la_a2_ects"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="la_a3_code"></td>
                    <td><input type="text" name="la_a3_title"></td>
                    <td><input type="text" name="la_a3_semester"></td>
                    <td><input type="number" name="la_a3_ects"></td>
                  </tr>
                </table>
              
                <label>Web link to course catalogue: <input type="url" name="la_courseLink"></label>
              
                <p>Language Competence:</p>
                <label><input type="checkbox" name="langCompetence" value="A1"> A1</label>
                <label><input type="checkbox" name="langCompetence" value="A2"> A2</label>
                <label><input type="checkbox" name="langCompetence" value="B1"> B1</label>
                <label><input type="checkbox" name="langCompetence" value="B2"> B2</label>
                <label><input type="checkbox" name="langCompetence" value="C1"> C1</label>
                <label><input type="checkbox" name="langCompetence" value="C2"> C2</label>
                <label><input type="checkbox" name="langCompetence" value="Native"> Native Speaker</label>
              </div>
            
              <!-- Recognition at Sending Institution -->
              <div class="pdf-section">
                <h3>Recognition at Sending Institution</h3>
                <h4>Table B: Courses Recognised at Sending Institution</h4>
                <table class="pdf-table">
                  <tr>
                    <th>Component Code</th>
                    <th>Course Title</th>
                    <th>Semester</th>
                    <th>ECTS Credits</th>
                  </tr>
                  <tr>
                    <td><input type="text" name="la_b1_code"></td>
                    <td><input type="text" name="la_b1_title"></td>
                    <td><input type="text" name="la_b1_semester"></td>
                    <td><input type="number" name="la_b1_ects"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="la_b2_code"></td>
                    <td><input type="text" name="la_b2_title"></td>
                    <td><input type="text" name="la_b2_semester"></td>
                    <td><input type="number" name="la_b2_ects"></td>
                  </tr>
                  <tr>
                    <td><input type="text" name="la_b3_code"></td>
                    <td><input type="text" name="la_b3_title"></td>
                    <td><input type="text" name="la_b3_semester"></td>
                    <td><input type="number" name="la_b3_ects"></td>
                  </tr>
                </table>
              </div>
            
              <!-- Commitment / Signatures -->
              <div class="pdf-section">
                <h3>Commitment / Signatures</h3>
                <label>Student Name: <input type="text" name="la_commitStudentName"></label><br>
                <label>Email: <input type="email" name="la_commitStudentEmail"></label><br>
                <label>Position: <input type="text" name="la_commitStudentPosition"></label><br>
                <label>Date: <input type="date" name="la_commitStudentDate"></label><br>
                <label>Signature: <input type="text" name="la_commitStudentSignature"></label><br>
                <label>Responsible Person (Sending Institution) Name: <input type="text" name="la_commitSendingName"></label><br>
                <label>Email: <input type="email" name="la_commitSendingEmail"></label><br>
                <label>Position: <input type="text" name="la_commitSendingPosition"></label><br>
                <label>Date: <input type="date" name="la_commitSendingDate"></label><br>
                <label>Signature: <input type="text" name="la_commitSendingSignature"></label><br>
                <label>Responsible Person (Receiving Institution) Name: <input type="text" name="la_commitReceivingName"></label><br>
                <label>Email: <input type="email" name="la_commitReceivingEmail"></label><br>
                <label>Position: <input type="text" name="la_commitReceivingPosition"></label><br>
                <label>Date: <input type="date" name="la_commitReceivingDate"></label><br>
                <label>Signature: <input type="text" name="la_commitReceivingSignature"></label><br>
              </div>
            
              <div class="pdf-section">
                <h3>During the Mobility</h3>
                <table class="pdf-table">
                    <thead>
                        <tr>
                            <th>Study Programme Component</th>
                            <th>Code</th>
                            <th>Semester</th>
                            <th>Number of ECTS Credits</th>
                            <th>Planned Learning Outcomes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text" name="duringComp1"></td>
                            <td><input type="text" name="duringCode1"></td>
                            <td><input type="text" name="duringSemester1"></td>
                            <td><input type="number" name="duringECTS1"></td>
                            <td><input type="text" name="duringOutcomes1"></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="duringComp2"></td>
                            <td><input type="text" name="duringCode2"></td>
                            <td><input type="text" name="duringSemester2"></td>
                            <td><input type="number" name="duringECTS2"></td>
                            <td><input type="text" name="duringOutcomes2"></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="duringComp3"></td>
                            <td><input type="text" name="duringCode3"></td>
                            <td><input type="text" name="duringSemester3"></td>
                            <td><input type="number" name="duringECTS3"></td>
                            <td><input type="text" name="duringOutcomes3"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
          
            <div class="pdf-section">
                  <h3>After the Mobility</h3>
                  <table class="pdf-table">
                      <thead>
                          <tr>
                              <th>Study Programme Component</th>
                              <th>Code</th>
                              <th>Semester</th>
                              <th>Number of ECTS Credits</th>
                              <th>Achieved Learning Outcomes</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <td><input type="text" name="afterComp1"></td>
                              <td><input type="text" name="afterCode1"></td>
                              <td><input type="text" name="afterSemester1"></td>
                              <td><input type="number" name="afterECTS1"></td>
                              <td><input type="text" name="afterOutcomes1"></td>
                          </tr>
                          <tr>
                              <td><input type="text" name="afterComp2"></td>
                              <td><input type="text" name="afterCode2"></td>
                              <td><input type="text" name="afterSemester2"></td>
                              <td><input type="number" name="afterECTS2"></td>
                              <td><input type="text" name="afterOutcomes2"></td>
                          </tr>
                          <tr>
                              <td><input type="text" name="afterComp3"></td>
                              <td><input type="text" name="afterCode3"></td>
                              <td><input type="text" name="afterSemester3"></td>
                              <td><input type="number" name="afterECTS3"></td>
                              <td><input type="text" name="afterOutcomes3"></td>
                          </tr>
                      </tbody>
                  </table>
              </div>
              <!-- Save button-->
            <div style="display: flex; justify-content: center; margin-top: 20px;">
              <button type="button" class="btn-large" onclick="saveLearningAgreement()">Save</button>
            </div>
            </div>
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

        // Toggle the active class
       item.classList.toggle("active");
    }
  </script>
  <script>
    let page = 1;

    const page1 = document.getElementById("formPage1");
    const page2 = document.getElementById("formPage2");

    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");

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

    prevBtn.onclick = () => {
      page = 1;
      updatePages();
    };

    nextBtn.onclick = () => {
      page = 2;
      updatePages();
    };
  </script>

  <script>
    //Save buttons use the methods below:
    function serializeForm(formContainerId) {
        const container = document.getElementById(formContainerId);
        const inputs = container.querySelectorAll("input, textarea, select");
        const data = {};
    
        inputs.forEach(input => {
            if (input.type === "checkbox") {
                data[input.name] = input.checked;
            } else {
                data[input.name] = input.value;
            }
        });
      
        return JSON.stringify(data);
    }

    function saveApplicationForm() {
      const form = document.querySelector("#formPage1");
      const formData = new FormData(form);
      const json = {};
        
      formData.forEach((value, key) => {
        json[key] = value;
      });
    
      fetch("saveApplicationForm", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(json)
      })
      .then(res => res.json())
      .then(data => {
        alert("Application saved! Application ID: " + data.applicationId);
      })
      .catch(err => {
        console.error(err);
        alert("Error saving application");
      });
    }

    function saveLearningAgreement() {
      const form = document.querySelector("#formPage2");
      const formData = new FormData(form);
      const json = {};
        
      formData.forEach((value, key) => {
        json[key] = value;
      });
    
      fetch("saveLearningAgreement", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(json)
      })
      .then(res => res.json())
      .then(data => {
        alert("Learning Agreement saved! Application ID: " + data.applicationId);
      })
      .catch(err => {
        console.error(err);
        alert("Error saving Learning Agreement");
      });
    }
  </script>
  
  <script>
    //Loads form inputs that were previously entered
    function loadForm(formContainerId, servletColumn) {
        fetch("LoadFormServlet?form=" + servletColumn)
            .then(response => response.json())
            .then(data => {
                const container = document.getElementById(formContainerId);
                const inputs = container.querySelectorAll("input, textarea, select");
                inputs.forEach(input => {
                    if(data.hasOwnProperty(input.name)){
                        if(input.type === "checkbox") input.checked = data[input.name];
                        else input.value = data[input.name];
                    }
                });
            });
    }

    // Load both forms on page load
    window.onload = function() {
        loadForm("formPage1", "application_form");
        loadForm("formPage2", "learning_agreement");
    };
  </script>

  <%@ include file="footer.jsp" %>

</body>
</html>