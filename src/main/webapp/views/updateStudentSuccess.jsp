<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Success</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Use a clean font */
            background-color: #000; /* Black background */
            color: #fff; /* White text color */
            display: flex; /* Center content */
            flex-direction: column;
            justify-content: center; /* Center vertically */
            align-items: center; /* Center horizontally */
            height: 100vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
        }

        h1 {
            text-align: center; /* Center the heading */
            margin-bottom: 20px; /* Space below heading */
        }

        a {
            color: #fff; /* White link color */
            text-decoration: underline; /* Underline links */
            font-size: 16px; /* Font size for the link */
        }

        a:hover {
            color: #ccc; /* Light gray on hover */
        }
    </style>
</head>
<body>
    <h1>Update Successful</h1>
    <p><c:out value="${message}"/></p>
    <br>
    <a href="updatestudetails">Back</a>
</body>
</html>
