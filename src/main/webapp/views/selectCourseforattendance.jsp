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
%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Course</title>
<style>
    /* 3D Table Styling with Transparency */
    .form-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        font-family: Arial, sans-serif;
        background-color: rgba(255, 255, 255, 0.8);
    }

    .form-table {
        width: 50%;
        background: rgba(255, 255, 255, 0.6); /* Semi-transparent white background */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        padding: 20px;
        text-align: center;
        backdrop-filter: blur(10px); /* Adds a subtle blur effect */
    }

    .form-table h2 {
        color: #333;
        font-size: 20px;
        margin-bottom: 15px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
        border-radius: 8px;
        overflow: hidden;
        background: rgba(255, 255, 255, 0.4); /* Transparent background for the table */
    }

    th, td {
        padding: 10px;
        text-align: center;
        font-size: 14px;
        border-bottom: 1px solid rgba(51, 51, 51, 0.2); /* Light border with transparency */
    }

    th {
        background-color: rgba(244, 244, 244, 0.5); /* Light transparent background for header */
        font-weight: bold;
        color: #333;
    }

    tr:hover {
        background-color: rgba(250, 250, 250, 0.6); /* Slightly brighter on hover */
        transform: scale(1.01);
        transition: transform 0.2s ease, background-color 0.2s ease;
    }

    .select-button {
        padding: 4px 10px;
        font-size: 12px;
        color: white;
        background-color: black;
        border: 1px solid #333;
        border-radius: 4px;
        cursor: pointer;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        transition: background-color 0.3s ease, transform 0.2s;
    }

    .select-button:hover {
        background-color: #333;
        transform: scale(1.05);
    }

    .message {
        color: #d9534f;
        font-size: 14px;
        margin-top: 10px;
    }
</style>
</head>
<body>

<%@ include file="facultynavbar.jsp" %>
<div class="form-container">
    <div class="form-table">
        <h2>Select Course for Year ${year}, Semester ${semester}</h2>
        <c:if test="${not empty message}">
            <p class="message">${message}</p>
        </c:if>
        <c:if test="${not empty courses}">
            <form action="viewFacultyAttendance" method="get">
                <input type="hidden" name="year" value="${year}">
                <input type="hidden" name="semester" value="${semester}">
                
                <table>
                    <tr>
                    	<th>Regulation</th>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Section</th>
                        <th>Select</th>
                    </tr>
                    <c:forEach var="course" items="${courses}">
                        <tr>
                        <td>${course.regulation}</td>
                            <td>${course.courseId}</td>
                            <td>${course.courseName}</td>
                             <td>${course.section }</td>
                            <td>
                                <button type="submit" class="select-button" name="courseId" value="${course.courseId}">View Students</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </c:if>
    </div>
</div>

</body>
</html>
