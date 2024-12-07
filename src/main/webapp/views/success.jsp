<%@ page import="com.klef.jfsd.springboot.Models.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
Student stu = (Student) session.getAttribute("student");
if (stu == null)
{
    response.sendRedirect("login"); 
    return; 
}
%>
<%@ include file="studentnavbar.jsp" %>
<!DOCTYPE html>
<head>
    <title>Payment Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background: #fff;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .container h1 {
            color: #4CAF50;
            margin-bottom: 10px;
        }
        .container p {
            color: #555;
            margin-bottom: 20px;
        }
        .success-icon {
            font-size: 50px;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-icon">✔</div>
        <h1>Payment Successful</h1>
        <p>Your transaction has been completed successfully.</p>
    </div>
</body>
</html>