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
</head>
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
            font-size: 1em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid transparent; /* Use transparent border for better gradient effect */
        }

        th, td {
            padding: 4px; /* Reduced padding for compactness */
            text-align: center;
            font-size: 12px; /* Smaller font size */
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
          .update-btn {
        background-color: #000; /* Rich black background */
        color: #fff; /* White text */
        border: 1px solid #000; /* Black border */
        border-radius: 2px; /* Slightly rounded corners */
        padding: 5px 8px; /* Comfortable padding */
        font-size: 11px; /* Standard font size */
        font-family: 'Arial', sans-serif; /* Clean font */
        font-weight: bold; /* Bold text */
        box-shadow: 0 3px 6px rgba(0, 0, 0, 0.3); /* Subtle shadow */
        transition: all 0.3s ease; /* Smooth transition for hover effect */
        cursor: pointer; /* Pointer cursor */
    }

    .update-btn:hover {
        background-color: #fff; /* White background */
        color: #000; /* Black text */
        border: 1px solid #000; /* Black border */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4); /* Slightly enhanced shadow */
    }

    .update-btn:focus {
        outline: none; /* Remove focus outline */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Highlighted focus effect */
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
<body>
<%@ include file="adminnavbar.jsp" %>

<h2 align="center">All Mapped Courses for Students</h2>
<input type="text" id="searchInput" placeholder="Search for Students...">
<table border="2" align="center">
    <thead>
        <tr>
        <th>Regulation</th>
        	 <th>Year</th>
            <th>Semester</th>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Course Code</th>
            <th>Faculty Name</th>
            <th>Section</th>
           
            <th>Update</th>
        </tr>
    </thead>
    <tbody>
        
        <c:forEach var="student" items="${studentList}">
            
            <c:forEach var="course" items="${student.courses}">
                <tr>
                <td>${course.regulation}</td>
                 <td>${course.year}</td>  
                    <td>${course.semester}</td>
                    <td>${student.id}</td> 
                    <td>${student.firstName}${student.lastName}</td> 
                    <td>${course.coursecode}</td>  
                    <td>${course.faculty.firstName}${course.faculty.middleName}${course.faculty.lastName}</td> 
                    <td>${course.section}</td>  
                   
                    <td>
                     <a href="updatecourseform?studentId=${student.id}&courseId=${course.courseId}">
                        <button type="button" class="update-btn">Update</button>

                    </a>
                    </td>
                </tr>
            </c:forEach>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
