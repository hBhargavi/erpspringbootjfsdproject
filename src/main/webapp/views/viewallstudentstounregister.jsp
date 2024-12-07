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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Mapped Courses</title>
    <style>
        body {
            background-color: #f4f4f4;
        }

        table {
            width: 60%;
            margin-top: 20px;
            margin-left: 25%;
            border-collapse: collapse;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
        }

        #searchInput {
            width: 60%;
            padding: 10px;
            margin-top: 20px;
            margin-left: 25%;
            display: block;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid transparent;
        }

        th, td {
            padding: 4px;
            text-align: center;
            font-size: 12px;
            word-wrap: break-word;
        }

        th {
            background-color: #333;
            color: white;
        }

        td {
            max-width: 80px;
        }

        td:first-child {
            max-width: 40px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }

        tr:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        h3 {
            text-align: center;
        }
          .submit-button {
            background-color: black;
            color: white;
            padding: 5px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .submit-button:hover {
            background-color: #45a049;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#searchInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("table tbody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>

<h2 align="center">Unregister Students</h2>
<input type="text" id="searchInput" placeholder="Search for Students...">
<table border="2" align="center">
    <thead>
        <tr>
        	<th>Regulation</th>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Course Code</th>
            <th>Faculty Name</th>
            <th>Section</th>
            <th>Year</th>
            <th>Semester</th>
            <th>Update</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty studentList}">
            <c:forEach var="student" items="${studentList}">
                <c:forEach var="course" items="${student.courses}">
                    <tr>
                    	<td>${course.regulation}</td>
                        <td>${student.id}</td> 
                        <td>${student.firstName} ${student.lastName}</td> 
                        <td>${course.coursecode}</td>  
                        <td>${course.faculty.firstName} ${course.faculty.lastName}</td> 
                        <td>${course.section}</td>  
                        <td>${course.year}</td>  
                        <td>${course.semester}</td>
                        <td>
                            <form action="/unregisterStudent" method="POST">
                                <input type="hidden" name="studentId" value="${student.id}" />
                                <input type="hidden" name="courseId" value="${course.courseId}" />
                                <button type="submit" class="submit-button">Unregister</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </c:forEach>
        </c:if>
    </tbody>
</table>
</body>
</html>
