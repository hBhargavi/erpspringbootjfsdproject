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
<html>
<head>
    <title>Add Feedback Questions</title>
    <style>
        /* Reset some default browser styles */
        body, h1, form {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
        }

        /* Page background and overall layout */
        body {
            background-color: #f4f7fc;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 110vh;
            font-size: 14px; /* Smaller font size for compactness */
        }

        h1 {
            font-size: 24px; /* Smaller heading */
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Container for the form */
        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 25%; /* Reduced width */
            max-width: 500px; /* Max width limit */
            margin: 20px;
        }

        /* Success message */
        p {
            font-size: 14px; /* Smaller font for success message */
            color: green;
            text-align: center;
            margin-top: 10px;
        }

        /* Form elements */
        label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 6px;
        }

        select, input[type="text"] {
            width: 100%;
            padding: 8px;
            font-size: 14px; /* Smaller font for input */
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px; /* Reduced margin */
            box-sizing: border-box;
        }

        /* Hover effect on input */
        input[type="text"]:hover, select:hover {
            border-color: #4CAF50;
        }

        /* Submit button styling */
        button[type="submit"] {
            background-color: black;
            color: white;
            font-size: 16px; /* Smaller font for the button */
            padding: 10px 20px; /* Smaller padding */
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Style for the navbar */
        .navbar {
            width: 100%;
            background-color: #333;
            color: white;
            padding: 10px 0; /* Smaller navbar */
            text-align: center;
        }

        .navbar a {
            color: white;
            padding: 10px 16px; /* Smaller navbar links */
            text-decoration: none;
            display: inline-block;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>
    

    <!-- Display any success message -->
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>

    <!-- Feedback form -->
    <h1>Add Feedback Questions</h1>
    <form method="post" action="/addfeedbackform">
        <div>
            <label for="year">Select Year:</label>
            <select name="year" required>
                <option value="">Select Year</option>
                <option>2021-2022</option>
                <option>2022-2023</option>
                <option>2023-2024</option>
            </select>
        </div>

        <div>
            <label for="semester">Select Semester:</label>
            <select name="semester" required>
                <option value="">Select Semester</option>
                <option>odd</option>
                <option>even</option>
            </select>
        </div>

        <!-- Question fields -->
        <div>
            <label for="question1">Question 1:</label>
            <input type="text" id="question1" name="question1" placeholder="Enter Question 1" required />
        </div>

        <div>
            <label for="question2">Question 2:</label>
            <input type="text" id="question2" name="question2" placeholder="Enter Question 2" required />
        </div>

        <div>
            <label for="question3">Question 3:</label>
            <input type="text" id="question3" name="question3" placeholder="Enter Question 3" required />
        </div>

        <div>
            <label for="question4">Question 4:</label>
            <input type="text" id="question4" name="question4" placeholder="Enter Question 4" required />
        </div>

        <div>
            <label for="question5">Question 5:</label>
            <input type="text" id="question5" name="question5" placeholder="Enter Question 5" required />
        </div>

        <div>
            <button type="submit">Add Feedback</button>
        </div>
    </form>
</body>
</html>
