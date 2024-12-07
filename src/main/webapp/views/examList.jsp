<%@page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Faculty f = (Faculty) session.getAttribute("faculty");
if (f == null) 
{
    response.sendRedirect("facultylogin"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Exams List</title>
</head>
<body>
<%@ include file="facultynavbar.jsp" %>
    <h2>Exams Assigned to You</h2>
    <table border="2" align="center">
        <tr>
            <th>Exam ID</th>
            <th>Course</th>
            <th>Year</th>
            <th>Semester</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="exam" items="${exams}">
            <tr>
                <td>${exam.id}</td>
                <td>${exam.course.courseName}</td>
                <td>${exam.year}</td>
                <td>${exam.semester}</td>
                <td>${exam.status}</td>
                <td><a href="${pageContext.request.contextPath}/${exam.id}">View Details</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
