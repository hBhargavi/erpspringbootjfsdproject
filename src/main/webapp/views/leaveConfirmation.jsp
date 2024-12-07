<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@page import="com.klef.jfsd.springboot.Models.Leave"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    Faculty f = (Faculty) session.getAttribute("faculty");
    if (f == null) {
        response.sendRedirect("facultylogin"); // Redirect to login if not authenticated
        return; // Prevent further processing
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Application Status</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%@ include file="facultynavbar.jsp" %> <!-- Include the Faculty Navbar -->

    <!-- Normal Success Message Box -->
    <div style="max-width: 500px; margin: 50px auto; padding: 20px; background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 5px; font-family: Arial, sans-serif; text-align: center;">
        <h4 style="margin-bottom: 10px;">Success!</h4>
        <p><c:out value="${message}" /></p> <!-- Success message displayed here -->
    </div>

</body>
</html>
