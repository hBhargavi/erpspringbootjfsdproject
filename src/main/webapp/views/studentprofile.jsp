<%@ page import="com.klef.jfsd.springboot.Models.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
Student stu = (Student) session.getAttribute("student");
if (stu == null) {
    response.sendRedirect("login"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<%@ include file="studentnavbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Profile</title>
 <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4; /* Light background */
            color: #333333; /* Dark text for contrast */
            margin: 0;
            padding: 20px;
        }

        .profile-container {
            max-width: 800px; /* Adjusted width for compactness */
            margin: 50px auto;
            background: #ffffff; /* White background */
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            padding: 20px;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .profile-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2); /* Elevation effect */
        }

        .image-container {
            position: absolute;
            top: -60px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px; /* Reduced size for smaller profile */
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
            border: 4px solid #ffffff; /* White border */
            background-color: #e0e0e0; /* Default placeholder background */
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }


        .profile-header {
            text-align: center;
            margin-top: 80px;
            margin-bottom: 15px; /* Reduced space */
        }

        .profile-header h2 {
            font-size: 2.2em; /* Slightly smaller header */
            margin: 0;
            font-weight: bold;
            color: #333333; /* Dark text for header */
        }

        .profile-content {
            display: flex;
            flex-wrap: wrap;
            gap: 30px; /* Reduced gap between fields */
            justify-content: space-between;
            margin-top: 20px;
        }

        .profile-field {
            flex: 1 1 calc(50% - 15px); /* Smaller width for fields */
            margin-top: 12px; /* Adjusted margin */
        }

        .profile-field label {
            font-weight: bold;
            color: #555555; /* Dark gray for labels */
            margin-bottom: 5px;
            display: block;
        }

        .profile-field .value {
            display: block;
            width: 100%;
            padding: 10px; /* Reduced padding */
            background: #f9f9f9; /* Light background for values */
            border-radius: 8px;
            color: #333333;
            font-size: 0.9em; /* Smaller text for compactness */
            line-height: 1.4;
            border: 1px solid #dddddd; /* Light border */
        }

        .password-container {
            position: relative;
        }

        .password-container input {
            padding-right: 35px;
        }

        .toggle-password {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #888888; /* Subtle gray */
        }

        @media (max-width: 768px) {
            .profile-field {
                flex: 1 1 100%;
            }
        }
    </style>


</head>
<body>

<div class="profile-container">
    <div class="image-container">
        <img src="displaystudentprofile?id=<%= stu.getId() %>" alt="Profile Picture">
    </div>
   
    <div class="profile-content">
        <div class="profile-field">
            <label>First Name:</label>
            <span class="value"><%= stu.getFirstName() %></span>
        </div>
        <div class="profile-field">
            <label>Last Name:</label>
            <span class="value"><%= stu.getLastName() %></span>
        </div>
        <div class="profile-field">
            <label>Gender:</label>
            <span class="value"><%= stu.getGender() %></span>
        </div>
        <div class="profile-field">
            <label>Father's Name:</label>
            <span class="value"><%= stu.getFatherName() %></span>
        </div>
        <div class="profile-field">
            <label>Mother's Name:</label>
            <span class="value"><%= stu.getMotherName() %></span>
        </div>
        <div class="profile-field">
            <label>Contact No:</label>
            <span class="value"><%= stu.getContactNo() %></span>
        </div>
        <div class="profile-field">
            <label>Permanent Address:</label>
            <span class="value"><%= stu.getPermanentAddress() %></span>
        </div>
        <div class="profile-field">
            <label>Date of Birth:</label>
            <span class="value"><%= stu.getDateOfBirth() %></span>
        </div>
        <div class="profile-field">
            <label>Blood Group:</label>
            <span class="value"><%= stu.getBloodGroup() %></span>
        </div>
        <div class="profile-field">
            <label>Marital Status:</label>
            <span class="value"><%= stu.getMaritalStatus() %></span>
        </div>
        <div class="profile-field">
            <label>Mother Tongue:</label>
            <span class="value"><%= stu.getMotherTongue() %></span>
        </div>
        <div class="profile-field">
            <label>Caste Category:</label>
            <span class="value"><%= stu.getCasteCategory() %></span>
        </div>
        <div class="profile-field">
            <label>Personal Email:</label>
            <span class="value"><%= stu.getPersonalEmail() %></span>
        </div>
        <div class="profile-field">
            <label>Identification:</label>
            <span class="value"><%= stu.getIdentification() %></span>
        </div>
        <div class="profile-field">
            <label>Disability:</label>
            <span class="value"><%= stu.getDisability() %></span>
        </div>
        <div class="profile-field">
            <label>Place of Birth:</label>
            <span class="value"><%= stu.getPlaceOfBirth() %></span>
        </div>
        <div class="profile-field">
            <label>Height:</label>
            <span class="value"><%= stu.getHeight() %> cm</span>
        </div>
        <div class="profile-field">
            <label>Weight:</label>
            <span class="value"><%= stu.getWeight() %> kg</span>
        </div>
        <div class="profile-field">
            <label>Religion:</label>
            <span class="value"><%= stu.getReligion() %></span>
        </div>
        <div class="profile-field">
            <label>Nationality:</label>
            <span class="value"><%= stu.getNationality() %></span>
        </div>
        <div class="profile-field">
            <label>Admission Date:</label>
            <span class="value"><%= stu.getAdmissionDate() %></span>
        </div>
        <div class="profile-field">
            <label>Major Degree:</label>
            <span class="value"><%= stu.getMajorDegree() %></span>
        </div>
        <div class="profile-field">
            <label>Referred By:</label>
            <span class="value"><%= stu.getReferredBy() %></span>
        </div>
        <div class="profile-field">
            <label>Program:</label>
            <span class="value"><%= stu.getProgram() %></span>
        </div>
        <div class="profile-field">
            <label>Regulation:</label>
            <span class="value"><%= stu.getRegulation() %></span>
        </div>
        <div class="profile-field">
            <label>Hostel Status:</label>
            <span class="value"><%= stu.getHostelStatus() %></span>
        </div>
        <div class="profile-field">
            <label>High School:</label>
            <span class="value"><%= stu.getHighSchool() %></span>
        </div>
        <div class="profile-field">
            <label>Intermediate:</label>
            <span class="value"><%= stu.getIntermediate() %></span>
        </div>
        <div class="profile-field">
            <label>Password:</label>
            <div class="password-container">
                <input type="password" id="passwordField" value="<%= stu.getPassword() %>" class="value" readonly>
                <span class="toggle-password" onclick="togglePassword()">👁</span>
            </div>
        </div>
    </div>
</div>

<script>
    function togglePassword() {
        const passwordField = document.getElementById('passwordField');
        if (passwordField.type === 'password') {
            passwordField.type = 'text';
        } else {
            passwordField.type = 'password';
        }
    }
</script>

</body>
</html>
