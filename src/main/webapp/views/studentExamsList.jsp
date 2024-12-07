<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Exams</title>
</head>
<style>
/* Centered and Compact Student Exams Table */
.container {
  padding: 2rem;
  margin: auto;
  max-width: 60%; /* Decreased width for more compact display */
  color: #333;
}

h1 {
  font-size: 1.6rem;
  font-weight: bold;
  text-align: center;
  margin-bottom: 1rem;
  color: #000; /* Black color for main heading */
}

.table-container {
  overflow-x: auto;
  margin: 0 auto;
  max-width: 80%; /* Further reduced table width */
}

table {
  width: 100%;
  border-collapse: collapse;
  font-size: 0.8rem; /* Reduced font size for compact view */
  text-align: left;
  background-color: #f9f9f9;
}

table thead tr {
  background-color: #e0e0e0;
}

table th, table td {
  padding: 0.6rem; /* Reduced padding for smaller table */
  border: 1px solid #ddd;
}

table th {
  font-weight: bold;
  color: #000; /* Darker color for table headings */
}

table tbody tr:nth-child(odd) {
  background-color: #f2f2f2;
}

table tbody tr:hover {
  background-color: #e0f7fa;
  transition: background-color 0.3s;
}

.table-actions a {
  color: #2196f3;
  text-decoration: none;
  padding: 0.3rem 0.6rem;
  border: 1px solid #2196f3;
  border-radius: 4px;
  font-size: 0.75rem;
  display: inline-block;
  transition: background-color 0.3s, color 0.3s;
}

.table-actions a:hover {
  background-color: #2196f3;
  color: #fff;
}

.message {
  text-align: center;
  font-size: 1rem;
  color: #4caf50;
  margin: 1rem 0;
}
</style>
<body>
<%@ include file="studentnavbar.jsp" %>

<div class="container">
    <h1>Exam Results</h1>
    
    <c:if test="${not empty message}">
        <p class="message">${message}</p>
    </c:if>

    <div class="table-container">
        <table align="center">
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Exam ID</th>
                    <th>Grade</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="exam" items="${exams}">
                    <tr>
                        <td>${exam.course.courseId}</td>
                        <td>${exam.course.courseName}</td>
                        <td>${exam.id}</td>
                        <td>${exam.grade != null ? exam.grade : "Not Graded Yet"}</td>
                        <td>
                            <a href="/viewstuexamPDF/${exam.id}" class="table-actions">View PDF</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
