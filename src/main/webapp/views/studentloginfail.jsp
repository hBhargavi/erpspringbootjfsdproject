<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Failed</title>
    <style>
        body {
            background-color: black; /* Set background color to black */
            color: white; /* Set text color to white for better contrast */
            font-family: Arial, sans-serif; /* Set a font for readability */
            display: flex; /* Use flexbox for centering */
            flex-direction: column; /* Stack items vertically */
            justify-content: center; /* Center vertically */
            align-items: center; /* Center horizontally */
            height: 100vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
            text-align: center; /* Center the text */
        }

        a {
            color: #66afe9; /* Set link color to a bright blue */
            text-decoration: none; /* Remove underline */
            font-weight: bold; /* Make link text bold */
            margin-top: 15px; /* Add space between heading and link */
        }

        a:hover {
            text-decoration: underline; /* Underline on hover for better UX */
        }
    </style>
</head>
<body>
    <h2>Login Failed</h2>
    <a href="login">Try Again</a>
</body>
</html>
