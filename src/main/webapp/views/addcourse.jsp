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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />"> <!-- Link to your CSS -->
    <style>
        body {
            background-color: #f4f4f4; /* Light background for contrast */
            font-family: Arial, sans-serif; /* Clean font */
        }

        .container {
            max-width: 400px; /* Max width for the form */
            margin: 50px auto; /* Center the container */
            padding: 20px; /* Padding around the form */
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
        }

        h1 {
            text-align: center; /* Center the header */
            margin-bottom: 20px; /* Space below header */
        }

        label {
            display: block; /* Block display for labels */
            margin-bottom: 5px; /* Space below labels */
            font-weight: bold; /* Bold labels */
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%; /* Full width inputs */
            padding: 8px; /* Padding for inputs */
            margin-bottom: 15px; /* Space below inputs */
            border: 1px solid #ddd; /* Light border */
            border-radius: 4px; /* Rounded corners */
            font-size: 14px; /* Font size */
        }

        button {
            width: 100%; /* Full width button */
            padding: 10px; /* Padding for button */
            background-color: #333; /* Dark background */
            color: white; /* White text */
            border: none; /* No border */
            border-radius: 4px; /* Rounded corners */
            font-size: 16px; /* Font size */
            cursor: pointer; /* Pointer on hover */
            transition: background-color 0.3s; /* Smooth transition */
        }

        button:hover {
            background-color: #555; /* Lighter on hover */
        }

        .message {
            text-align: center; /* Center align the message */
            color: green; /* Color of the message */
            margin-bottom: 20px; /* Space below the message */
        }

        /* Additional CSS for L-T-P-S alignment */
        .ltps-label {
            font-style: italic; /* Italic for differentiation */
            color: #555; /* Subtle color */
        }
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>

    <!-- Message in center -->
    <div class="message">
        <c:out value="${message}" />
    </div>

    <div class="container">
        <h1>Add New Course</h1>

        <form action="addcourse" method="post">
            <div>
                <label for="courseName">Course Name:</label>
                <input type="text" id="courseName" name="courseName" required>
            </div>
            <div>
                <label for="facultyId">Select Faculty:</label>
                <select id="facultyId" name="facultyId" required>
                    <c:forEach var="faculty" items="${facultyList}">
                        <option value="${faculty.id}">${faculty.id}-${faculty.firstName} ${faculty.lastName}</option>
                    </c:forEach>
                </select>
            </div>
            <div>
                <label for="credits">Course Credits:</label>
                <input type="number" id="credits" name="credits" required>
            </div>
            
            <div>
                <label for="coursecode">Course Code:</label>
                <input type="text" id="coursecode" name="coursecode" required>
            </div>
            
            <div>
                <label for="ltps" class="ltps-label">L-T-P-S (Lecture-Tutorial-Practical-Self-Study):</label>
                <input type="text" id="ltps" name="ltps" required>
            </div>
            
            <div>
                <label for="cyear">Course Year:</label>
                <select id="cyear" name="cyear" required>
                    <option>2021-2022</option>
                    <option>2022-2023</option>
                    <option>2023-2024</option>
                </select>
            </div>
            <div>
                <label for="csem">Course Semester:</label>
                <select id="csem" name="csem" required>
                    <option>odd</option>
                    <option>even</option>
                </select>
            </div>
            <div>
                <label for="regulation">Regulation:</label>
                <select id="regulation" name="regulation" required>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                </select>
            </div>
            <div>
                <label for="section">Select Section:</label>
                <select id="section" name="section" required>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                </select>
            </div>
            <div>
                <button type="submit">Add Course</button>
            </div>
        </form>
    </div>
</body>
</html>