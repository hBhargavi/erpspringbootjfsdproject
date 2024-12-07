<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        }
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            color: white;
        }
        button[type="submit"],
        button[type="reset"] {
            background-color: black;
        }
    </style>
</head>
<body>
    <%@ include file="facultynavbar.jsp" %>
    <h2 align="center">Select Academic Year and Semester</h2>
    <form action="${pageContext.request.contextPath}/selectCoursetoviewstudents" method="post">
        <label for="cyear">Select Academic Year:</label>
        <select id="cyear" name="year" required>
            <option value="">--SELECT--</option>
            <option value="2021-2022">2021-2022</option>
            <option value="2022-2023">2022-2023</option>
            <option value="2023-2024">2023-2024</option>
        </select>

        <label for="csem">Select Semester:</label>
        <select id="csem" name="semester" required>
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
