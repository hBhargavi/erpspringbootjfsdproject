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
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0 auto;
            width: 70%; /* Ensure consistent width */
        }
        .search-bar {
            width: 100%; /* Match the width of the container */
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
        }
        #searchInput {
            width: 60%; /* Keep the width the same as table */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
    table {
    width: 100%; /* Match the width of the container */
    margin-left: 400px; /* Move the table slightly to the right */
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
              .action-button {
        display: inline-block;
        padding: 6px 12px;
        font-size: 0.85em;
        color: white;
        background-color: black; /* Blue button */
        text-align: center;
        text-decoration: none;
        border: 1px solid black;
        border-radius: 4px;
        transition: background-color 0.3s ease, border-color 0.3s ease;
    }

    .action-button:hover {
        background-color: black; /* Darker blue on hover */
        border-color: black;
    }
        
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
<h1 align="center">Update Faculty Members List</h1>

<div class="container">
    <div class="search-bar">
        <input type="text" placeholder="Search Faculty..." id="searchInput">
    </div>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>F. Name</th>
                <th>M. Name</th>
                <th>L. Name</th>
                <th>Gender</th>
                <th>Email</th>
                <th>Phone No.</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="faculty" items="${facultyList}">
                <tr>
                    <td>${faculty.id}</td>
                    <td>${faculty.firstName}</td>
                    <td>${faculty.middleName}</td>
                    <td>${faculty.lastName}</td>
                    <td>${faculty.gender}</td>
                    <td>${faculty.email}</td>
                    <td>${faculty.phoneNumber}</td>
                   <td>
    <a href="updatefacultydetails?fid=${faculty.id}" class="action-button">Update</a>
</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
