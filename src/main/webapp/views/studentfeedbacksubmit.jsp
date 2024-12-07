<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="studentnavbar.jsp" %>
<html>
<head>
    <title>Submit Feedback</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 700px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            font-size: 14px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f8f9fa;
            color: #333;
            font-weight: bold;
        }
        td {
            background-color: #fff;
        }
        tr:nth-child(even) td {
            background-color: #f9f9f9;
        }
        label {
            display: block;
            font-weight: bold;
            margin: 8px 0 4px;
        }
        input[type="text"] {
            width: 100%;
            padding: 6px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 13px;
        }
        button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #555;
        }
        .popup {
            position: fixed;
            top: 20px;
            right: -350px; /* Start off-screen */
            background-color: #e8f5e9;
            color: #4caf50;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #4caf50;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            font-weight: bold;
            font-size: 14px;
            animation: slideIn 0.5s forwards, flash 2s infinite;
        }
        @keyframes slideIn {
            to {
                right: 20px; /* Bring it into view */
            }
        }
        @keyframes flash {
            0%, 100% {
                opacity: 1;
            }
            50% {
                opacity: 0.5;
            }
        }
    </style>
    
</head>
<body onload="hidePopup()">
    <div class="container">
              <c:if test="${empty message}">
            <h2>Submit Feedback</h2>
            <form action="/submitfeedback" method="post">
                <input type="hidden" name="studentId" value="${studentId}">
                <input type="hidden" name="feedbackId" value="${feedback.id}">

                <table>
                    <thead>
                        <tr>
                            <th>Course</th>
                            <th>Faculty</th>
                            <th>Feedback Questions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${registeredCourses}">
                            <tr>
                                <td>
                                    ${course.courseName}
                                    <input type="hidden" name="courseId" value="${course.courseId}">
                                </td>
                                <td>
                                    ${course.faculty.firstName} ${course.faculty.lastName}
                                </td>
                                <td>
                                    <label>${feedback.question1}</label>
                                    <input type="text" name="response1" required>
                                    <label>${feedback.question2}</label>
                                    <input type="text" name="response2" required>
                                    <label>${feedback.question3}</label>
                                    <input type="text" name="response3" required>
                                    <label>${feedback.question4}</label>
                                    <input type="text" name="response4" required>
                                    <label>${feedback.question5}</label>
                                    <input type="text" name="response5" required>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <button type="submit">Submit Feedback</button>
            </form>
        </c:if>
    </div>
</body>
</html>
