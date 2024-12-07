<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Quicksand:wght@400;600&display=swap');

        /* Body styling */
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

        /* Main content layout */
        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            gap: 15px;
        }

        .image-section {
            flex: 1;
            max-width: 400px;
            height: 350px;
            background-image: url('https://filmfunder.com/wp-content/uploads/2023/11/undraw-contact.svg');
            background-size: cover;
            background-position: center;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
        }

        .contact-form-wrapper {
            flex: 1;
            max-width: 400px;
            background: linear-gradient(145deg, #1a1a2e, #4a4e69);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .contact-form h2 {
            color: #ffffff;
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
        }

        .contact-form table {
            width: 100%;
            border-collapse: collapse;
        }

        .contact-form label {
            display: block;
            margin-bottom: 5px;
            color: #ffffff;
            font-size: 14px;
        }
.contact-form input,
.contact-form textarea {
    width: calc(100% - 10px);
    padding: 10px;
    margin-bottom: 15px; /* Added margin for spacing */
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    background-color: #f8f8f8;
    color: #000;
}

.contact-form table td {
    padding: 5px; /* Added padding for spacing between table cells */
}


        .button-container {
            text-align: center;
            margin-top: 15px;
        }

        .button-container input[type="submit"],
        .button-container input[type="reset"] {
            background-color: #7f00ff;
            color: white;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
            width: 45%;
        }

        .contact-email {
            font-size: 16px;
            color: #7f00ff;
            margin-top: 20px;
            text-align: center;
        }
        .message-box {
    position: fixed;
    top: 15px;
    right: 15px;
    background-color: white;
    color: black;
    padding: 10px 20px;
    border: 2px solid gold;
    border-radius: 5px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    font-family: 'Poppins', sans-serif;
    font-size: 14px;
    z-index: 1100;
}

.message-box span {
    font-weight: bold;
    color: gold;
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


    <!-- Main Content -->
    <div class="main-container">
        <div class="image-section"></div>
        <div class="contact-form-wrapper">
            <div class="contact-form">
                <h2>Contact Us</h2>
              
<c:if test="${not empty message}">
    <div class="message-box">
        <span>${message}</span>
    </div>
</c:if>

                <form method="post" action="sendemail">
                    <table>
                        <tr>
                            <td><label for="name">Name</label></td>
                            <td><input type="text" id="name" name="name" required /></td>
                        </tr>
                        <tr>
                        
                        </tr>
                        <tr>
                            <td><label for="email">Email ID</label></td>
                            <td><input type="email" id="email" name="email" required /></td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td><label for="subject">Subject</label></td>
                            <td><input type="text" id="subject" name="subject" required /></td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td><label for="message">Message</label></td>
                            <td><textarea id="message" name="message" rows="3" required></textarea></td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td colspan="2" class="button-container">
                                <input type="submit" value="Send" />
                                <input type="reset" value="Clear" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>

    <div class="contact-email">
        <p>For inquiries, email us at: <a href="mailto:2200031178@kluniversity.in">2200031178@kluniversity.in</a></p>
    </div>
 
</body>
</html>
