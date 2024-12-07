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
    <title>Update Faculty Details</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
            font-size: 24px;
        }

        form {
            background-color: #ffffff;
            padding: 15px 20px;
            width: 90%;
            max-width: 500px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-weight: bold;
            color: #555;
            width: 100%;
            margin-bottom: 5px;
            font-size: 14px;
        }

        input, select, textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            margin-bottom: 10px;
            box-sizing: border-box;
            background-color: #fafafa;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #3a8df5;
            box-shadow: 0 0 5px rgba(58, 141, 245, 0.3);
            background-color: #fff;
        }

        input[type="submit"] {
            background-color: #333;
            color: #ffffff;
            font-weight: bold;
            border: none;
            padding: 10px 0;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }

        textarea {
            resize: vertical;
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            form {
                padding: 10px 15px;
            }

            input, select, textarea {
                font-size: 13px;
            }
        }
            .submit-button {
            background-color: black;
            color: white;
            padding: 5px 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .submit-button:hover {
            background-color: black;
        }
        
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
    <h1 align="center">Update Faculty Details</h1>
    <form action="updatefaculty" method="post" align="center">
    	<label>Faculty ID</label>
        <input type="number" name="fid" value="${faculty.id}"  readonly/>

        <label>First Name:</label>
        <input type="text" name="fname" value="${faculty.firstName}" /><br>

        <label>Middle Name:</label>
        <input type="text" name="mname" value="${faculty.middleName}" /><br>

        <label>Last Name:</label>
        <input type="text" name="lname" value="${faculty.lastName}" /><br>

        <label>Gender:</label>
        <input type="text" name="gender" value="${faculty.gender}" /><br>

        <label>Father's Name:</label>
        <input type="text" name="fatherName" value="${faculty.fatherName}" /><br>

        <label>Mother's Name:</label>
        <input type="text" name="motherName" value="${faculty.motherName}" /><br>

        <label>Blood Group:</label>
        <input type="text" name="bloodGroup" value="${faculty.bloodGroup}" /><br>

        <label>Marital Status:</label>
        <input type="text" name="maritalStatus" value="${faculty.maritalStatus}" /><br>

        <label>Mother Tongue:</label>
        <input type="text" name="motherTongue" value="${faculty.motherTongue}" /><br>

        <label>Caste Category:</label>
        <input type="text" name="castCategory" value="${faculty.castCategory}" /><br>

        <label>Email:</label>
        <input type="email" name="email" value="${faculty.email}" /><br>

        <label>Phone Number:</label>
        <input type="text" name="phone" value="${faculty.phoneNumber}" /><br>

        <label>Identification:</label>
        <input type="text" name="identification" value="${faculty.identification}" /><br>

        <label>Religion:</label>
        <input type="text" name="religion" value="${faculty.religion}" /><br>

        <label>Nationality:</label>
        <input type="text" name="nationality" value="${faculty.nationality}" /><br>

        <label>Designation:</label>
        <input type="text" name="designation" value="${faculty.designation}" /><br>

        <label>Courses Taught:</label>
        <input type="text" name="coursestaught" value="${faculty.coursestaught}" /><br>

        <label>Department:</label>
        <input type="text" name="department" value="${faculty.department}" /><br>

        <label>Recruit Agency:</label>
        <input type="text" name="recruitAgency" value="${faculty.recruitAgency}" /><br>

        <label>PF Number:</label>
        <input type="text" name="pfNumber" value="${faculty.pfNumber}" /><br>

        <label>Recruitment Type:</label>
        <input type="text" name="recruitmentType" value="${faculty.recruitmentType}" /><br>

        <label>Resume Link:</label>
        <input type="url" name="resumeLink" value="${faculty.resumeLink}" /><br>

        <label>Approval Status:</label>
        <input type="text" name="approvalStatus" value="${faculty.approvalStatus}" /><br>

        <label>Disability:</label>
        <input type="text" name="disability" value="${faculty.disability}" /><br>

        <label>Place of Birth:</label>
        <input type="text" name="placeOfBirth" value="${faculty.placeOfBirth}" /><br>

        <label>Experience:</label>
        <input type="text" name="experience" value="${faculty.experience}" /><br>

        <label>Date of Birth:</label>
        <input type="date" name="dob" value="${faculty.dob}" /><br>

        <label>Joining Date:</label>
        <input type="date" name="joiningDate" value="${faculty.joiningDate}" /><br>

        <label>Height:</label>
        <input type="text" name="height" value="${faculty.height}" /><br>

        <label>Weight:</label>
        <input type="text" name="weight" value="${faculty.weight}" /><br>

        <label>Address:</label>
        <textarea name="address">${faculty.address}</textarea><br>

        <label>City:</label>
        <input type="text" name="city" value="${faculty.city}" /><br>

        <label>State:</label>
        <input type="text" name="state" value="${faculty.state}" /><br>

        <label>Country:</label>
        <input type="text" name="country" value="${faculty.country}" /><br>

        <label>Postal Code:</label>
        <input type="text" name="postalCode" value="${faculty.postalCode}" /><br>

        <input  type="submit" class="submit-button" value="Update Faculty" />
    </form>
</body>
</html>
