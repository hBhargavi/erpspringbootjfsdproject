<%@page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Faculty f = (Faculty) session.getAttribute("faculty");
if (f == null) 
{
    response.sendRedirect("facultylogin"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Faculty Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: white; /* Soft gray background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Modern, clean font */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 80%;
            max-width: 1200px;
            margin: auto;
            text-align: center;
        }

        h1 {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 40px; /* Reduced margin for a more compact design */
            letter-spacing: 1px;
        }

        .dashboard-cards {
            display: flex;
            justify-content: center; /* Centered the cards */
            gap: 10px; /* Reduced gap between cards */
        }

        .card {
            background-color: white;
            padding: 20px; /* Reduced padding for a tighter layout */
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1); /* More defined shadow for depth */
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 250px; /* Slightly reduced card width */
        }

        .card:hover {
            transform: translateY(-10px); /* Subtle lift on hover */
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15); /* Stronger shadow on hover */
        }

        .card h3 {
            font-size: 1.5rem;
            color: #007bff; /* Primary color */
            margin-bottom: 15px; /* Reduced bottom margin */
        }

        .card p {
            font-size: 2rem;
            font-weight: bold;
            color: #495057; /* Dark color for the count */
            margin: 0;
        }

        /* Animation for count numbers */
        .card p {
            animation: fadeInUp 0.5s ease-in-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .navbar {
            width: 100%;
            background-color: #007bff;
            padding: 15px 0;
            color: white;
            text-align: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 1.2rem;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

<%@ include file="facultynavbar.jsp" %>

<div class="container">
    <h1>Welcome <%= f.getId() %></h1>


</body>
</html>
