<%@ page import="com.klef.jfsd.springboot.Models.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Admin adm = (Admin) session.getAttribute("admin");
if (adm == null)
{
    response.sendRedirect("sessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Exam PDF</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0; /* Light grey background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
        }

        .form-container {
            background-color: #fff; /* White background for form */
            padding: 20px;
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px; /* Small form width */
            text-align: center;
        }

        h2 {
            font-size: 1.2rem;
            font-weight: 600;
            color: #333; /* Dark text color */
            margin-bottom: 20px;
        }

        label {
            font-size: 0.9rem;
            color: #333; /* Dark label text */
            display: block;
            margin-bottom: 8px;
        }

        select, input[type="file"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 0.875rem;
        }

        button {
            background-color: #333; /* Black button */
            color: #fff; /* White text */
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.875rem;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #555; /* Darker shade on hover */
        }

        /* Responsive design for small screens */
        @media screen and (max-width: 480px) {
            .form-container {
                width: 90%; /* Full width on smaller screens */
            }
        }

        .error-message {
            color: red; /* Red error message text */
            font-size: 1rem;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<%@ include file="adminnavbar.jsp" %>


 <!-- Display error message if exists -->
    <c:if test="${not empty error}">
        <div class="error-message">${error}</div>
    </c:if>
<div class="form-container">
    <h2>Upload Exam PDF</h2>

   

    <form action="uploadExamPDF" method="post" enctype="multipart/form-data">
        <div>
            <label for="student">Select Student:</label>
            <select name="studentId" id="student">
                <option value="">Select Student</option>
                <c:forEach var="student" items="${students}">
                    <option value="${student.id}">${student.id}</option>
                </c:forEach>
            </select>
        </div>

       <div>
    <label for="course">Select Course:</label>
    <select name="courseId" id="course">
        <option value="">Select Course</option>
        <c:forEach var="course" items="${courses}">
            <option value="${course.courseId}">${course.coursecode} ${course.courseName}</option>
        </c:forEach>
    </select>
</div>


        <div>
            <label for="faculty">Select Faculty:</label>
            <select name="facultyId" id="faculty">
                <option value="">Select Faculty</option>
                <c:forEach var="faculty" items="${faculties}">
                    <option value="${faculty.id}">${faculty.id} ${faculty.firstName} ${faculty.middleName} ${faculty.lastName}</option>
                </c:forEach>
            </select>
        </div>

        <div>
            <label for="pdfFile">Upload Exam PDF:</label>
            <input type="file" name="pdfFile" id="pdfFile" required>
        </div>

        <div>
            <label for="year">Year:</label>
            <select id="year" name="year" required>
                <option value="">--SELECT--</option>
                <option value="2021-2022">2021-2022</option>
                <option value="2022-2023">2022-2023</option>
                <option value="2023-2024">2023-2024</option>
            </select>
        </div>

        <div>
            <label for="semester">Semester:</label>
            <select id="semester" name="semester" required>
                <option value="">--SELECT--</option>
                <option value="odd">Odd</option>
                <option value="even">Even</option>
            </select>
        </div>

        <div>
            <button type="submit">Upload Exam</button>
        </div>
    </form>
</div>

</body>
</html>
