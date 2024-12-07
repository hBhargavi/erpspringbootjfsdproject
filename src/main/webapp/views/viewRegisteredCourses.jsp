<%@ page import="com.klef.jfsd.springboot.Models.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Student stu = (Student) session.getAttribute("student");
if (stu == null) {
    response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<html>
<head>
    <title>Registered Courses</title>
  <style>
body {
        background-color: #f4f4f4; /* Light background for contrast */
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
         #searchInput {
            width: 60%;
            padding: 10px;
            margin-top: 20px;
            margin-left: 25%; /* Increase left margin to move right from center */
            display: block;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 0.75em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid transparent; /* Use transparent border for better gradient effect */
        }

        th, td {
            padding: 4px; /* Reduced padding for compactness */
            text-align: center;
            font-size: 13px; /* Smaller font size */
            word-wrap: break-word; /* Allows breaking long words */
            position: relative; /* For absolute positioning of shadows */
        }

        th {
            background-color: #333;
            color: white;
        }

        /* Set maximum width for specific columns */
        td {
            max-width: 80px; /* General width limit for most columns */
        }

        td:first-child { /* Specific styling for ID column */
            max-width: 40px; /* Smaller width for ID */
        }

        td:nth-child(2), /* First Name */
        td:nth-child(3) { /* Last Name */
            max-width: 60px; /* Limit width for name columns */
        }

        td:nth-child(6), /* Mother Name */
        td:nth-child(7) { /* Contact Number */
            max-width: 100px; /* Adjust width for these fields */
        }

        td:nth-child(8) { /* Permanent Address */
            max-width: 120px; /* Adjust width for address */
        }

        td:nth-child(10) { /* Blood Group */
            max-width: 60px; /* Adjust width for blood group */
        }

        td:nth-child(11) { /* Marital Status */
            max-width: 70px; /* Adjust width for marital status */
        }

        td:nth-child(12) { /* Mother Tongue */
            max-width: 80px; /* Adjust width for mother tongue */
        }

        td:nth-child(13) { /* Caste Category */
            max-width: 80px; /* Adjust width for caste category */
        }

        td:nth-child(17), /* Religion */
        td:nth-child(18) { /* Nationality */
            max-width: 80px; /* Adjust width for these fields */
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }

        tr:hover {
            transform: translateY(-3px); /* Lift effect on hover */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3); /* Shadow on hover */
            transition: transform 0.2s, box-shadow 0.2s; /* Smooth transition */
        }

        h3 {
            text-align: center;
        }
        
    </style>
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
    <%@ include file="studentnavbar.jsp" %>
    
    <div class="container">
       <h1 align="center">View Registered Courses</h1>

        
        <c:if test="${not empty message}">
            <div class="error-message">${message}</div>
        </c:if>

        <input type="text" id="searchInput" placeholder="Search for courses...">

        <table>
            <thead>
                <tr>
                    <th>Regulation</th>
                    <th>Course Code</th>
                    <th>Course Name</th>
                    <th>L-T-P-S</th>
                    <th>Section</th>
                    <th>Year</th>
                    <th>Semester</th>
                    <th>Faculty</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty registeredCourses}">
                        <tr>
                            <td colspan="8" style="text-align:center;">No courses found for the selected year and semester.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="course" items="${registeredCourses}">
                            <tr>
                                <td>${course.regulation}</td>
                                <td>${course.coursecode}</td>
                                <td>${course.courseName}</td>
                                <td>${course.ltps}</td>
                                <td>${course.section}</td>
                                <td>${course.year}</td>
                                <td>${course.semester}</td>
                                <td>${course.faculty.id} ${course.faculty.firstName} ${course.faculty.middleName} ${course.faculty.lastName}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</body>
</html>
