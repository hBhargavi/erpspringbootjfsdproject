<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Admin adm = (Admin) session.getAttribute("admin");
if (adm == null) {
    response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details Form</title>
    <style>
        /* Basic styling for form */
        form {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }
        label {
            font-weight: bold;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .submit-button {
            background-color: black;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .submit-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
 <%@ include file="adminnavbar.jsp" %>
    <h2 style="text-align:center;">Student Details Form</h2>
    <form action="updatestudent" method="post" align="center">
    
        <label for="id">Student ID</label>
        <input type="text" id="id" name="id" value="${student.id}" readonly>

        <label for="firstName">First Name</label>
        <input type="text" id="firstName" name="firstName" value="${student.firstName}" required>

        <label for="lastName">Last Name</label>
        <input type="text" id="lastName" name="lastName" value="${student.lastName}" required>

        <label for="gender">Gender</label>
        <input type="text" id="gender" name="gender" value="${student.gender}" required>

        <label for="fatherName">Father's Name</label>
        <input type="text" id="fatherName" name="fatherName" value="${student.fatherName}" required>

        <label for="motherName">Mother's Name</label>
        <input type="text" id="motherName" name="motherName" value="${student.motherName}" required>

        <label for="contactNo">Contact No</label>
        <input type="text" id="contactNo" name="contactNo" value="${student.contactNo}" required>

        <label for="permanentAddress">Permanent Address</label>
        <textarea id="permanentAddress" name="permanentAddress" required>${student.permanentAddress}</textarea>

        <label for="dateOfBirth">Date of Birth</label>
<input type="date" id="dateOfBirth" name="dateOfBirth" value="${student.dateOfBirth}" required>

        <label for="bloodGroup">Blood Group</label>
        <input type="text" id="bloodGroup" name="bloodGroup" value="${student.bloodGroup}" required>

        
        <label for="maritalStatus">Marital Status</label>
        <input type="text" id="maritalStatus" name="maritalStatus" value="${student.maritalStatus}" required>

        <label for="motherTongue">Mother Tongue</label>
        <input type="text" id="motherTongue" name="motherTongue" value="${student.motherTongue}" required>

        <label for="casteCategory">Caste Category</label>
        <input type="text" id="casteCategory" name="casteCategory" value="${student.casteCategory}" required>

        <label for="personalEmail">Personal Email</label>
        <input type="email" id="personalEmail" name="personalEmail" value="${student.personalEmail}" required>

        <label for="identification">Identification</label>
        <input type="text" id="identification" name="identification" value="${student.identification}" required>

        <label for="disability">Disability</label>
        <input type="text" id="disability" name="disability" value="${student.disability}" required>

        <label for="placeOfBirth">Place of Birth</label>
        <input type="text" id="placeOfBirth" name="placeOfBirth" value="${student.placeOfBirth}" required>

        <label for="height">Height</label>
        <input type="number" step="0.01" id="height" name="height" value="${student.height}" required>

        <label for="weight">Weight</label>
        <input type="number" step="0.01" id="weight" name="weight" value="${student.weight}" required>

        <label for="religion">Religion</label>
        <input type="text" id="religion" name="religion" value="${student.religion}" required>

        <label for="nationality">Nationality</label>
        <input type="text" id="nationality" name="nationality" value="${student.nationality}" required>

        <label for="admissionDate">Admission Date</label>
<input type="date" id="admissionDate" name="admissionDate" value="${student.admissionDate}" required>


        <label for="majorDegree">Major Degree</label>
        <input type="text" id="majorDegree" name="majorDegree" value="${student.majorDegree}" required>

        <label for="program">Program</label>
        <input type="text" id="program" name="program" value="${student.program}" required>

        <label for="hostelStatus">Hostel Status</label>
        <input type="text" id="hostelStatus" name="hostelStatus" value="${student.hostelStatus}" required>

        <label for="highSchool">High School</label>
        <input type="text" id="highSchool" name="highSchool" value="${student.highSchool}" required>

        <label for="intermediate">Intermediate</label>
        <input type="text" id="intermediate" name="intermediate" value="${student.intermediate}" required>

      

       
       

        <button type="submit" class="submit-button">Submit</button>
    </form>
</body>
</html>
