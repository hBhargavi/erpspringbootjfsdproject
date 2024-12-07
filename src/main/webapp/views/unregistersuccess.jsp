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
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Success</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Use a clean font */
            background-color:white; /* Black background */
            color: black; /* White text color */
            display: flex; /* Center content */
            flex-direction: column;
            justify-content: center; /* Center vertically */
            align-items: center; /* Center horizontally */
            height: 100vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
        }

        h1 {
            text-align: center; /* Center the heading */
            margin-bottom: 20px; /* Space below heading */
        }

        a {
            color: black; /* White link color */
            text-decoration: underline; /* Underline links */
            font-size: 16px; /* Font size for the link */
        }

        a:hover {
            color: black; /* Light gray on hover */
        }
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
    <h1 align="center">Unregistered Successfully</h1>
    
    <br>
     <a href="viewallstudentstounregister">Back to Courses</a>
</body>
</html>
