<%@ page import="com.klef.jfsd.springboot.Models.Exam" %>
<%@ page import="com.klef.jfsd.springboot.Models.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Admin adm = (Admin) session.getAttribute("admin");
if (adm == null) 
{
    response.sendRedirect("sessionexpiry"); 
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Exams</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1000px;
            margin: auto;
        }
        .search-bar {
            margin-bottom: 30px;
        }
        .search-bar input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        table {
            width: 100%;
            margin: 30px auto;
            border-collapse: collapse;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            background-color: white;
        }
        th, td {
            padding: 12px;
            text-align: center;
            font-size: 14px;
            word-wrap: break-word;
        }
        th {
            background-color: #333;
            color: white;
            font-size: 16px;
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
            font-size: 24px;
            margin-top: 40px;
        }
        .alert-info {
            font-size: 18px;
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
    <div class="container">
        <h3>All Exams</h3>
   <h3>Exams for ${year} - ${semester} Semester</h3>
        <!-- Search Bar -->
        <div class="search-bar">
            <input type="text" id="searchInput" class="form-control" placeholder="Search by Exam ID, Student, or Course Code">
        </div>

        <c:if test="${not empty elist}">
     
        
            <!-- If elist is not empty, display the table -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Exam ID</th>
                        <th>Student</th>
                        <th>CourseCode</th>
                        <th>Faculty</th>
                        <th>File Name</th>
                        <th>Status</th>
                        <th>Grade</th>
                        <th>Year</th>
                        <th>Semester</th>
                        <th>PDF File</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="exam" items="${elist}">
                        <tr>
                            <td>${exam.id}</td>
                            <td>${exam.student.id}</td>
                            <td>${exam.course.coursecode}</td>
                            <td>${exam.faculty.id}</td>
                            <td>${exam.pdfFileName}</td>
                            <td>${exam.status}</td>
                            <td>${exam.grade != null ? exam.grade : 'Not Graded'}</td>
                            <td>${exam.year}</td>
                            <td>${exam.semester}</td>
                            <td>
                               <a href="viewPDF/${exam.id}" target="_blank" class="btn btn-primary btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty elist}">
            <div class="alert alert-info">No exams found.</div>
        </c:if>
    </div>

    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('keyup', function() {
            var searchValue = this.value.toLowerCase();
            var rows = document.querySelectorAll('table tbody tr');

            rows.forEach(function(row) {
                var cells = row.getElementsByTagName('td');
                var match = false;

                // Check if any cell contains the search value
                Array.from(cells).forEach(function(cell) {
                    if (cell.textContent.toLowerCase().indexOf(searchValue) > -1) {
                        match = true;
                    }
                });

                // Show or hide row based on match
                if (match) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>
