
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
    <title>Course Added Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black; /* Black background */
            color: white; /* White text */
            text-align: center; /* Center-align text */
            margin: 0;
            padding: 50px 20px; /* Padding for better spacing */
        }

        h1 {
            font-size: 2.5em; /* Larger heading size */
            margin-bottom: 20px; /* Space below the heading */
        }

        p {
            font-size: 1.2em; /* Slightly larger paragraph text */
            margin: 10px 0; /* Space above and below paragraphs */
        }

        a {
            display: inline-block; /* Make the link block for better spacing */
            padding: 10px 20px; /* Padding around the link */
            background-color: white; /* White background for the link */
            color: black; /* Black text for the link */
            text-decoration: none; /* Remove underline */
            border-radius: 5px; /* Rounded corners for the link */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }

        a:hover {
            background-color: gray; /* Change to gray on hover */
            color: white; /* Change text color to white on hover */
        }
    </style>
</head>
<body>
    <h1>Course Added Successfully!</h1>
    <p><c:out value="${message}"></c:out></p>
    <a href="insertcourse">Add Again</a>
    <br>
</body>
</html>
