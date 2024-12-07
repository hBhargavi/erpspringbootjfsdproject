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
    <title>Timetable List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            text-align: center;
        }

        .container {
            width: 50%;
            margin: auto;
            padding-top: 20px;
            display: flex;
            justify-content: flex-end; /* Pushes content inside to the right */
        }

        h2 {
            color: #333;
        }

        /* Search bar styling */
        .search-container {
            margin-bottom: 20px;
            text-align: right;
        }

        .search-container input[type="text"] {
            width: 200px;
            padding: 8px;
            border: 1px solid #333;
            border-radius: 4px;
            outline: none;
        }

        /* Table styling */
        table {
            width: 100%; /* Adjusted within container */
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #ffffff;
            border-radius: 8px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
            font-weight: bold;
            border-top: 2px solid #333;
        }

        td {
            border-top: 1px solid #ddd;
        }

        /* 3D effect for table rows */
        tr {
            transition: all 0.3s ease;
        }

        tr:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            transform: translateY(-3px);
            background-color: #f0f0f0;
        }
     
        h2 {
            color: #333;
        }
         /* Styling for the timetable description */
        p {
            background-color: ;
            padding: 12px;
            border-radius: 8px;
            color: #444;
            font-size: 16px;
            margin-top: 10px;
            
          
        }
        
    </style>

    <script>
        // JavaScript for search filter
        function filterTable() {
            let input = document.getElementById("searchInput").value.toUpperCase();
            let table = document.getElementById("timetableTable");
            let rows = table.getElementsByTagName("tr");

            for (let i = 1; i < rows.length; i++) {
                let row = rows[i];
                let cells = row.getElementsByTagName("td");
                let match = false;

                for (let j = 0; j < cells.length; j++) {
                    if (cells[j].innerText.toUpperCase().indexOf(input) > -1) {
                        match = true;
                        break;
                    }
                }

                row.style.display = match ? "" : "none";
            }
        }
    </script>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
<div class="container">
    <div>
        <h2>Timetable List</h2>
        <!-- Search Bar -->
        <div class="search-container">
            <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Search timetable...">
        </div>

        <table id="timetableTable">
    <thead>
        <tr>
            <th>Course</th>
            <th>Faculty</th>
            <th>Day</th>
            <th>Period</th>
            <th>Year</th>
            <th>Semester</th>
            <th>Section</th>
        </tr>
    </thead>
    <tbody>
        <!-- Iterate through each timetable entry -->
        <c:forEach var="timetable" items="${timetableList}">
            <tr>
                <td>${timetable.course.coursecode} ${timetable.course.courseName}</td>
                <td>${timetable.faculty.firstName} ${timetable.faculty.middleName} ${timetable.faculty.lastName}</td>
                <td>${timetable.dayOfWeek}</td>
                <td>${timetable.period}</td>
                <td>${timetable.year}</td> 
                <td>${timetable.semester}</td> 
                <td>${timetable.section}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

    </div>
</div>
</body>
</html>
