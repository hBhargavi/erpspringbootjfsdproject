<%@page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@page import="com.klef.jfsd.springboot.Models.Leave"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    Faculty f = (Faculty) session.getAttribute("faculty");
    if (f == null) {
        response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
        return; // Prevent further processing
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>&nbsp;&nbsp;&nbsp;&nbsp;View All Students</title>
    <style>
        /* Table Styling */
        table {
            width: 65%;
            margin: 20px auto;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }

        table th, table td {
            border: 1px solid #ddd;
            text-align: left;
            padding: 8px;
        }

        table th {
            background-color: #f2f2f2;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        /* Styling for the filter container */
        .filter-container {
            display: flex;
            justify-content: flex-end;
            margin-right: 10%;
            margin-top: 20px;
        }

        .filter-container select {
            padding: 5px;
            margin-left: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }

        .filter-container label {
            font-size: 0.9em;
            font-weight: bold;
        }

        /* Search input styling */
        #searchInput {
            display: block;
            margin: 20px auto;
            width: 60%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Search filter
            $("#searchInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("table tbody tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });

            // Dropdown filter
            $("#subjectFilter, #sectionFilter").on("change", function () {
                var selectedSubject = $("#subjectFilter").val();
                var selectedSection = $("#sectionFilter").val();

                $("table tbody tr").filter(function () {
                    var matchesSubject =
                        selectedSubject === "" ||
                        $(this).find("td:nth-child(2)").text() === selectedSubject;
                    var matchesSection =
                        selectedSection === "" ||
                        $(this).find("td:nth-child(3)").text() === selectedSection;

                    $(this).toggle(matchesSubject && matchesSection);
                });
            });
        });
    </script>
</head>
<body>
<%@ include file="facultynavbar.jsp" %>

<!-- Search input -->
<input type="text" id="searchInput" placeholder="Search for Students...">

<!-- Filter dropdowns -->
<div class="filter-container">
    <label for="subjectFilter">Filter by Subject:</label>
    <select id="subjectFilter">
        <option value="">All Subjects</option>
        <c:set var="uniqueSubjects" value="${fn:split('', '')}" />
        <c:forEach var="course" items="${feedbackResponses}">
            <c:if test="${not fn:contains(uniqueSubjects, course.course.courseName)}">
                <option value="${course.course.courseName}">${course.course.courseName}</option>
                <c:set var="uniqueSubjects" value="${uniqueSubjects},${course.course.courseName}" />
            </c:if>
        </c:forEach>
    </select>

    <label for="sectionFilter">Filter by Section:</label>
    <select id="sectionFilter">
        <option value="">All Sections</option>
        <c:set var="uniqueSections" value="${fn:split('', '')}" />
        <c:forEach var="course" items="${feedbackResponses}">
            <c:if test="${not fn:contains(uniqueSections, course.course.section)}">
                <option value="${course.course.section}">${course.course.section}</option>
                <c:set var="uniqueSections" value="${uniqueSections},${course.course.section}" />
            </c:if>
        </c:forEach>
    </select>
</div>

<!-- Feedback Table -->
<c:if test="${not empty feedbackResponses}">
    <div class="table-container">
        <!-- Count of Students -->
        <h3 style="text-align: center;">Total Students Who Submitted Feedback: ${feedbackResponses.size()}</h3>
        
        <!-- Feedback Table -->
        <table border="2" align="center">
            <thead>
                <tr>

                    <th>Course Code</th>
                    <th>Course Name</th>
                    <th>Section</th>
                    <th>Response 1</th>
                    <th>Response 2</th>
                    <th>Response 3</th>
                    <th>Response 4</th>
                    <th>Response 5</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="response" items="${feedbackResponses}">
                    <tr>
                    	
                        <td>${response.course.coursecode}</td>
                        <td>${response.course.courseName}</td>
                        <td>${response.course.section}</td>
                        <td>${response.response1}</td>
                        <td>${response.response2}</td>
                        <td>${response.response3}</td>
                        <td>${response.response4}</td>
                        <td>${response.response5}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>
</body>
</html>
