<%@ page import="com.klef.jfsd.springboot.Models.Admin" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Course Details</title>
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

        input, select {
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

        input:focus, select:focus {
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

        /* Responsive adjustments */
        @media (max-width: 600px) {
            form {
                padding: 10px 15px;
            }

            input, select {
                font-size: 13px;
            }
        }
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
    <h1>Update Course Details</h1>
   <form action="/updateallcourse" method="post">
   
   
    <input type="hidden" name="courseId" value="${course.courseId}"/>
    <label for="courseName">Course Name:</label>
    <input type="text" name="courseName" value="${course.courseName}" required />

    <label for="courseCode">Course Code:</label>
    <input type="text" name="courseCode" value="${course.coursecode}" required />

    <label for="credits">Credits:</label>
    <input type="number" name="credits" value="${course.credits}" required />

    <label for="ltps">L-T-P-S:</label>
    <input type="text" name="ltps" value="${course.ltps}" required />

    <label for="year">Year:</label>
    <input type="text" name="year" value="${course.year}" required />

    <label for="semester">Semester:</label>
    <input type="text" name="semester" value="${course.semester}" required />

    <!-- Faculty selection dropdown -->
    <label for="faculty">Select Faculty:</label>
    
<select name="facultyId" required>
    <c:forEach var="faculty" items="${faculties}">
        <option value="${faculty.id}" ${faculty.id == course.faculty.id ? 'selected="selected"' : ''}>
            ${faculty.firstName} ${faculty.middleName} ${faculty.lastName}
        </option>
    </c:forEach>
</select>

 <label for="section">Section:</label>
    <input type="text" name="section" value="${course.section}" required />



    <button type="submit">Update Course</button>
</form>

</body>
</html>
