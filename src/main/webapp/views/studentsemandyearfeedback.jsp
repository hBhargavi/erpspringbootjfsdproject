
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Select Year and Semester</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f5f5f5; /* Light background for contrast */
        }
        form {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 400px; /* Set a maximum width */
            margin: auto; /* Center the form */
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        select {
            width: 100%; /* Full width */
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
            color: white; /* Text color for buttons */
        }
        button[type="submit"],
        button[type="reset"] {
            background-color: black; /* Black background for both buttons */
        }
    </style>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %>
   <div class="message">
    <c:if test="${not empty error}">
        <p style="color: red;" align="center">${error}</p>
    </c:if>
</div>

    
<form action="studentshowfeedbackform" method="get">
 <div style="text-align: center;">
        <label style="font-weight: bold; font-size: 18px;">Feedback</label>
    </div>
    <label for="year">Academic Year:</label>
    <select id="year" name="year" required>
        <option value="">--SELECT--</option>
        <option value="2021-2022">2021-2022</option>
        <option value="2022-2023">2022-2023</option>
        <option value="2023-2024">2023-2024</option>
    </select>

    <label for="semester">Semester:</label>
    <select id="semester" name="semester" required>
        <option value="">--SELECT--</option>
        <option value="odd">Odd</option>
        <option value="even">Even</option>
    </select>

    <button type="submit">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button type="reset">Reset</button>
</form>
</body>
