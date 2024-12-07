<%@page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Faculty f = (Faculty) session.getAttribute("faculty");
if (f == null) 
{
    response.sendRedirect("facultylogin"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<html>
<head>
    <title>Registered Students for Faculty</title>
    <style>
        /* Container styling */
        .container {
            padding: 16px;
            margin: 0 auto;
            max-width: 1200px;
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Header styling */
        h2 {
            margin-bottom: 20px;
            font-size: 1.5rem;
            font-weight: 600;
            color: #333;
        }

        /* 3D Search Bar Styling */
        #searchBar {
            margin-bottom: 20px;
            padding: 12px;
            width: 50%;
            font-size: 0.875rem;
            border: 1px solid #ddd;
            border-radius: 10px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            background: #f9f9f9;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1), 0px 1px 3px rgba(0, 0, 0, 0.08);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }

        #searchBar:focus {
            outline: none;
            box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.15), 0px 2px 5px rgba(0, 0, 0, 0.1);
            transform: scale(1.02);
        }

        /* Table Styling */
        table {
            width: 60%; /* Reduced table width */
            margin: 0 auto; /* Center the table */
            border-collapse: collapse;
            text-align: left;
            table-layout: fixed;
            max-width: 100%;
            overflow-x: auto;
            background: #fff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        th, td {
            padding: 10px;
            font-size: 1rem;
        }

        th {
            background-color: #f0f0f0;
            color: #333;
            font-weight: 600;
            border-bottom: 2px solid #ddd;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        td {
            color: #555;
            border-bottom: 1px solid #ddd;
        }

        /* 3D Effect on Hover */
        tr:hover {
            background: #f1f1f1;
            transform: scale(1.02);
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        /* Button Styling */
        button {
            padding: 6px 10px;
            background-color: transparent;
            border: 1px solid #ddd;
            border-radius: 50%;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #f0f0f0;
        }

        button:focus {
            outline: none;
            background-color: #e0e0e0;
        }

        /* Text hover effect */
        button svg {
            width: 16px;
            height: 16px;
            fill: #333;
            transition: fill 0.3s ease;
        }

        button:hover svg {
            fill: #007BFF;
        }

        /* Text styling */
        p {
            margin: 0;
            font-size: 0.875rem;
            color: #555;
        }

        .text-2xl {
            font-size: 1.25rem;
            font-weight: 600;
        }

        .font-medium {
            font-weight: 500;
        }

        /* Responsive adjustments */
        @media screen and (max-width: 768px) {
            table {
                font-size: 0.6rem;
                width: 90%; 
                overflow-x: auto;
            }

            td, th {
                padding: 4px;
            }

            #searchBar {
                width: 80%;
            }
        }
    </style>
    <script>
        function searchTable() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchBar");
            filter = input.value.toLowerCase();
            table = document.getElementById("studentTable");
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) { // Start at 1 to skip the table header row
                td = tr[i].getElementsByTagName("td");
                let found = false;

                // Check each column for a match
                for (let j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toLowerCase().indexOf(filter) > -1) {
                            found = true;
                            break;
                        }
                    }
                }

                if (found) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    </script>
</head>
<body>
    <%@ include file="facultynavbar.jsp" %>

    <h1 align="center">Registered Students for ${faculty.firstName} ${faculty.middleName} ${faculty.lastName}</h1>

    <c:if test="${not empty message}">
        <div style="color: red; text-align: center;">${message}</div>
    </c:if>

    <!-- Search bar for filtering students -->
    <input type="text" id="searchBar" onkeyup="searchTable()" placeholder="Search students......">

    <div class="table-container">
        <table id="studentTable">
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${registeredStudents}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.firstName}</td>
                        <td>${student.lastName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
