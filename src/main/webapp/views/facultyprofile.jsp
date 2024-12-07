<%@ page import="com.klef.jfsd.springboot.Models.Faculty" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Faculty f = (Faculty) session.getAttribute("faculty");
if (f == null) 
{
    response.sendRedirect("facultylogin");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   <style>
        /* General styling */
        body {
            font-family: 'Roboto', sans-serif; /* Stylish font */
            background-color: #f4f4f4; /* Light background for contrast */
            margin: 0;
            padding: 20px;
            color: #333; /* Improved text color */
        }

        /* Profile container */
        .profile-container {
            max-width: 700px; /* Reduced max width for smaller form */
            margin: 0 auto;
            background: #fff;
            border-radius: 12px; /* Slightly rounder corners */
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2); /* Increased shadow for 3D effect */
            padding: 20px; /* Adequate padding */
            position: relative;
            transition: transform 0.3s ease; /* Added transition for hover effect */
        }

        .profile-container:hover {
            transform: translateY(-5px); /* Lift effect on hover */
        }

        /* Image container */
        .image-container {
            position: absolute;
            top: 20px; /* Adjusted position */
            right: 20px;
            width: 120px; /* Adjusted image size */
            height: 120px; /* Adjusted image size */
            border-radius: 50%;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease; /* Added transition for hover effect */
        }

        .image-container:hover {
            transform: scale(1.1); /* Scale effect on hover */
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Profile details container */
        .details-container {
            padding-top: 110px; /* Adjusted padding to give space for the image */
        }

        .profile-header {
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 2px solid #000; /* Changed to black for header */
        }

        .profile-header h2 {
            margin: 0;
            font-size: 2.2em; /* Decreased font size */
            color: #000; /* Changed to black for heading */
            font-weight: 500; /* Adjusted font weight */
        }

        .profile-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding-top: 10px; /* Decreased padding */
        }

        .profile-field {
            width: 48%; /* Two fields per row */
            margin-top: 10px; /* Decreased margin top */
            display: flex;
            flex-direction: column; /* Stack label and value vertically */
        }

        .profile-field label {
            font-weight: 500; /* Changed to semi-bold */
            color: #444; /* Darker label color */
            display: inline-block;
            margin-bottom: 3px; /* Decreased margin bottom */
            font-size: 0.95em; /* Decreased font size */
        }

        .profile-field .value {
            display: block;
            width: 100%;
            padding: 8px; /* Decreased padding */
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            color: #555; /* Slightly darker text color */
            font-size: 0.9em; /* Decreased font size */
            line-height: 1.4; /* Slightly decreased line height for compactness */
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .profile-field {
                width: 100%; /* Full width on smaller screens */
            }
        }

        /* Hover effect */
        .profile-field:hover .value {
            background-color: #e0e0e0; /* Slightly darker background on hover */
        }
    </style>
</head>
<body>
<%@ include file="facultynavbar.jsp" %>

<div class="profile-container">
    <!-- Circular Profile Image in Top-Right -->
    <div class="image-container">
        <img src='displayfacultyprofile?id=${faculty.id}' alt="Faculty Image">
    </div>
    
    <!-- Profile Details -->
    <div class="details-container">
        <div class="profile-header">
            <h2>Profile</h2>
        </div>
        
        <div class="profile-content">
        <div class="profile-field">
                <label>ID</label>
                <span class="value"><%= f.getId() %></span>
            </div>
            <div class="profile-field">
                <label>First Name:</label>
                <span class="value"><%= f.getFirstName() %></span>
            </div>
            <div class="profile-field">
                <label>Middle Name:</label>
                <span class="value"><%= f.getMiddleName() %></span>
            </div>
            <div class="profile-field">
                <label>Last Name:</label>
                <span class="value"><%= f.getLastName() %></span>
            </div>
            <div class="profile-field">
                <label>Gender:</label>
                <span class="value"><%= f.getGender() %></span>
            </div>
            <div class="profile-field">
                <label>Father's Name:</label>
                <span class="value"><%= f.getFatherName() %></span>
            </div>
            <div class="profile-field">
                <label>Mother's Name:</label>
                <span class="value"><%= f.getMotherName() %></span>
            </div>
            <div class="profile-field">
                <label>Date of Birth:</label>
                <span class="value"><%= f.getDob() %></span>
            </div>
            <div class="profile-field">
                <label>Blood Group:</label>
                <span class="value"><%= f.getBloodGroup() %></span>
            </div>
            <div class="profile-field">
                <label>Marital Status:</label>
                <span class="value"><%= f.getMaritalStatus() %></span>
            </div>
            <div class="profile-field">
                <label>Mother Tongue:</label>
                <span class="value"><%= f.getMotherTongue() %></span>
            </div>
            <div class="profile-field">
                <label>Caste Category:</label>
                <span class="value"><%= f.getCastCategory() %></span>
            </div>
            <div class="profile-field">
                <label>Email:</label>
                <span class="value"><%= f.getEmail() %></span>
            </div>
            <div class="profile-field">
                <label>Phone Number:</label>
                <span class="value"><%= f.getPhoneNumber() %></span>
            </div>
            <div class="profile-field">
                <label>Identification:</label>
                <span class="value"><%= f.getIdentification() %></span>
            </div>
            <div class="profile-field">
                <label>Religion:</label>
                <span class="value"><%= f.getReligion() %></span>
            </div>
            <div class="profile-field">
                <label>Nationality:</label>
                <span class="value"><%= f.getNationality() %></span>
            </div>
            <div class="profile-field">
                <label>Joining Date:</label>
                <span class="value"><%= f.getJoiningDate() %></span>
            </div>
            <div class="profile-field">
                <label>Designation:</label>
                <span class="value"><%= f.getDesignation() %></span>
            </div>
            <div class="profile-field">
                <label>Department:</label>
                <span class="value"><%= f.getDepartment() %></span>
            </div>
            <div class="profile-field">
                <label>Courses Taught:</label>
                <span class="value"><%= f.getCoursestaught() %></span>
            </div>
            <div class="profile-field">
                <label>Recruit Agency:</label>
                <span class="value"><%= f.getRecruitAgency() %></span>
            </div>
            <div class="profile-field">
                <label>PF Number:</label>
                <span class="value"><%= f.getPfNumber() %></span>
            </div>
            <div class="profile-field">
                <label>Recruitment Type:</label>
                <span class="value"><%= f.getRecruitmentType() %></span>
            </div>
            <div class="profile-field">
                <label>Resume Link:</label>
                <span class="value"><%= f.getResumeLink() %></span>
            </div>
            <div class="profile-field">
                <label>Approval Status:</label>
                <span class="value"><%= f.getApprovalStatus() %></span>
            </div>
            <div class="profile-field">
                <label>Disability:</label>
                <span class="value"><%= f.getDisability() %></span>
            </div>
            <div class="profile-field">
                <label>Place of Birth:</label>
                <span class="value"><%= f.getPlaceOfBirth() %></span>
            </div>
            <div class="profile-field">
                <label>Height:</label>
                <span class="value"><%= f.getHeight() %> cm</span>
            </div>
            <div class="profile-field">
                <label>Weight:</label>
                <span class="value"><%= f.getWeight() %> kg</span>
            </div>
            <div class="profile-field">
                <label>Experience:</label>
                <span class="value"><%= f.getExperience() %> years</span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
