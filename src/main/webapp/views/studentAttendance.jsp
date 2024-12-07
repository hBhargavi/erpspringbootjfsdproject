<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Student Attendance</title>
    <style>
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
    
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2; /* Light grey background */
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
        th, td {
            padding: 8px; /* Reduced padding */
            text-align: center;
            border: 1px solid #000; /* Black border for a clean look */
        }
        th {
            background-color: #000; /* Black background for header */
            color: white; /* White text in header */
        }
        td {
            color: #333; /* Dark text color for table data */
        }
        h2 {
            text-align: center; /* Center the heading */
            color: #333; /* Dark text color */
        }
        .message {
            color: red; /* Red text for error messages */
            text-align: center; /* Center the message */
            margin: 10px 0; /* Space above and below message */
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
<%@ include file="studentnavbar.jsp" %>
<h2 align="center">Attendance for  for Year: ${year} ,Semester: ${semester}</h2>

<c:if test="${not empty message}">
    <div class="message">${message}</div>
</c:if>
 
    <input type="text" id="searchInput" placeholder="Search for Student...">
<table>
    <thead>
        <tr>
            <th>Date</th>
 			<th>Course Code</th>
            <th>Course</th>
            <th>Section</th>
            <th>Status</th>
            
            
            
            
        </tr>
    </thead>
    <tbody>
        <c:if test="${not empty attendanceList}">
            <c:forEach var="attendance" items="${attendanceList}">
                <tr>
                    <td>${attendance.date}</td>
                   
                    <td>${attendance.course.coursecode}</td>
                    <td>${attendance.course.courseName}</td>
                    <td>${attendance.course.section}</td>
                     <td>${attendance.status}</td>
                   

                    
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty attendanceList}">
            <tr>
                <td colspan="4" style="text-align: center;">No attendance records found.</td>
            </tr>
        </c:if>
    </tbody>
</table>
 <button class="download-btn" onclick="downloadTable()">Download Attendance</button>
 
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
