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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #ffffff; /* Plain white background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Modern, clean font */
            display: flex;
            flex-direction: column; /* Flex direction for navbar and content */
            align-items: center; /* Center horizontally */
            justify-content: flex-start; /* Start at the top instead of center */
            text-align: center; /* Center text inside the container */
        }

        .navbar {
            width: 100%;
            background-color: #007bff;
            padding: 15px 0;
            color: white;
            text-align: center;
            position: absolute; /* Keep navbar fixed at the top */
            top: 0; /* Align to the top */
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 1.2rem;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .container {
            margin-top: 70px; /* Offset for the navbar height */
            width: 80%;
            max-width: 1200px;
            padding: 20px 0; /* Added padding for spacing */
        }

        h1 {
            font-size: 2.5rem;
            color: #333;
            margin: 0; /* Removed margin for a more compact design */
            letter-spacing: 1px;
        }
    </style>
</head>
<body>

<%@ include file="studentnavbar.jsp" %>

<div class="container">
    <h1>Welcome <%= stu.getId() %></h1>
</div>

</body>
</html>
