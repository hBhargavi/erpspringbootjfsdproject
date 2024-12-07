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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Course Form</title>
    <style>
        /* Basic black-and-white styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
        }
        h2 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #fff;
            padding: 20px;
            max-width: 500px;
            margin: auto;
            border: 1px solid #333;
            border-radius: 8px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }
        fieldset {
            border: none;
            margin-bottom: 15px;
            width: 100%;
        }
        label {
            font-weight: bold;
        }
        .input-field {
            background-color: #f1f1f1;
            border: none;
            padding: 8px;
            width: 100%;
            margin-top: 5px;
            margin-bottom: 15px;
        }
        button {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
<h2>Update Course for Student: ${student.id}</h2>

<form action="updatecourse" method="post">
		
		
    
        <label for="studentId">Student ID:</label>
        <div class="input-field">${student.id}</div> 
        <input type="hidden" name="studentId" value="${student.id}" />
    

        <label for="courseCode">Course Code:</label>
        <input type="text" id="courseCode" name="courseCode" class="input-field" value="${course.coursecode}" required />

        <label for="facultyName">Faculty Name:</label>
        <input type="text" id="facultyName" name="facultyName" class="input-field" value="  ${course.faculty.id}- ${course.faculty.firstName} ${course.faculty.middleName} ${course.faculty.lastName}" required />
        
        

        <label for="section">Section:</label>
        <input type="text" id="section" name="section" class="input-field" value="${course.section}" required />

        <label for="year">Year:</label>
        <input type="text" id="year" name="year" class="input-field" value="${course.year}" required />

        <label for="semester">Semester:</label>
        <input type="text" id="semester" name="semester" class="input-field" value="${course.semester}" required />


    
    <button type="submit">Update Course</button>
</form>

</body>
</html>
