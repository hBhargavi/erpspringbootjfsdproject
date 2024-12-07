<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Admin adm = (Admin) session.getAttribute("admin");
if (adm == null) 
{
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
            margin: 0; /* Remove default margin */
            padding: 20px; /* Add padding around the content */
            background-color: #f9f9f9;
            overflow-y: auto; /* Enable vertical scrolling on the body */
            height: 100vh; /* Set height to viewport */
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .table-container {
            max-width: 90%; /* Maximum width for the table container */
            margin: 0 auto; /* Center the container */
            /* Removed max-height */
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
            margin-left: 27%; /* Increase left margin to move right from center */
            display: block;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 4px 6px; /* Further reduced padding for smaller cells */
            text-align: left;
            border: 1px solid #ddd;
            background: #fff; /* White background for cells */
            transition: background-color 0.3s, transform 0.3s; /* Smooth transitions */
            font-size: 0.85em; /* Smaller font size */
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
            padding: 6px 10px; /* Padding around links */
            border-radius: 4px; /* Rounded corners */
            transition: background-color 0.3s, color 0.3s; /* Smooth transitions */
        }
        a.accept {
            background-color: #4CAF50; /* Green background for accept */
            color: white; /* White text */
        }
        a.accept:hover {
            background-color: #45a049; /* Darker green on hover */
        }
        a.reject {
            background-color: #f44336; /* Red background for reject */
            color: white; /* White text */
        }
        a.reject:hover {
            background-color: #e53935; /* Darker red on hover */
        }
        .button-group {
            display: flex; /* Use flexbox for layout */
            gap: 10px; /* Space between buttons */
            justify-content: center; /* Center the buttons */
        }
         .btn {
            font-size: 14px; /* Adjusted button font size */
            padding: 8px 15px; /* Button size */
        }

        .btn-sm {
            font-size: 12px; /* Smaller font size for small buttons */
            padding: 6px 12px; /* Padding for small buttons */
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
&nbsp;
<h1 align="center">Faculty Members List</h1>
<input type="text" id="searchInput" placeholder="Search for Faculty...">
    
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>Last Name</th>
                    <th>Gender</th>
                    <th>Father's Name</th>
                    <th>Mother's Name</th>
                    <th>Blood Group</th>
                    <th>Marital Status</th>
                    <th>Mother Tongue</th>
                    <th>Cast Category</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Identification</th>
                    <th>Resume</th>
                    <th>Approval Status</th>
                   
                    <th>Profile</th>
                    <th>Action</th>
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
                        <td>${faculty.maritalStatus}</td>
                        <td>${faculty.motherTongue}</td>
                        <td>${faculty.castCategory}</td>
                        <td>${faculty.email}</td>
                        <td>${faculty.phoneNumber}</td>
                        <td>${faculty.identification}</td>
                        
                        <td><a href="${faculty.resumeLink}">View Resume</a></td>
                        <td>${faculty.approvalStatus}</td>
                        
                         <td> 

<img src='displayfacultyprofile?id=${faculty.id}' width="120%" height="100%"> 

</td>
                        <td>
                            <div class="button-group">
                                <a class="accept" href='<c:url value="updatestatus?email=${faculty.email}&approvalStatus=Accepted" ></c:url>'>✔ Accept</a>
                                <a class="reject" href='<c:url value="updatestatus?email=${faculty.email}&approvalStatus=Rejected"></c:url>'>✖ Reject</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
