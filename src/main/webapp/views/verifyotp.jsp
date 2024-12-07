<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600;700&display=swap" rel="stylesheet">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: black;
            font-family: 'Poppins', sans-serif;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column; /* Added for proper alignment */
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
        }

        .navbar .logo img {
            height: 50px;
            margin-right: 10px;
        }

        .navbar .logo span {
            font-size: 24px;
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
        .container {
            display: flex;
            width: 100%;
            max-width: 1000px;
            height: 70%;
            background: rgba(0, 0, 0, 0.85);
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
            overflow: hidden;
            margin-top: 80px; /* Added margin to push content below navbar */
        }

        .image-section {
            flex: 0.6;
            background-image: url('${pageContext.request.contextPath}/images/mountain.jpg');
            background-size: cover;
            background-position: center;
            filter: brightness(80%) contrast(1.1);
            height: 100%;
            position: relative; /* To position the back button */
        }

        .back-to-login {
            position: absolute;
            top: 10px;
            right: 20px;
            color: white;
            font-size: 24px;
            text-decoration: none;
            background-color: transparent;
            border: none;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .back-to-login:hover {
            color: #7f00ff;
        }

        .form-container {
            flex: 0.4;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: black;
            padding: 2rem;
            border-radius: 0 15px 15px 0;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .form-container h1 {
            font-size: 1.8rem;
            text-align: center;
            color: white;
            margin-bottom: 1.5rem;
        }

        .form-container form {
            width: 90%;
            max-width: 350px;
            display: flex;
            flex-direction: column;
        }

        .form-container form input {
            display: block;
            padding: 12px;
            margin: 1rem 0;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.9);
            color: white;
            border: 1px solid #444;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 500;
            outline: none;
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        .form-container form input:focus {
            box-shadow: 0 0 10px rgba(128, 0, 255, 0.5);
            border-color: violet;
        }

        .form-container form button {
            background: #400090;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            outline: none;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .form-container form button:hover {
            background: #9b30ff;
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                width: 90%;
                height: auto;
                margin-top: 100px; /* Ensure enough space on small screens */
            }

            .image-section {
                height: 40%;
                width: 100%;
            }

            .form-container {
                padding: 1.5rem;
                border-radius: 0;
            }
        }
   /* Style for the Back to Login link */
.back-to-login {
    position: absolute;
    top: 80%;  /* Adjust the vertical position to make sure it stays below the button */
    right: 50%;
    transform: translateX(-50%); /* Center the link horizontally */
    color: white; /* Ensure visibility on black background */
    font-size: 16px; /* Increase the font size for better readability */
    text-decoration: none; /* Remove underline */
    padding: 10px;
    background-color: transparent;
    cursor: pointer;
    transition: color 0.3s ease;
}

.back-to-login:hover {
    color: #7f00ff; /* Color change on hover */
}
 .success 
        {
            color: gold;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>
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
    <div class="container">
        <!-- Image Section -->
        <div class="image-section">
         
        </div>

        <div class="form-container">
        
         <c:if test="${not empty message}">
                <p class="success">${message}</p>
            </c:if>
            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>
            <h1>Forgot Password</h1>
            
            <form action="verifyotp" method="post">
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
                <input type="text" id="otp" name="otp" placeholder="Enter the OTP" required>
                <button type="submit">Verify OTP</button>
            </form>
            
            <a href="login" class="back-to-login">Back to Login</a>
        </div>
    </div>
</body>
</html>
