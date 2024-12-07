<%@page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Faculty f = (Faculty) session.getAttribute("faculty");
if (f == null) 
{
    response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Attendance Success</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffffff; /* White background */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh; /* Full viewport height */
            margin: 0;
            color: #2c3e50; /* Dark text color for contrast */
        }

        h3 {
            font-size: 36px; /* Large font size */
            text-transform: uppercase; /* Uppercase text for emphasis */
            letter-spacing: 2px; /* Spacing between letters */
            animation: flash 1.5s infinite; /* Flashing effect */
            text-shadow: 0 0 10px rgba(44, 62, 80, 0.5), /* Soft glow effect */
                         0 0 20px rgba(44, 62, 80, 0.3);
        }

        @keyframes flash {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; } /* Fade effect */
        }
    </style>
</head>
<body>
    <%@ include file="facultynavbar.jsp" %>
   <h3>Attendance Success</h3>
<c:if test="${not empty message}">
    <div style="color: red; text-align: center;">${message}</div>
</c:if>


    
</body>
</html>
