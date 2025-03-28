<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
   @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Quicksand:wght@400;600&display=swap');
 body {
            margin: 0;
            padding: 0;
            background-color: black;
            font-family: 'Poppins', sans-serif;
            scroll-behavior: smooth;
            color: white;
        }

        .navbar {
            display: flex;
            align-items: center;
            padding: 15px 30px;
            position: fixed;
            top: 0;
            width: 100%;
            background-color: black;
            z-index: 1000;
        }

       .navbar .logo {
            display: flex;
            align-items: center;
            margin-right: auto;
             margin-right: 10px;
        }

        .navbar .logo img {
            height: 50px;
            margin-right: 10px;
        }

        .navbar .logo span 
        {
            font-size: 26px;
               font-family: 'Quicksand', sans-serif;
            font-weight: bold;
            color: white;
        }

        .navbar-links {
            display: flex;
            gap: 25px;
            justify-content: center;
            flex: 1;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-family: 'Quicksand', sans-serif;
            font-size: 18px;
            margin: 0 10px;
            position: relative;
            transition: color 0.3s ease;
        }

        .navbar a::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 0%;
            height: 2px;
            background-color: #7f00ff;
            transition: width 0.3s ease;
        }

        .navbar a:hover {
            color:#7f00ff;
        }

        .navbar a:hover::after {
            width: 100%;
        }

        h1 {
            font-size: 2rem;
            text-align: center;
            color: black;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px);
        }

        .login-container {
            position: relative;
            width: 22.2rem;
        }

        .form-container {
            border: 1px solid hsla(0, 0%, 65%, 0.158);
            box-shadow: 0 0 36px 1px rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            backdrop-filter: blur(20px);
            z-index: 99;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.9);
        }

       .login-container form input {
    display: block;
    padding: 10px; /* Reduced padding */
    width: 100%;
    margin: 1.5rem 0; /* Slightly reduced margin */
    color: #000000;
    outline: none;
    background-color: rgba(255, 255, 255, 0.8);
    border: 1px solid rgba(0, 0, 0, 0.3);
    border-radius: 5px;
    font-weight: 500;
    font-size: 14px; /* Slightly smaller font size */
    backdrop-filter: blur(15px);
    transition: border 0.3s, box-shadow 0.3s;
}


        .login-container form input:focus {
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.3);
            border-color: #0f3460;
        }

        .login-container form button {
            background-color: #0f3460;
            color: white;
            display: block;
            padding: 13px;
            border-radius: 5px;
            outline: none;
            font-size: 18px;
            letter-spacing: 1.5px;
            font-weight: bold;
            width: 100%;
            cursor: pointer;
            margin-bottom: 2rem;
            border: none;
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        .login-container form button:hover {
            box-shadow: 0 0 10px 1px rgba(0, 0, 0, 0.15);
            background-color: #0d2852;
        }

        .circle {
            width: 8rem;
            height: 8rem;
            background: #0f3460;
            border-radius: 50%;
            position: absolute;
        }

        .illustration {
            position: absolute;
            top: -14%;
            right: -2px;
            width: 90%;
        }

        .circle-one {
            top: 0;
            left: 0;
            z-index: -1;
            transform: translate(-45%, -45%);
        }

        .circle-two {
            bottom: 0;
            right: 0;
            z-index: -1;
            transform: translate(45%, 45%);
        }

        .register-forget {
            margin: 1rem 0;
            display: flex;
            justify-content: space-around;
            gap: 15px;
            flex-wrap: wrap;
        }

        .register-forget a {
            color: black;
            padding: 5px 10px;
            border-radius: 3px;
            transition: color 0.3s ease-in-out;
        }

        .register-forget a:hover {
            color: blue;
        }

        .opacity {
            opacity: 0.8;
        }

        .theme-btn-container {
            position: absolute;
            left: 0;
            bottom: 2rem;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .theme-btn {
            cursor: pointer;
            transition: all 0.3s ease-in;
            background-color: #0f3460;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            width: 150px;
            text-align: center;
            font-size: 16px;
        }

        .message-container {
            position: fixed;
            top: 20px;
            right: 50px;
            background-color:black; /* White background */
            color: white; /* Black text */
            padding: 10px 20px;
            border: 1px solid gold;/* Red border for emphasis */
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
            font-size: 16px; /* Adjust text size */
            display: inline-flex; /* Aligns content horizontally */
            align-items: center; /* Centers items vertically */
            gap: 10px; /* Space between symbol and message */
            z-index: 1000; /* Ensures it appears on top */
            animation: fadein 0.5s, fadeout 0.5s 2.5s; /* Visible for 3 seconds */
        }

        .failed-symbol {
            font-size: 18px;
            color: red; /* Red symbol */
        }

        @keyframes fadein {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes fadeout {
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
            }
        }
        @keyframes wobble {
            0% {
                transform: scale(1.025);
            }
            25% {
                transform: scale(1);
            }
            75% {
                transform: scale(1.025);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">
       
            <span>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="${pageContext.request.contextPath}/images/code.png" alt="Logo">
            </span>
            <span>ERP</span>
        </div>
        <div class="navbar-links">
            <a href="/">Home</a>
            <a href="aboutus">About Us</a>
            <a href="contact">Contact Us</a>
            <a href="login">Login</a>
        </div>
    </div>
    <br/><br/><br/>
 <c:if test="${not empty message}">
    <div class="message-container" id="message">
        <span class="failed-symbol">❌</span> 
        <c:out value="${message}" />
    </div>
</c:if>



    <!-- Admin Login Form Section -->
    <section class="container">
        <div class="login-container">
            <!-- Decorative Circles and Illustration -->
            <div class="circle circle-one"></div>
            <img src="https://raw.githubusercontent.com/hicodersofficial/glassmorphism-login-form/master/assets/illustration.png" alt="illustration" class="illustration" />

            <!-- Overlay Text for "ADMIN LOGIN" -->
           

            <div class="form-container">
            <img src="https://raw.githubusercontent.com/hicodersofficial/glassmorphism-login-form/master/assets/illustration.png" alt="illustration" class="illustration" />
                <h1 class="opacity">ADMIN LOGIN</h1>
                
                <form method="post" action="checkadminlogin">
                    <input type="text" id="auname" name="auname" placeholder="Username" required />
                    <input type="password" id="apwd" name="apwd" placeholder="Password" required />
                    <button type="submit">Login</button>
                </form>
                <div class="register-forget">
                    <a href="adminlogin">Admin</a>
                    <a href="facultylogin">Faculty</a>
                    <a href="forgotpass">Forgot Password</a>
                </div>
            </div>
            <div class="circle circle-two"></div>
        </div>
    </section>
<script>
    // JavaScript to remove the message after 3 seconds
    window.onload = function() {
        var messageContainer = document.getElementById('message');
        if (messageContainer) {
            setTimeout(function() {
                messageContainer.style.display = 'none';
            }, 3000); // Hide after 3 seconds
        }
    };
</script>

</body>
</html>