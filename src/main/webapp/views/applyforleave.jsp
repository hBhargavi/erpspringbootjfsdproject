<%@page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@page import="com.klef.jfsd.springboot.Models.Leave"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    Faculty f = (Faculty) session.getAttribute("faculty");
    if (f == null) {
        response.sendRedirect("facultylogin"); // Redirect to login if not authenticated
        return; // Prevent further processing
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply for Leave</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styles for form */
        body {
            background-color: #f8f9fa; /* Light background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Transparent background */
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px; /* Thinner design */
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 15px;
            font-size: 1.5em;
        }
        .form-group label {
            font-weight: bold;
            color: #333;
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid #ccc;
            padding: 8px;
            background-color: #f9f9f9;
        }
.btn-primary {
    background-color: #000; /* Black submit button */
    border: 1px solid #000;
    padding: 6px 12px;
    font-size: 0.9em;
    display: inline-block; /* Place the buttons side by side */
    margin-right: 5px; /* Small gap between buttons */
}

.btn-primary:hover {
    background-color: #333; /* Darker black on hover */
    border: 1px solid #333;
}

.btn-clear {
    background-color: red;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 6px 12px;
    font-size: 0.9em;
    cursor: pointer;
    display: inline-block; /* Place the buttons side by side */
}

.btn-clear:hover {
    background-color: darkred;
}

.text-center button {
    width: auto; /* Ensure the buttons are not stretched */
    margin-right: 5px; /* Small gap between buttons */
}

    </style>
</head>
<body>
    <%@ include file="facultynavbar.jsp" %> <!-- Include the Faculty Navbar -->

    <div class="container">
        <h2>Leave Application Form</h2>
        <form action="/applyleave" method="POST">
            <!-- Leave Type -->
            <div class="form-group">
                <label for="leaveType">Leave Type</label>
                <select class="form-control" id="leaveType" name="leaveType" required>
                    <option value="Sick Leave">Sick Leave</option>
                    <option value="Casual Leave">Casual Leave</option>
                    <option value="Annual Leave">Annual Leave</option>
                </select>
            </div>

            <!-- Start Date -->
            <div class="form-group">
                <label for="startDate">Start Date</label>
                <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>

            <!-- End Date -->
            <div class="form-group">
                <label for="endDate">End Date</label>
                <input type="date" class="form-control" id="endDate" name="endDate" required>
            </div>

            <!-- Reason for Leave -->
            <div class="form-group">
                <label for="reason">Reason for Leave</label>
                <textarea class="form-control" id="reason" name="reason" rows="4" required></textarea>
            </div>

            <!-- Faculty ID (hidden) -->
            <div class="form-group">
                <input type="hidden" id="facultyId" name="facultyId" value="<%= f.getId() %>">
            </div>

            <!-- Submit and Clear Buttons -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Submit </button>
                <button type="reset" class="btn btn-clear">Clear </button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
