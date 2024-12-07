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
    <title>Delete Faculty Members</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 2em; /* Increase font size for heading */
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); /* Subtle shadow effect */
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
        th, td {
            padding: 5px 10px; /* Increased padding for larger cells */
            text-align: left; /* Keep text aligned to the left */
            border: 1px solid #ddd;
            background: #fff; /* White background for cells */
            transition: background-color 0.3s, transform 0.3s; /* Smooth transitions */
            font-size: 0.85em; /* Increased font size */
            max-width: 120px; /* Set a max-width for cells */
            overflow: hidden; /* Hide overflow text */
            text-overflow: ellipsis; /* Show ellipsis for overflow text */
            white-space: nowrap; /* Prevent text from wrapping */
        }
        th {
            background: linear-gradient(to bottom, #222, #444); /* Dark gradient for headers */
            color: white;
            font-weight: bold;
        }
        tbody tr {
            transition: background-color 0.3s, transform 0.3s; /* Smooth transitions */
        }
        tbody tr:nth-child(even) {
            background-color: #f2f2f2; /* Light gray for even rows */
        }
        tbody tr:hover {
            background-color: #e0e0e0; /* Light gray on hover */
            transform: translateY(-3px); /* Raise the row slightly on hover */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3); /* Shadow effect on hover */
        }
        tbody tr:hover td {
            background-color: #fff; /* Keep hover background white for cells */
        }
        a {
            color: #222; /* Dark link color */
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .delete-icon {
            color: red; /* Color for delete icon */
            margin-right: 5px; /* Space between icon and text */
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
<h1>Delete Faculty Members</h1>
<input type="text" id="searchInput" placeholder="Search for Faculty...">
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Last Name</th>
                <th>Gender</th>
                <th>Father's Name</th>
                <th>Mother's Name</th>
                <th>Blood Group</th>
                <th>Email</th>
                <th>Phone Number</th>
               
                <th>Resume Link</th>
               
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Country</th>
                <th>Postal Code</th>
                <th>Profile</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="faculty" items="${faclist}">
                <tr>
                    <td>${faculty.id}</td>
                    <td>${faculty.firstName}</td>
                    <td>${faculty.middleName}</td>
                    <td>${faculty.lastName}</td>
                    <td>${faculty.gender}</td>
                    <td>${faculty.fatherName}</td>
                    <td>${faculty.motherName}</td>
                    <td>${faculty.bloodGroup}</td>
                    <td>${faculty.email}</td>
                    <td>${faculty.phoneNumber}</td>
                    
                    <td><a href="${faculty.resumeLink}">View Resume</a></td>
                   
                    <td>${faculty.address}</td>
                    <td>${faculty.city}</td>
                    <td>${faculty.state}</td>
                    <td>${faculty.country}</td>
                    <td>${faculty.postalCode}</td>
                        <td> 

<img src='displayfacultyprofile?id=${faculty.id}' width="140%" height="130%"> 

</td>
                    <td>
                       <a href='<c:url value="delete?id=${faculty.id}"/>' onclick="return confirm('Are you sure you want to delete this course?');">
                            <i class="fas fa-trash delete-icon"></i> <!-- Delete icon -->
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
