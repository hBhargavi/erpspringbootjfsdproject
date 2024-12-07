<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Admin adm = (Admin) session.getAttribute("admin");
if (adm == null)
{
	  response.sendRedirect("sessionexpiry"); 
    return; 
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            font-size: 24px;
            color: #333;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 20px;
        }

        .content-container
         {
            width: 80%;
            max-width: 1000px;
        }

        #searchInput {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            font-size: 14px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4a4a4a;
            color: #fff;
            font-weight: bold;
            text-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
        }

        tbody tr:hover {
            background-color: #f1f1f1;
            transform: scale(1.02);
        }

        .table-container {
            display: flex;
            justify-content: center;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#searchInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("table tbody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                });
            });
        });
    </script>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>
    <div class="content-container">
        <h2>View All Payments</h2>
        <input type="text" id="searchInput" placeholder="Search...">
        
        <div class="table-container">
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
                        <th>Semester</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${ordersList}">
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
        </div>
    </div>
</body>
</html>
