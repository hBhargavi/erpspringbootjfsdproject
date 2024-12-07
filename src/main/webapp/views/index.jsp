<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ERP</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Quicksand:wght@400;600&display=swap');

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            scroll-behavior: smooth;
            background-color: black;
        }
.section-black {
    color: white;
    text-align: center;
    padding: 100px 20px;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    position: relative;
    z-index: 1;
    background-color: black;
    border-bottom-left-radius: 50% 10%;
    border-bottom-right-radius: 50% 10%;
}


 .section-black::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 150px;
    background: black; /* Adjusted to maintain the black background */
    z-index: -1;
}


        .section-black h1 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #D3D3D3;
        }

        .section-black p {
            font-size: 20px;
            margin-bottom: 30px;
            color: #D3D3D3;
        }

        .section-black p .highlight {
            color: #7f00ff;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .section-black p .highlight:hover {
            color: #32a852;
        }

        .navbar {
            display: flex;
            align-items: center;
            padding: 15px 30px;
            position: fixed;
            top: 0;
            width: 100%;
           
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

        .section-white {
            background-color: white;
            color: black;
            text-align: center;
            padding: 100px 20px;
            min-height: 100vh;
        }

        .section-white h2 {
            font-size: 36px;
            margin-bottom: 40px;
            font-family: 'Quicksand', sans-serif;
        }

        .cards-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 0 20px;
        }

        .card {
    background-color: #f9f9f9;
    color: black;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 30px 25px;
    border-radius: 8px;
    width: 320px;
    text-align: left;
    transition: transform 0.3s ease, box-shadow 0.3s ease, border-bottom 0.3s ease;
    font-family: 'Quicksand', sans-serif;
}

/* Hover effect */
.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    border-bottom: 4px solid #7f00ff; /* Line appears on hover */
}


        .card h3 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #7f00ff;
            font-weight: 600;
        }

        .card p {
            font-size: 16px;
            line-height: 1.6;
            color: #333;
        }

        .card b {
            font-weight: 600;
        }
        .typewriter {
    font-size: 48px;
    font-weight: bold;
    margin: 0 auto;
    color: transparent; /* Required for glitter effect */
    background-image: linear-gradient(90deg, #ff7b00, #ff00e6, #00d4ff, #7f00ff, #32a852);
    background-size: 300% 300%;
    background-clip: text;
    -webkit-background-clip: text;
    animation: glitter 5s infinite, typing 4s steps(30, end), blink 0.6s step-end infinite alternate;
    overflow: hidden; /* For typewriter effect */
    white-space: nowrap; /* Prevent wrapping */
    border-right: 4px solid white; /* Typewriter cursor */
    display: inline-block;
}

/* Typing animation */
@keyframes typing {
    from { width: 0; }
    to { width: 100%; }
}

/* Cursor blinking */
@keyframes blink {
    from { border-color: transparent; }
    to { border-color: white; }
}

@keyframes glitter {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
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
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <div id="home" class="section-black">
      <!-- Background Video -->
    <video autoplay loop muted playsinline style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; z-index: -1;">
        <source src="${pageContext.request.contextPath}/images/video.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
        <h1 class="typewriter">
        <br/><br/><br/>
    Welcome to <span class="highlight">ERP</span> System
</h1>

        <p>
            Empower <span class="highlight">educators</span> and streamline 
           administrative tasks with 
            cutting-edge ERP solutions designed for 
            <span class="highlight">success.</span>
        </p>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320" style="position: relative; top: -1px;">
    <path fill="#000000" fill-opacity="1" d="M0,224L1440,96L1440,320L0,320Z"></path>
</svg>
        
    </div>

    <div class="section-white">
        <h2>Technologies We Used</h2>
        <div class="cards-container">
            <div class="card">
                <h3>Front-End</h3>
                <p>
                    <b>HTML:</b> The backbone for structuring web pages.<br>
                    <b>CSS:</b> Ensures visually appealing designs.<br>
                    <b>JavaScript:</b> Adds interactivity and logic.<br>
                    <b>JSP:</b> Renders dynamic content on the server.
                </p>
            </div>
            <div class="card">
                <h3>Middleware</h3>
                <p>
                    <b>Spring Boot:</b> A powerful framework for scalable back-end development.<br>
                    <b>REST APIs:</b> Facilitates communication between services.
                </p>
            </div>
            <div class="card">
                <h3>Database</h3>
                <p>
                    <b>MySQL:</b> A robust relational database for managing ERP data efficiently.
                </p>
            </div>
        </div>
    </div>
</body>
</html>
