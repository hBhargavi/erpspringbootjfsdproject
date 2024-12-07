<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Enrolled Students</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Students Enrolled in ${course.courseName}</h1>

    <c:if test="${not empty message}">
        <div style="color: green;">${message}</div>
    </c:if>

    <table>
        <tr>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.studentId}</td>
                <td>${student.name}</td>
                <td>
                    <form action="unregisterStudent" method="post">
                        <input type="hidden" name="studentId" value="${student.studentId}" />
                        <input type="hidden" name="courseId" value="${course.courseId}" />
                        <button type="submit">Unregister</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
