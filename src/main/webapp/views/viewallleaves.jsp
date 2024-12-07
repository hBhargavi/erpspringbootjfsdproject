<%@ page import="com.klef.jfsd.springboot.Models.Leave" %>
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
    <title>View Leave Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
   <style>
        body {
            background-color: #f4f4f4; /* Light background for contrast */
            font-family: Arial, sans-serif;
        }

        table {
            width: 50%; /* Increased width for better display */
            margin: 30px auto; /* Centering the table */
            border-collapse: collapse;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            background-color: white;
        }

        #searchInput {
            width: 60%;
            padding: 12px;
            margin-top: 20px;
            margin-left: 25%; 
            display: block;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1.1em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #ddd; /* Lighter border color */
        }

        th, td {
            padding: 12px; /* Increased padding */
            text-align: center;
            font-size: 14px; /* Larger font size */
            word-wrap: break-word;
        }

        th {
            background-color: #333;
            color: white;
            font-size: 16px;
        }

        td {
            max-width: 150px; /* Increased width limit for columns */
        }

        td:first-child { 
            max-width: 80px; 
        }

        td:nth-child(2), /* Leave Type */
        td:nth-child(3) { /* Reason */
            max-width: 200px; /* Adjust width for name columns */
        }

        td:nth-child(4), /* Start Date */
        td:nth-child(5) { /* End Date */
            max-width: 120px; /* Adjust width for these fields */
        }

        td:nth-child(6) { /* Status */
            max-width: 100px; 
        }

        td:nth-child(7) { /* Action */
            max-width: 180px; 
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
            font-size: 24px; /* Increased heading size */
            margin-top: 40px;
        }

        .btn {
            font-size: 14px; /* Adjusted button font size */
            padding: 8px 15px; /* Button size */
        }

        .btn-sm {
            font-size: 12px; /* Smaller font size for small buttons */
            padding: 6px 12px; /* Padding for small buttons */
        }

        .alert-info {
            font-size: 18px; /* Larger font for the alert */
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
    <div class="container">
        <h3>All Leave Applications</h3>

        <c:if test="${not empty leaveList}">
            <!-- If leaveList is not empty, display the table -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Leave Id</th>
                        <th>Leave Type</th>
                        <th>Reason</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="leave" items="${leaveList}">
                        <tr>
                            <td>${leave.id}</td>
                            <td>${leave.leaveType}</td>
                            <td>${leave.reason}</td>
                            <td>${leave.startDate}</td>
                            <td>${leave.endDate}</td>
                            <td>${leave.status}</td>
                            <td>
                                <!-- Action buttons for updating leave status -->
                                <a href="updateleavestatus?leaveId=${leave.id}&status=Approved" class="btn btn-success btn-sm">Approve</a>
                                <a href="updateleavestatus?leaveId=${leave.id}&status=Rejected" class="btn btn-danger btn-sm">Reject</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty leaveList}">
            <!-- Display a message if no leave applications found -->
            <div class="alert alert-info">No leave applications found.</div>
        </c:if>
    </div>
</body>
</html>
