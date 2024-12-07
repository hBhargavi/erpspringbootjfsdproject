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
    <title>View Faculty Members</title>
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
    <h1>Faculty Members List</h1>
    <input type="text" id="searchInput" placeholder="Search for Faculty...">
    <table>
        <thead>
            <tr>
            	<th>ID</th>
                <th>F. Name</th>
                <th>M. Name</th>
                <th>L. Name</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Phone No.</th>
                <th>ID</th>
                
                <th>Resume</th>
                <th>Approval Status</th>
                
                <th>Place of Birth</th>
                <th>Experience</th>
                <th>DOB</th>
                <th>Joining Date</th>
                
                <th>Address</th>
                
                <th>Profile</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="faculty" items="${facultyList}">
                <tr>
                	<td>${faculty.id} </td>
                    <td>${faculty.firstName}</td>
                    <td>${faculty.middleName}</td>
                    <td>${faculty.lastName}</td>
                    <td>${faculty.gender}</td>
                    <td>${faculty.email}</td>
                    <td>${faculty.phoneNumber}</td>
                    <td>${faculty.identification}</td>
                   
                    <td><a href="${faculty.resumeLink}">View Resume</a></td>
                    <td>${faculty.approvalStatus}</td>
                    
                    <td>${faculty.placeOfBirth}</td>
                    <td>${faculty.experience}</td>
                    <td>${faculty.dob}</td>
                    <td>${faculty.joiningDate}</td>
                    
                    <td>${faculty.address}</td>
                   
                   
                    <td> 

<img src='displayfacultyprofile?id=${faculty.id}' width="120%" height="100%"> 

</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
