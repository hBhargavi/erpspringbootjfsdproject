<%@ page import="com.klef.jfsd.springboot.Models.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Student stu = (Student) session.getAttribute("student");
if (stu == null) {
    response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<html>
<head>
    <title>Select Year and Semester</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f5f5f5; /* Light background for contrast */
        }
        form {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 400px; /* Set a maximum width */
            margin: auto; /* Center the form */
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        select {
            width: 100%; /* Full width */
            padding: 8px;
            margin-bottom: 10px;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
        }
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            color: white; /* Text color for buttons */
        }
        button[type="submit"],
        button[type="reset"] {
            background-color: black; /* Black background for both buttons */
        }
    </style>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %>
    <h2 align="center">Select Academic Year and Semester</h2>
    <form action="${pageContext.request.contextPath}/viewstudentcourses" method="post">
        <label for="cyear">Select Academic Year:</label>
        <select id="cyear" name="year" required> <!-- Changed name to 'year' -->
            <option value="">--SELECT--</option>
            <option value="2021-2022">2021-2022</option>
            <option value="2022-2023">2022-2023</option>
            <option value="2023-2024">2023-2024</option>
        </select>

        <label for="csem">Select Semester:</label>
        <select id="csem" name="semester" required> <!-- Changed name to 'semester' -->
            <option value="">--SELECT--</option>
            <option value="odd">Odd</option>
            <option value="even">Even</option>
        </select>

        <div class="buttons">
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </div>
    </form>
</body>
</html>
