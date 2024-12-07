<%@ page import="com.klef.jfsd.springboot.Models.Faculty" %>
<%@ page import="com.klef.jfsd.springboot.Models.Attendance" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Faculty faculty = (Faculty) session.getAttribute("faculty");
if (faculty == null) {
    response.sendRedirect("facultylogin"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>

<html>
<head>
    <title>Faculty Attendance View</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            overflow: hidden;
        }

        th, td {
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: white;
        }

        td {
            color: #333;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 40px;
        }

        #searchInput {
            width: 60%;
            padding: 10px;
            margin-top: 20px;
            margin-left: 20%; /* Adjust margin to center the search bar */
            display: block;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .message {
            text-align: center;
            color: green;
            font-size: 1.2em;
            margin-top: 20px;
        }

        .download-btn {
            display: block;
            width: 200px;
            padding: 10px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            text-align: center;
            margin: 20px auto;
            cursor: pointer;
        }

        .download-btn:hover {
            background-color: #444;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="facultynavbar.jsp" %>
<div class="container">
    <h2>Attendance for Year: ${year} - Semester: ${semester}</h2>
    
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>

    <!-- Search Bar -->
    <input type="text" id="searchInput" placeholder="Search for Student...">

    <!-- Combined Table for all Attendance Records -->
    <table>
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Student First Name</th>
                <th>Student Last Name</th>
               
                <th>Course </th>
                <th>Section</th>
                <th>Attendance Status</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through all attendance records -->
            <c:forEach var="attendance" items="${attendanceList}">
                <tr>
                    <td>${attendance.student.id}</td>
                    <td>${attendance.student.firstName}</td>
                    <td>${attendance.student.lastName}</td>
                    <td>${attendance.course.courseName}</td>
                     <td>${attendance.course.section }</td>
                    <td>${attendance.status}</td>
                    <td>${attendance.date}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <!-- Single Download Button for All Attendance Records -->
    <button class="download-btn" onclick="downloadTable()">Download Attendance</button>

</div>

<!-- jQuery for filtering table rows -->
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

    // Download function to export the table to CSV
    function downloadTable() {
        var table = document.querySelector("table");
        var rows = table.querySelectorAll("tr");
        var csv = [];

        rows.forEach(function(row) {
            var cols = row.querySelectorAll("td, th");
            var rowData = [];
            cols.forEach(function(col) {
                rowData.push('"' + col.innerText + '"');
            });
            csv.push(rowData.join(","));
        });

        var csvFile = new Blob([csv.join("\n")], { type: 'text/csv' });
        var downloadLink = document.createElement("a");
        downloadLink.href = URL.createObjectURL(csvFile);
        downloadLink.download = "attendance.csv";
        downloadLink.click();
    }
</script>

</body>
</html>
