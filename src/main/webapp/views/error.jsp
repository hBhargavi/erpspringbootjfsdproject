<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('https://colorlib.com/wp/wp-content/uploads/sites/2/404-error-template-18.png') no-repeat center center fixed;
            background-size: cover;
            color: white;
            text-align: center;
        }
        h1 {
            margin-top: 50px;
            font-size: 3em;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        }
        p {
            font-size: 1.5em;
            margin: 20px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }
        a {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            font-size: 1.2em;
            color: white;
            background: rgba(0, 0, 0, 0.7);
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }
        a:hover {
            background: rgba(255, 255, 255, 0.7);
            color: black;
        }
    </style>
</head>
<body>
    <h1>Error Page</h1>
    <p>${message}</p>
    <a href="login">Go to Login</a>
</body>
</html>
