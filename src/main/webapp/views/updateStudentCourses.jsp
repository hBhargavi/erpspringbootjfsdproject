<%@ page import="com.klef.jfsd.springboot.Models.Course"%>
<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@ page import="com.klef.jfsd.springboot.Models.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
Student student = (Student) request.getAttribute("student");
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
    <title>Update Student Courses</title>
    <style>
        /* Add your custom styles here */
        body { font-family: Arial, sans-serif; }
        form { background-color: #f9f9f9; padding: 20px; border-radius: 5px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        select, input { width: 100%; padding: 8px; }
        button { padding: 10px 15px; background-color: black; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
<h1>Update Courses for Student: ${student.firstName} ${student.lastName}</h1>

<form action="saveUpdatedCourses" method="POST">
    <input type="hidden" name="studentId" value="${student.id}" />

    <c:forEach items="${registeredCourses}" var="course" varStatus="status">
        <div class="form-group">
            <label>Course</label>
            <select name="courseIdList" required>
                <option value="${course.id}" selected>${course.courseName}</option>
                <!-- No dynamic courses, admin selects statically here -->
                <option value="course1">Course 1</option>
                <option value="course2">Course 2</option>
                <option value="course3">Course 3</option>
                <!-- Add more courses as needed -->
            </select>
        </div>

        <div class="form-group">
            <label>Faculty</label>
            <select name="facultyIdList" required>
                <c:forEach items="${faculties}" var="faculty">
                    <option value="${faculty.id}" ${faculty.id == course.facultyId ? 'selected' : ''}>
                        ${faculty.firstName} ${faculty.lastName}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Semester</label>
            <select name="semesterList" required>
                <option value="Odd">Odd</option>
                <option value="Even">Even</option>
            </select>
        </div>

        <div class="form-group">
            <label>Academic Year</label>
            <select name="academicYearList" required>
                <!-- Predefined static years -->
                <option value="2021-2022">2021-2022</option>
                <option value="2022-2023">2022-2023</option>
                <option value="2023-2024">2023-2024</option>
            </select>
        </div>

        <hr />
    </c:forEach>

    <button type="submit">Update Courses</button>
</form>

</body>
</html>
