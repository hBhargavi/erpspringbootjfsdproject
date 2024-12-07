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
    <title>&nbsp;&nbsp;&nbsp;&nbsp;View All Students</title>
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
            font-size: 10px; /* Smaller font size */
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
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            background-color: #000; /* Black background */
            color: #fff; /* White text */
            font-family: 'Poppins', sans-serif;
            font-size: 9px;
            font-weight: 600;
            padding: 8px 15px;
            border-radius: 6px;
            border: 1px solid transparent; /* Smooth edge */
           
            transition: all 0.3s ease;
            cursor: pointer;
        }

        /* Add an icon (optional) */
        .update-btn i {
            margin-right: 8px; /* Spacing between icon and text */
            font-size: 6px;
        }

        /* Hover Effect */
        .update-btn:hover {
            background-color: #fff; /* White background */
            color: #000; /* Black text */
            border: 2px solid #000; /* Black border */
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
    <h3><u>Update Students</u></h3>
    <input type="text" id="searchInput" placeholder="Search for Students...">
    
    <table>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>Father's Name</th>
            <th>Mother's Name</th>
            <th>Contact No.</th>
            <th>Email</th>
            <th>Major Degree</th>
            <th>Program</th>
            <th>Profile</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${stulist}" var="stu">
            <tr>
                <td><c:out value="${stu.id}"/></td>
                <td><c:out value="${stu.firstName}"/></td>
                <td><c:out value="${stu.lastName}"/></td>
                <td><c:out value="${stu.gender}"/></td>
                <td><c:out value="${stu.fatherName}"/></td>
                <td><c:out value="${stu.motherName}"/></td>
                <td><c:out value="${stu.contactNo}"/></td>
                <td><c:out value="${stu.personalEmail}"/></td>
                <td><c:out value="${stu.majorDegree}"/></td>
                <td><c:out value="${stu.program}"/></td>
                 <td> 

<img src='displaystudentprofile?id=${stu.id}' width="100%" height="100%"> 

</td>

<td>
                <a href="/updatestudentdetails?sid=${stu.id}" class="update-btn">
                     Update Student
                </a>
            </td>




            </tr>
        </c:forEach>
    </table>
</body>
</html>
