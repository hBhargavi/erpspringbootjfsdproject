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
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Clean font */
            display: flex;
            flex-direction: column; /* Stack elements vertically */
            align-items: center;
            min-height: 100vh; /* Full height */
        }

        .container {
            width: 80%;
            max-width: 1200px;
            text-align: center;
            padding: 20px;
        }

        h1 {
            font-size: 2.5rem;
            color: #333; /* Dark color for the heading */
            margin: 20px 0; /* Margins for spacing */
            letter-spacing: 1px;
        }

        .dashboard-cards {
            display: flex;
            justify-content: space-around; /* Space cards evenly */
            flex-wrap: wrap; /* Allow cards to wrap */
            gap: 20px; /* Add gap between cards */
        }

        .card {
            background-color: #fff; /* White background for cards */
            color: #333; /* Dark text for readability */
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 280px; /* Card width */
            position: relative; /* For pseudo-elements */
        }

        .card:hover {
            transform: translateY(-5px); /* Subtle lift on hover */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); /* Stronger shadow on hover */
        }

        .card h3 {
            font-size: 1.5rem;
            margin-bottom: 10px; /* Bottom margin */
        }

        .card p {
            font-size: 2rem;
            font-weight: bold;
            margin: 0; /* No margin for counts */
        }

        .navbar {
            width: 100%;
            background-color: #333; /* Dark background for navbar */
            padding: 15px 0;
            color: white;
            text-align: center;
        }

        .navbar a {
            color: white; /* White text for links */
            text-decoration: none;
            margin: 0 15px;
            font-size: 1.2rem;
        }

        .navbar a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>

<%@ include file="adminnavbar.jsp" %>

<div class="container">
    <h1>Welcome <%= adm.getUsername() %>!</h1>

    <div class="dashboard-cards">
        <div class="card">
            <h3>Total Faculties</h3>
            <p><c:out value="${count}"></c:out></p>
        </div>

        <div class="card">
            <h3>Total Students</h3>
            <p><c:out value="${stucount}"></c:out></p>
        </div>
    </div>
</div>

</body>
</html>
