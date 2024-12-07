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
    <title>Add Timetable</title>
   <style>
        body {
            font-family: Arial, sans-serif;
            background: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 120vh;
            margin: 0;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 550px;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #333;
            text-align: left;
        }

        select, button {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .btn-save {
            background-color: black;
            color: white;
        }

        .btn-save:hover {
            background-color: #364f6b;
        }

        .btn-clear {
            background-color: red;
            color: white;
        }

        .btn-clear:hover {
            background-color: darkred;
        }

        .checkbox-group {
            text-align: left;
            margin-top: 10px;
        }

        .checkbox-group input[type="checkbox"] {
            margin-right: 5px;
        }

        .checkbox-group label {
            display: inline-block;
            margin-right: 15px;
            font-weight: normal;
        }
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
    <div class="form-container">
        <h2>Add Timetable</h2>
        
        <!-- Display success message -->
        <c:if test="${not empty successMessage}">
            <div style="color: green; font-weight: bold; margin-bottom: 15px;">
                ${successMessage}
            </div>
        </c:if>

        <form action="addTimetable" method="post">
            <label for="faculty">Select Faculty:</label>
            <select name="faculty" id="faculty" required>
                <c:forEach var="faculty" items="${faculties}">
                    <option value="${faculty.id}">${faculty.id}- ${faculty.firstName} ${faculty.middleName} ${faculty.lastName}</option>
                </c:forEach>
            </select>

            <label for="course">Select Course:</label>
            <select name="course" id="course" required>
                <c:forEach var="course" items="${courses}">
                    <option value="${course.courseId}">${course.courseId}-${course.coursecode}- ${course.courseName}-${course.section} </option>
                </c:forEach>
            </select>
              <div>
   
            <!-- Year Selection -->
            <label for="year">Select Year:</label>
            <select name="year" id="year" required>
            	<option value="2021-2022">2021-2022</option>
            	<option value="2022-2023">2022-2023</option>
                <option value="2023-2024">2023-2024</option>
                <option value="2024-2025">2024-2025</option>
                <!-- Add more years as needed -->
            </select>

            <!-- Semester Selection -->
            <label for="semester">Select Semester:</label>
            <select name="semester" id="semester" required>
                <option value="odd">Odd</option>
                <option value="even">Even</option>
            </select>

            <label>Select Days of the Week:</label>
            <div class="checkbox-group">
                <label><input type="checkbox" name="daysOfWeek" value="Monday"> Monday</label>
                <label><input type="checkbox" name="daysOfWeek" value="Tuesday"> Tuesday</label>
                <label><input type="checkbox" name="daysOfWeek" value="Wednesday"> Wednesday</label>
                <label><input type="checkbox" name="daysOfWeek" value="Thursday"> Thursday</label>
                <label><input type="checkbox" name="daysOfWeek" value="Friday"> Friday</label>
                <label><input type="checkbox" name="daysOfWeek" value="Saturday"> Saturday</label>
            </div>

            <label>Select Periods:</label>
            <div class="checkbox-group">
                <label><input type="checkbox" name="periods" value="1">  1</label>
                <label><input type="checkbox" name="periods" value="2">  2</label>
                <label><input type="checkbox" name="periods" value="3">  3</label>
                <label><input type="checkbox" name="periods" value="4">  4</label>
                <label><input type="checkbox" name="periods" value="5">  5</label>
                <label><input type="checkbox" name="periods" value="6">  6</label>
                <label><input type="checkbox" name="periods" value="7">  7</label>
                <label><input type="checkbox" name="periods" value="8">  8</label>
                <label><input type="checkbox" name="periods" value="9">  9</label>
                <label><input type="checkbox" name="periods" value="10"> 10</label>
                <label><input type="checkbox" name="periods" value="11"> 11</label>
                <label><input type="checkbox" name="periods" value="12"> 12</label>
                <label><input type="checkbox" name="periods" value="13"> 13</label>
                <label><input type="checkbox" name="periods" value="14"> 14</label>
                <label><input type="checkbox" name="periods" value="15"> 15</label>
            </div>




         <div class="select-container">
           <label for="section">Section</label>
<select id="section" name="section" required>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="11">11</option>
    <option value="12">12</option>
    <option value="13">13</option>
    <option value="14">14</option>
    <option value="15">15</option>
    <option value="21">21</option>
    <option value="22">22</option>
    <option value="23">23</option>
    <option value="24">24</option>
</select>

        </div>






            <div class="btn-group">
                <button type="submit" class="btn-save">Save</button>
                <button type="reset" class="btn-clear">Clear</button>
            </div>
        </form>
    </div>
</body>
</html>
