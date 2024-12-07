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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            flex-direction: column;
        }
        h2 {
            font-size: 24px;
            color: #333;
            text-align: center;
        }
        table {
            width: 60%;
            border-collapse: collapse;
            background-color: #fff;
            border: 1px solid #333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        th, td {
            padding: 10px;
            font-size: 14px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4a4a4a;
            color: #fff;
        }
        tbody tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<h2>Your Payment History</h2>
<%@ include file="studentnavbar.jsp" %>
<table>
    <thead>
        <tr>
            <th>Order ID</th>
                <th>Student ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Year</th>
                <th>Sem</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="order" items="${studentOrders}">
            <tr>
                <td>${order.orderId}</td>
                    <td>${order.studentId}</td>
                    <td>${order.name}</td>
                    <td>${order.email}</td>
                    <td>${order.amount}</td>
                    <td>${order.orderStatus}</td>
                    <td>${order.year}</td>
                    <td>${order.semester}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
