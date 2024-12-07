<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Admin adm = (Admin) session.getAttribute("admin");
if (adm == null) {
	  response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
  return; // Prevent further processing
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Home</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .card {
            background-color: #d3d3d3; /* Light grey cement color */
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 400px; /* Increased width */
            padding: 40px; /* Increased padding */
            position: relative;
            text-align: center;
            transition: transform 0.3s; /* Add transition effect */
            opacity: 0; /* Initially hidden */
            animation: fadeIn 0.5s forwards; /* Apply fade-in animation */
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            from {
                opacity: 0; /* Start fully transparent */
                transform: translateY(20px); /* Move down slightly */
            }
            to {
                opacity: 1; /* End fully opaque */
                transform: translateY(0); /* Move back to original position */
            }
        }

        .card:hover {
            transform: scale(1.05); /* Slightly enlarge card on hover */
        }

        .profile-image {
            width: 120px; /* Increased image width */
            height: 120px; /* Increased image height */
            border-radius: 50%;
            background-image: url('https://www.shutterstock.com/image-vector/man-working-laptop-computer-desk-600nw-1967455246.jpg'); /* Use a valid image URL */
            background-size: cover; /* Ensure the image covers the div */
            background-position: center; /* Center the image */
            margin: -80px auto 20px; /* Adjusted margin for better fit */
            border: 5px solid white;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Add shadow to the image */
        }

        .card h3 {
            font-size: 26px; /* Increased font size */
            margin: 15px 0; /* Adjusted margin */
            color: #333;
        }

        .profile-info {
            font-size: 20px; /* Set font size */
            color: #555; /* Text color */
            margin-bottom: 20px; /* Increased margin for spacing */
            padding: 0; /* Remove padding to eliminate rectangular effect */
            background-color: transparent; /* Set background to transparent */
        }

        .profile-info span {
            display: block; /* Ensures it occupies the full width */
            font-weight: bold; /* Bold text for emphasis */
            color: #333; /* Darker text color for better visibility */
        }

        .card-content {
            margin-top: 40px; /* Adjusted margin */
        }
    </style>
</head>
<body>
    <%@ include file="adminnavbar.jsp" %>

    <div class="card">
        <div class="profile-image"></div> <!-- Profile image will be shown here -->
        <div class="card-content">
            <h3>My Profile</h3>
            <div class="profile-info">
                <span>Name: <%= adm.getUsername() %></span>
            </div>
        </div>
    </div>
</body>
</html>
