<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Take Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 60%;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: white;
        }
        .checkbox-label {
            display: inline-block;
            padding: 10px;
            margin: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, border-color 0.3s ease;
            background-color: white;
        }
        input[type="radio"] {
            margin-right: 5px;
        }
        button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #555;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .message {
            color: red;
            text-align: center;
            margin: 10px 0;
        }
        .attendance-checkbox {
            display: inline-block;
            margin: 5px;
        }
    </style>
</head>
<body>

<%@ include file="facultynavbar.jsp" %>

<h2>Take Attendance for Year: ${year} - Semester: ${semester}</h2>

<c:if test="${not empty message}">
    <div class="message">${message}</div>
</c:if>

<form action="${pageContext.request.contextPath}/submitAttendance" method="post">
    <input type="hidden" name="year" value="${year}" />
    <input type="hidden" name="semester" value="${semester}" />
    <input type="hidden" name="courseId" value="${course.courseId}" />

    <!-- Debugging output to check if courseId is available -->
    <c:out value="${course.courseId}" default="No course ID available" />

    <table>
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Present</th>
                <th>Absent</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty students}">
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.firstName} ${student.lastName}</td>
                        <td>
                            <!-- Present radio button -->
                            <input type="radio" id="present-${student.id}" name="attendance-${student.id}" value="Present" class="attendance-checkbox" />
                        </td>
                        <td>
                            <!-- Absent radio button -->
                            <input type="radio" id="absent-${student.id}" name="attendance-${student.id}" value="Absent" class="attendance-checkbox" />
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty students}">
                <tr>
                    <td colspan="4" style="text-align: center;">No students available for marking attendance.</td>
                </tr>
            </c:if>
        </tbody>
    </table>

    <button type="submit">Submit Attendance</button>
</form>

</body>
</html>
