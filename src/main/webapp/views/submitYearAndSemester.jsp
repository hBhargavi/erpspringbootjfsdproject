<%@page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@page import="com.klef.jfsd.springboot.Models.Leave"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    Faculty f = (Faculty) session.getAttribute("faculty");
    if (f == null) {
        response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
        return; // Prevent further processing
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Faculty Courses</title>
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
    <%@ include file="facultynavbar.jsp" %>
    <h2 align="center">View Courses</h2>
    <form action="viewfacultycourses" method="get">
    
        <label for="cyear">Select Academic Year:</label>
        <select id="cyear" name="cyear">
        	<option>--SELECT--</option>
            <option>2021-2022</option>
            <option>2022-2023</option>
            <option>2023-2024</option>
        </select>

        <label for="csem">Select Semester:</label>
        <select id="csem" name="csem">
        <option>--SELECT--</option>
            <option>odd</option>
            <option>even</option>
            <!-- Add more semesters as needed -->
        </select>

        <div class="buttons">
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </div>
    </form>
</body>
</html>
