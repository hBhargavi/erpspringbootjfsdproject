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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Courses</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 2em;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        #searchInput {
            width: 60%;
            padding: 10px;
            margin-top: 20px;
            margin-left: 25%; /* Increase left margin to move right from center */
            display: block;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 60%;
            margin-top: 20px;
            margin-left: 25%; /* Increase left margin to align with search bar */
            border-collapse: collapse;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            overflow: hidden;
        }
        th, td {
            padding: 5px 10px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            transition: background-color 0.3s, transform 0.3s;
            font-size: 0.85em;
            max-width: 120px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        th {
            background: linear-gradient(to bottom, #222, #444);
            color: white;
            font-weight: bold;
        }
        tbody tr {
            transition: background-color 0.3s, transform 0.3s;
        }
        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tbody tr:hover {
            background-color: #e0e0e0;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }
        tbody tr:hover td {
            background-color: #fff;
        }
        a {
            color: #222;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
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
<h1 align="center"> Update Courses </h1>
<input type="text" id="searchInput" placeholder="Search for courses...">
 <div class="message">
        <c:out value="${message}" />
    </div>

<table>
    <thead>
        <tr>
        <th>Regulation</th>
            <th>Course ID</th>
            <th>Course Name</th>
            <th>Course Code</th>
            <th>Credits</th>
            <th>L-T-P-S</th>
            <th>Year</th>
            <th>Semester</th>
            <th>Faculty Name</th>
            <th>Section</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="course" items="${courseList}">
            <tr>
            <td>${course.regulation}</td>
                <td>${course.courseId}</td>
                <td>${course.courseName}</td>
                <td>${course.coursecode}</td>
                <td>${course.credits}</td>
                <td>${course.ltps}</td>
                <td>${course.year}</td>
                <td>${course.semester}</td>
                
                <td>${course.faculty.id} ${faculty.firstName}${faculty.middleName}${faculty.lastName}</td>
                <td>${course.section}</td>
                <td>
                    <a href="updateallcourses?cid=${course.courseId}&fid=${course.faculty.id}" class="update-button">Update</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>