<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
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
        .content {
            text-align: center;
            padding-top: 100px;
            color: white;
            padding-bottom: 20px;
        }
.team-member {
    display: inline-block;
    margin: 20px;
    padding: 20px;
    border-radius: 10px;
    background-color: rgba(30, 30, 30, 0.9); /* Semi-transparent black */
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.6);
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    width: 200px;
    position: relative;
    overflow: hidden; /* Ensures the image fits within the card */
}

.team-member:hover {
    transform: translateY(-10px);
    box-shadow: 0 12px 25px rgba(0, 0, 0, 0.8);
}

/* Adding the line effect */
.team-member::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0%;
    height: 3px; /* Thickness of the line */
    background-color:#7f00ff; /* Line color */
    transition: width 0.3s ease; /* Smooth effect for the line */
}

.team-member:hover::after {
    width: 100%; /* Line expands to full width */
}

.team-member img {
    width: 100%; /* Ensures the image fills the width of the card */
    height: 200px; /* Adjusted height for better proportion */
    object-fit: cover; /* Ensures the image doesn't stretch or distort */
    border-radius: 10px; /* Optional: Rounded corners for the image */
}


.team-member h3 {
    margin: 15px 0 5px 0;
    font-family: 'Quicksand', sans-serif;
    color:#7f00ff;
}

.team-member p {
    font-size: 14px;
    color: #D3D3D3;
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


    <div class="content">
        

        <!-- Mentor Section -->
       <!-- Mentor Section -->
<div class="mentor">
    <div class="team-member">
        <img src="${pageContext.request.contextPath}/images/surya.jpg" alt="Mr J Surya Kiran">
        <h3>Mr. J. Surya Kiran</h3>
        <p>Assistant Professor</p>
        <p>Mentor</p>
      
    </div>
</div>

<!-- Team Members Section -->
<div class="team-container">
    <div class="team-member">
        <img src="${pageContext.request.contextPath}/images/harshitha.jpg" alt="M Harshitha Reddy">
        <h3>M. Harshitha Reddy</h3>
        <p>2200030703</p>
        <p>Team Lead</p>
        
    </div>
    <div class="team-member">
        <img src="${pageContext.request.contextPath}/images/bhargavi.jpg" alt="D Bhargavi">
        <h3>D. Bhargavi</h3>
        <p>2200031178</p>
        <p>Developer</p>
        
    </div>
    <div class="team-member">
        <img src="${pageContext.request.contextPath}/images/srivalli.jpg" alt="CH Srivalli">
        <h3>Ch. Srivalli</h3>
        <p>2200030524</p>
        <p>Developer</p>
        
    </div>
</div>

        </div>
    </div>
</body>
</html>
