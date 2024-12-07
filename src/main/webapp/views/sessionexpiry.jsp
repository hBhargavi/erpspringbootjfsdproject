<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Expired</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: grey; /* Dark gray background */
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #f1f1f1; /* Light text color */
        }
        .session-expired-container {
            text-align: center;
            background-color: white; /* Black background for the container */
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.5); /* Stronger shadow for 3D effect */
            max-width: 400px;
            width: 100%;
            color: #f1f1f1;
        }
        .session-expired-container h1 {
            font-size: 2em;
            color: #e63946; /* Red color for the title */
            margin-bottom: 20px;
        }
        .session-expired-container p {
            color: #bbbbbb; /* Light gray for the text */
            font-size: 1.1em;
            margin-bottom: 30px;
        }
        .session-expired-container .btn {
            font-size: 1em;
            padding: 10px 20px;
            background-color: #444; /* Dark gray for button */
            color: #f1f1f1;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3); /* 3D button shadow */
        }
        .session-expired-container .btn:hover {
            background-color: white; /* Lighter gray on hover */
        }
    </style>
</head>
<body>

<div class="session-expired-container">
    <h1>Session Expired</h1>
    <p>Your session has expired due to inactivity. Please log in again to continue.</p>
    <a href="login" class="btn">Go to Login</a>
</div>

</body>
</html>
