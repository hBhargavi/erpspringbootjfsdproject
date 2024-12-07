<%@ page import="com.klef.jfsd.springboot.Models.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Student stu = (Student) session.getAttribute("student");
if (stu == null) {
    response.sendRedirect("sessionexpiry");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Course Registration</title>
    <style>
        /* Page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        /* Form container styling */
        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border: 1px solid #aaa;
            border-radius: 6px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Header styling */
        h1 {
            color: #333;
            font-size: 20px;
            text-align: center;
            margin-bottom: 15px;
        }

        /* Styling for course selection groups in a row */
        .course-selection-group {
            display: flex;
            gap: 15px;
            margin-bottom: 10px;
        }

        /* Label and input styling */
        label {
            font-weight: normal;
            color: #555;
            font-size: 14px;
            display: block;
            margin-bottom: 5px;
        }

        select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: rgba(255, 255, 255, 0.9);
            color: #333;
            font-size: 14px;
            width: 100%;
        }

        /* Buttons styling */
        .buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
        }

        button {
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            color: white;
            background-color: black;
            font-size: 14px;
        }

        /* Styling each select container */
        .select-container {
            flex: 1; /* Ensures each dropdown takes up equal space */
        }
    </style>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %>



<div class="message">
        <c:out value="${error}" />
    </div>
   <form action="register/${studentId}" method="POST">
    <h1>Register for Courses</h1>

    <div class="course-selection-group">
        <div class="select-container">
            <label for="faculty">Faculty</label>
            <select name="faculty" id="faculty" required>
                <option value="" disabled selected>Select a faculty...</option>
                <c:forEach var="faculty" items="${faculties}">
                    <option value="${faculty.id}">${faculty.id} - ${faculty.firstName} ${faculty.middleName} ${faculty.lastName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="select-container">
            <label for="semester">Semester</label>
            <select name="semester" id="semester" required>
                <option value="" disabled selected>Select a semester...</option>
                <option value="Odd">Odd</option>
                <option value="Even">Even</option>
            </select>
        </div>

        <div class="select-container">
            <label for="academicYear">Academic Year</label>
            <select name="year" id="academicYear" required>
                <option value="" disabled selected>Select a year...</option>
                <option value="2021-2022">2021-2022</option>
                <option value="2022-2023">2022-2023</option>
                <option value="2023-2024">2023-2024</option>
            </select>
        </div>

        <div class="select-container">
            <label for="courseId">Course</label>
            <select name="courseIdList" id="courseId" required>
                <option value="" disabled selected>Select a course...</option>
                <c:forEach var="course" items="${allCourses}">
                    <option value="${course.courseId}">${course.coursecode} - ${course.courseName} -${course.section} </option>
                </c:forEach>
            </select>
        </div>

        <div class="select-container">
            <label for="section">Section</label>
            <select id="section" name="section" required>
                <option value="" disabled selected>Select a section...</option>
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
                <option value="25">25</option>
                
            </select>
        </div>
    </div>

    <div class="buttons">
        <button type="submit">Submit</button>
        <button type="reset">Reset</button>
    </div>
</form>

</body>
</html>
