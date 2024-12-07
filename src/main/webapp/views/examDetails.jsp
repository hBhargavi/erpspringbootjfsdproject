<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Exam Details</title>
    <style>
        /* General Styling */
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: white;
            color: #333;
        }

        /* Container Styling */
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            max-width: 450px;
            width: 90%;
            text-align: left;
        }

        /* Typography */
        h2 {
            color: #2c3e50;
            font-size: 1.8em;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        p {
            font-size: 1em;
            margin: 12px 0;
            line-height: 1.6;
        }

        a {
            color: #3498db;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Label and Input Styling */
        label {
            display: block;
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus {
            border-color: #3498db;
            outline: none;
        }

        /* Button Styling */
        button {
            width: 100%;
            background-color: #2c3e50;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            margin-top: 15px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #34495e;
        }

        /* Mobile Responsiveness */
        @media (max-width: 500px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 1.5em;
            }

            button {
                padding: 10px;
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>
<%@ include file="facultynavbar.jsp" %>
<div class="container">
    <h2>Exam Details</h2>
    
    <p><strong>Course:</strong> ${exam.course.courseName}</p>
    <p><strong>Student ID:</strong> ${exam.student.id}</p>
    
    <p><strong>Status:</strong> ${exam.status}</p>
       <p><strong><a href="${pageContext.request.contextPath}viewPDF/${exam.id}">View PDF</a></strong></p>


 <form action="${pageContext.request.contextPath}/grade" method="post">
    <input type="hidden" name="examId" value="${exam.id}">
    <label for="grade">Grade:</label>
    <input type="text" id="grade" name="grade" required>
    <button type="submit">Submit Grade</button>
</form>

        
</div>
</body>
</html>
</body>
</html>
