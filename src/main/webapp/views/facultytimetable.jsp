<%@page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@page import="com.klef.jfsd.springboot.Models.Leave"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    Faculty f = (Faculty) session.getAttribute("faculty");
    if (f == null) {
        response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
        return; // Prevent further processing
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Faculty Timetable</title>
   <style>
   table {
        width: 50%; /* Reduce the width of the table */
        height: auto; /* Ensure height adapts to content */
        border-collapse: separate; /* Enables border-spacing */
        border-spacing: 0 8px; /* Adds smaller space between rows */
        margin: 20px auto; /* Center the table vertically */
        margin-left: auto; /* Align table correctly */
        margin-right: 10%; /* Adjust margin to fit within the dashboard */
        background-color: #ffffff; /* Pure white background for the table */
        border: 1px solid grey; /* Thicker border for table */
        box-shadow: 4px 4px 10px rgba(255, 255, 255, 0.5); /* Light white shadow with transparency */

        border-radius: 10px; /* Rounded corners */
        overflow: hidden;
        transition: transform 0.2s ease, box-shadow 0.2s ease; /* Smooth hover effect */
    }

    table:hover {
        transform: translateY(-3px); /* Slightly raise the table on hover */
        box-shadow: 6px 6px 15px rgba(0, 0, 0, 0.3); /* Darker shadow on hover */
    }

    th, td {
        padding: 15px 20px; /* Decrease padding for cells */
        border: 1px solid #ddd; /* Define border for cells */
        text-align: center;
        font-size: 13px; /* Reduce font size for compact appearance */
        font-family: Arial, sans-serif; /* Clean font */
    }

    th {
        background-color: #f8f8f8; /* Light gray for table headers */
        font-weight: bold;
        text-transform: uppercase; /* Uppercase for header text */
        letter-spacing: 1px; /* Add spacing to header text */
        color: #333;
    }

    td {
        height: 35px; /* Reduce cell height */
        color: #555; /* Softer text color for table data */
        transition: background-color 0.2s ease; /* Smooth transition for hover effect */
    }

    td:hover {
        background-color: #f0f0f0; /* Light background on cell hover */
    }

    td, th {
        width: auto; /* Ensure dynamic width based on content */
    }

    h2 {
        text-align: center;
        font-size: 20px; /* Slightly smaller title */
        margin: 15px 0;
        color: #333;
        font-family: 'Georgia', serif; /* Elegant font for the title */
        letter-spacing: 1px; /* Add spacing for a polished look */
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1); /* Subtle text shadow */
    }

    /* Add a smooth transition for all elements */
    * {
        transition: all 0.3s ease;
    }
</style>
</head>
<body>
<%@ include file="facultynavbar.jsp" %>

<h2 align="center">Timetable </h2>

<!-- Check if the timetable list is empty -->
<c:if test="${empty timetableList}">
    <p align="center">No timetable found for the selected year and semester.</p>
</c:if>

<!-- Only show the timetable if there are entries -->
<c:if test="${not empty timetableList}">
    <table align="center">
        <!-- Table header with periods -->
        <thead>
            <tr>
                <th>Day/Period</th>
                <c:forEach var="i" begin="1" end="15">
                    <th>${i}</th>
                </c:forEach>
            </tr>
        </thead>
        
        <tbody>
            <c:forEach var="day" items="${['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']}">
                <tr>
                    <td><strong>${day}</strong></td>
                    <c:forEach var="period" begin="1" end="15">
                        <td>
                            <!-- Reset found flag for each period -->
                            <c:set var="found" value="false" scope="page" />
                            <c:forEach var="timetable" items="${timetableList}">
                                <c:if test="${timetable.dayOfWeek == day && timetable.period == period && !found}">
                                    <!-- Display the timetable entry -->
                                    ${timetable.course.coursecode}<br>
                                    -${timetable.course.section}

                                    <!-- Set flag to true so this period won't repeat -->
                                    <c:set var="found" value="true" scope="page" />
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

</body>
</html>
