<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* Fonts and Main Styles */
        @import url('https://fonts.googleapis.com/css?family=Titillium+Web:300');
        .fa-2x { font-size: 1.8em; }
        .fa { width: 60px; height: 36px; text-align: center; vertical-align: middle; font-size: 20px; }

        /* Sidebar Styling */
        .main-menu {
            background: #212121;
            position: fixed;
            top: 0; bottom: 0; height: 100%; left: 0;
            width: 250px; overflow: hidden; z-index: 1000;
        }
        .main-menu ul { margin: 0; padding: 0; list-style: none; }
        .main-menu li { display: block; }
        .main-menu li a {
            color: #999; font-family: 'Titillium Web', sans-serif; font-size: 16px;
            text-decoration: none; padding: 10px 20px; display: flex; align-items: center;
        }
        .main-menu .nav-icon { width: 60px; text-align: center; }
        .main-menu .nav-text { font-size: 16px; margin-left: 10px; }

        /* Hover Effect */
        .main-menu li a:hover, .main-menu li a:focus { color: #fff; background-color: #000; }

        /* Main Content Area */
        .area {
            background: #fff; /* White background for content */
            margin-left: 250px; /* Space for sidebar */
            padding: 20px; height: 100vh;
        }

        /* Submenu Styling */
        .submenu { display: none; } /* Hidden initially */
        .submenu a { padding-left: 40px; } /* Indented submenu */
        .submenu-toggle { cursor: pointer; }
        .submenu-toggle:hover { color: #fff; }
    </style>
</head>
<body>

    <!-- Sidebar Navigation -->
    <nav class="main-menu">
        <ul>
            <li><a href="${pageContext.request.contextPath}/studenthomes">
                <i class="fa fa-home fa-2x"></i><span class="nav-text">Home</span></a></li>

            <li class="submenu-toggle"><a href="javascript:void(0);">
                <i class="fa fa-calendar-check-o fa-2x"></i><span class="nav-text">Attendance</span></a>
            </li>
            <ul class="submenu">
                <li><a href="selectYearAndSemesterstudentattattendance">
                    <i class="fa fa-check-square-o fa-2x"></i><span class="nav-text">View Attendance</span></a></li>
            </ul>

            <li><a href="studentexamsemandyear"><i class="fa fa-pencil fa-2x"></i><span class="nav-text">Exam</span></a></li>
            <li><a href="#"><i class="fa fa-graduation-cap fa-2x"></i><span class="nav-text">CGPA</span></a></li>

            <li class="submenu-toggle"><a href="javascript:void(0);">
                <i class="fa fa-credit-card fa-2x"></i><span class="nav-text">Payments</span></a>
            </li>
            <ul class="submenu">
                <li><a href="orders"><i class="fa fa-credit-card fa-2x"></i><span class="nav-text">Fee Payment</span></a></li>
                <li><a href="viewstudentorders"><i class="fa fa-eye fa-2x"></i><span class="nav-text">My Payments</span></a></li>
            </ul>

            <li class="submenu-toggle"><a href="javascript:void(0);">
                <i class="fa fa-user fa-2x"></i><span class="nav-text">My Profile</span></a>
            </li>
            <ul class="submenu">
                <li><a href="studentprofile"><i class="fa fa-eye fa-2x"></i><span class="nav-text">View Profile</span></a></li>
                <li><a href="studentprofileupdate"><i class="fa fa-edit fa-2x"></i><span class="nav-text">Update Profile</span></a></li>
            </ul>

            <li class="submenu-toggle"><a href="javascript:void(0);">
                <i class="fa fa-book fa-2x"></i><span class="nav-text">Courses</span></a>
            </li>
            <ul class="submenu">
                <li><a href="${pageContext.request.contextPath}/register?studentId=${student.id}">
                    <i class="fa fa-pencil fa-2x"></i><span class="nav-text">Register Courses</span></a></li>
                <li><a href="${pageContext.request.contextPath}studentsubmitYearAndSemester">
                    <i class="fa fa-id-card fa-2x"></i><span class="nav-text">View Courses</span></a></li>
            </ul>
            

			           <li>
    <a href="${pageContext.request.contextPath}/studentTimetable">
      <i class="fa fa-calendar fa-2x"></i>
        <span class="nav-text">Timetable</span>
    </a>
</li>

           
  <li>
        <a href="studentsemandyearfeedback">
                        <i class="fa fa-plus fa-2x"></i>
            <span class="nav-text">Feedback</span>
        </a>
    </li>






            <li><a href="${pageContext.request.contextPath}/login">
                <i class="fa fa-power-off fa-2x"></i><span class="nav-text">Logout</span></a></li>
        </ul>
    </nav>

    <!-- JavaScript for Submenu Toggle -->
    <script>
        document.querySelectorAll('.submenu-toggle').forEach(toggle => {
            toggle.addEventListener('click', function() {
                const submenu = this.nextElementSibling;
                submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
            });
        });
    </script>

</body>
</html>
