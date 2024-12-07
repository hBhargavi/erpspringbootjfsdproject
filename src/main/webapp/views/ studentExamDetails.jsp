<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Exam Details</title>
</head>
<body>
<%@ include file="studentnavbar.jsp" %>
    <h1>Exam Details</h1>

    <c:if test="${not empty exam}">
        <p><strong>Course Name:</strong> ${exam.course.courseName}</p>
        <p><strong>Exam ID:</strong> ${exam.id}</p>
        <p><strong>Grade:</strong> ${exam.grade != null ? exam.grade : "Not Graded Yet"}</p>
        <a href="/viewstuexamPDF/${exam.id}"> Exam PDF</a>
    </c:if>

    <c:if test="${empty exam}">
        <p>Exam details not found.</p>
    </c:if>

    <a href="/studentexams">Back to Exams List</a>
</body>
</html>
