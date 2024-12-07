<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Titillium+Web:300');

        .fa-2x {
            font-size: 1.8em;
        }

        .fa {
            position: relative;
            display: table-cell;
            width: 60px;
            height: 36px;
            text-align: center;
            vertical-align: middle;
            font-size: 20px;
        }

        .main-menu {
            background: #212121;
            position: fixed;
            top: 0;
            bottom: 0;
            height: 100%;
            left: 0;
            width: 250px;
            overflow: hidden;
            z-index: 1000;
            padding-top: 20px;
        }

        .main-menu ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .main-menu li {
            display: block;
        }

        .main-menu li a {
            color: #999;
            font-family: 'Titillium Web', sans-serif;
            font-size: 16px;
            text-decoration: none;
            padding: 10px 20px;
            display: flex;
            align-items: center;
        }

        .main-menu .nav-icon {
            width: 60px;
            text-align: center;
        }

        .main-menu .nav-text {
            font-size: 16px;
            margin-left: 10px;
        }

        .main-menu li a:hover, .main-menu li a:focus {
            color: #fff;
            background-color: #000;
        }

        .main-menu ul.logout {
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        .profile-section {
            text-align: center;
            padding: 10px 0; /* Reduced padding */
            margin-bottom: 10px;
            border-bottom: 1px solid #333;
        }

        .profile-section img {
            width: 100px; /* Smaller size */
            height: 90px; /* Smaller size */
            border-radius: 50%;
            border: 2px solid #fff;
        }

        .profile-name {
            color: #fff;
            font-size: 14px; /* Slightly smaller font */
            font-weight: bold;
            margin-top: 5px;
            font-family: 'Titillium Web', sans-serif;
        }

        .area {
            background: #fff;
            margin-left: 250px;
            padding: 20px;
            height: 100vh;
        }

        .submenu {
            display: none;
        }

        .submenu a {
            padding-left: 40px;
        }

        .submenu-toggle {
            cursor: pointer;
        }

        .submenu-toggle:hover {
            color: #fff;
        }

        .icon-visible {
            display: inline-block;
        }
    </style>
</head>
<body>

    <nav class="main-menu">
 

        
        <ul>
            <!-- Home -->
            <li>
                <a href="facultyhome">
                    <i class="fa fa-home fa-2x"></i>
                    <span class="nav-text">Home</span>
                </a>
            </li>

            <li class="submenu-toggle">
                <a href="javascript:void(0);">
                    <i class="fa fa-book fa-2x"></i>
                    <span class="nav-text">Courses</span>
                </a>
            </li>
            <ul class="submenu">
                <li>
                    <a href="submitYearAndSemester">
                        <i class="fa fa-id-card fa-2x"></i>
                        <span class="nav-text">View Courses</span>
                    </a>
                </li>
            </ul>

            <li class="submenu-toggle">
                <a href="javascript:void(0);">
                    <i class="fa fa-calendar-check-o fa-2x icon-visible"></i>
                    <span class="nav-text">Attendance</span>
                </a>
            </li>
            <ul class="submenu">
                <li>
                    <a href="selectYearAndSemesterattendance">
                        <i class="fa fa-check-square-o fa-2x"></i>
                        <span class="nav-text">Take Attendance</span>
                    </a>
                </li>
                <li>
                    <a href="facultyviewstuattendance">
                        <i class="fa fa-eye fa-2x"></i>
                        <span class="nav-text">View Attendance</span>
                    </a>
                </li>
                <li>
                    <a href="facultyviewstudentbyyearandsem">
                        <i class="fa fa-users fa-2x"></i>
                        <span class="nav-text">View All Students</span>
                    </a>
                </li>
            </ul>

            <li class="submenu-toggle">
                <a href="javascript:void(0);">
                    <i class="fa fa-calendar fa-2x"></i>
                    <span class="nav-text">Leave</span>
                </a>
            </li>
            <ul class="submenu">
                <li>
                    <a href="applyforleave">
                        <i class="fa fa-plus-circle"></i>
                        <span class="nav-text">Apply for Leave</span>
                    </a>
                </li>
                <li>
                    <a href="viewleaves">
                        <i class="fa fa-eye"></i>
                        <span class="nav-text">View Leaves</span>
                    </a>
                </li>
            </ul>

            <li class="submenu-toggle">
                <a href="javascript:void(0);">
                    <i class="fa fa-user fa-2x"></i>
                    <span class="nav-text">My Profile</span>
                </a>
            </li>
            <ul class="submenu">
                <li>
                    <a href="facultyprofile">
                        <i class="fa fa-eye fa-2x"></i>
                        <span class="nav-text">View Profile</span>
                    </a>
                </li>
                <li>
                    <a href="updatefacultyprofile">
                        <i class="fa fa-edit fa-2x"></i>
                        <span class="nav-text">Update Profile</span>
                    </a>
                </li>
            </ul>

            <li>
                <a href="facultytimetable">
                    <i class="fa fa-calendar fa-2x"></i>
                    <span class="nav-text">Timetable</span>
                </a>
            </li>

            <li>
                <a href="exams">
                    <i class="fa fa-calendar fa-2x"></i>
                    <span class="nav-text">Exam</span>
                </a>
            </li>
           
            
            <li>
                <a href=" facultyviewfeedbackresponses">
                    <i class="fa fa-calendar fa-2x"></i>
                    <span class="nav-text">Feedback</span>
                </a>
            </li>

            <li>
                <a href="facultylogout">
                    <i class="fa fa-power-off fa-2x"></i>
                    <span class="nav-text">Logout</span>
                </a>
            </li>
        </ul>
    </nav>

    <script>
        const toggles = document.querySelectorAll('.submenu-toggle');
        toggles.forEach(toggle => {
            toggle.addEventListener('click', function() {
                const submenu = this.nextElementSibling;
                submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
            });
        });
    </script>
</body>
</html>
