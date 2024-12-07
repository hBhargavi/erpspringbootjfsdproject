<%@ page import="com.klef.jfsd.springboot.Models.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Student stu = (Student) session.getAttribute("student");
if (stu == null) {
    response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<html>
<head>
    <title>Select Year and Semester</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f5f5f5;
        }
        form {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
            align-items: center; /* Aligns buttons vertically */
            margin-top: 15px;
        }
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            color: white;
            background-color: black;
            width: 24%; /* Ensures both buttons are the same width */
        }
    </style>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %>
    <form action="/studentexams" method="get">
        <label for="year">Select Year</label>
        <select id="year" name="year">
            <option value="">--SELECT--</option>
            <option value="2021-2022">2021-2022</option>
            <option value="2022-2023">2022-2023</option>
            <option value="2023-2024">2023-2024</option>
        </select>

        <label for="semester">Select Semester:</label>
        <select name="semester" id="semester" required>
            <option value="">--SELECT--</option>
            <option value="odd">Odd</option>
            <option value="even">Even</option>
        </select>

        <div class="buttons">
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </div>
    </form>
</body>
</html>
