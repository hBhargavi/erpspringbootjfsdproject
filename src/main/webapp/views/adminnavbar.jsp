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
body {
    margin: 0;
    font-family: 'Titillium Web', sans-serif;
}

body::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    
    background-size: cover; /* Ensures full coverage of the background */
    background-position: center;
    background-repeat: no-repeat;
    z-index: -1; /* Ensures the background is behind the content */
}

.area {
    position: relative;
    z-index: 1; /* Higher z-index to keep content visible over the background */
    padding: 20px;
    margin-left: 250px; /* Space for sidebar */
    min-height: 100vh; /* Ensures content fills screen height even when short */
    overflow-y: auto; /* Allows content to scroll */
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
            transition: width 0.3s ease-in-out;
        }

        .main-menu.collapsed {
            width: 60px; /* Collapse to a smaller width */
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

        .area {
            background: #e2e2e2;
            margin-left: 250px; /* Space for sidebar */
            padding: 20px; /* Padding around the content */
            height: 100vh; /* Full height */
            overflow: auto; /* Allow scrolling if content exceeds the height */
            transition: margin-left 0.3s ease-in-out;
        }

        .area.expanded {
            margin-left: 60px; /* Adjust content area when sidebar is collapsed */
        }

        .content {
            background: white; /* White background for the middle content */
            padding: 20px; /* Padding inside the content area */
            border-radius: 5px; /* Optional: Rounded corners */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Optional: Light shadow for effect */
        }

       .toggle-btn {
    position: absolute;
    top: 50%; /* Position in the middle vertically */
    left: 250px; /* Start from the right of the full sidebar */
    cursor: pointer;
    background: #212121;
    color: #fff;
    padding: 6px; /* Adjust padding for a smaller button */
    border-radius: 0 5px 5px 0;
    transition: left 0.3s ease-in-out;
    transform: translateY(-50%); /* Center the button vertically */
    z-index: 1001;
    font-size: 12px; /* Decrease arrow size */
}

.toggle-btn i {
    font-size: 14px; /* Adjust icon size here */
}


        .main-menu.collapsed ~ .toggle-btn {
            left: 60px; /* Adjust position when sidebar is collapsed */
        }

        .submenu {
            display: none; /* Initially hide submenu */
        }

        .submenu a {
            padding-left: 40px; /* Indent submenu items */
        }

        .submenu-toggle {
            cursor: pointer;
        }

        .submenu-toggle:hover {
            color: #fff;
        }
    </style>
</head>
<body>

    <nav class="main-menu">
        <ul>
            <li>
                <a href="home">
                    <i class="fa fa-home fa-2x"></i>
                    <span class="nav-text">Home</span>
                </a>
            </li>

            <!-- Student heading with collapsible submenu -->
            <li class="submenu-toggle">
                <a href="javascript:void(0);">
                    <i class="fa fa-users fa-2x"></i>
                    <span class="nav-text">Student</span>
                </a>
            </li>
            <ul class="submenu">
                <li>
                    <a href="addstu">
              <i class="fa fa-user-plus fa-2x"></i> 
                        <span class="nav-text">Add Student</span>
                    </a>
                </li>
                <li>
                    <a href="updatestudetails">
                        <i class="fa fa-edit fa-2x"></i>
                        <span class="nav-text">Update Student</span>
                    </a>
                </li>
                <li>
                    <a href="deletestudent">
                        <i class="fa fa-trash fa-2x"></i>
                        <span class="nav-text">Delete Student</span>
                    </a>
                </li>
                <li>
                    <a href="viewallstudents">
                        <i class="fa fa-id-card fa-2x"></i>
                        <span class="nav-text">View All Students</span>
                    </a>
                </li>
                
                             <li>
    <a href="viewallmappedcourses">
        <i class="fa fa-edit fa-2x"></i> 
        <span class="nav-text">Update Student Course</span>
    </a>
</li>


     <li>
    <a href="viewallstudentstounregister">
        <i class="fa fa-edit fa-2x"></i> 
        <span class="nav-text">Unregister</span>
    </a>
</li>
                
            </ul>













           <!-- Faculty Section -->
            <li class="submenu-toggle">
                <a href="javascript:void(0);">
                    <i class="fa fa-users fa-2x"></i>
                    <span class="nav-text">Faculty</span>
                </a>
            </li>
            <ul class="submenu">
            
             <li>
            <a href="facreg">
             <i class="fa fa-user-plus fa-2x"></i>
            <span class="nav-text">Add Faculty</span>
            
            </a>
            </li>
                <li>
                    <a href="updatefacdetails">
                        <i class="fa fa-edit fa-2x"></i>
                        <span class="nav-text">Update Faculty</span>
                    </a>
                </li>
                <li>
                    <a href="deletefaculty">
                        <i class="fa fa-trash fa-2x"></i>
                        <span class="nav-text">Delete Faculty</span>
                    </a>
                </li>
               
                <li>
                    <a href="viewallfaculty">
                        <i class="fa fa-id-card fa-2x"></i>
                        <span class="nav-text">View All Faculty</span>
                    </a>
                </li>
            </ul>

            <!-- Courses Section - Separate from Faculty -->
            <li class="submenu-toggle">
                <a href="javascript:void(0);">
                    <i class="fa fa-book fa-2x"></i>
                    <span class="nav-text">Courses</span>
                </a>
            </li>
            <ul class="submenu">
                <li>
                    <a href="insertcourse">
                        <i class="fa fa-plus fa-2x"></i>
                        <span class="nav-text">Add Course</span>
                    </a>
                </li>
                <li>
                    <a href="selectsemandyearforcourseview">
                        <i class="fa fa-eye fa-2x"></i>
                        <span class="nav-text">View All Courses</span>
                    </a>
                </li>
                
                <li>
                    <a href="selectsemandyearforcoursedelete">
                        <i class="fa fa-trash fa-2x"></i>
                        <span class="nav-text">Delete Course</span>
                    </a>
                </li>
                <li>
                    <a href="updatecoursedetails">
                        <i class="fa fa-edit fa-2x"></i>
                        <span class="nav-text">Update Course</span>
                    </a>
                </li>
                
                
 



            </ul>

		 <li class="submenu-toggle"><a href="javascript:void(0);">
          <i class="fa fa-credit-card fa-2x"></i>
          <span class="nav-text">Payments</span>
          </a>
            </li>
    
    			<ul class="submenu">
                <li>
                <a href="viewallorders">
                <i class="fa fa-eye fa-2x"></i>
                <span class="nav-text">View All Payment</span>
                </a>
                </li>
                
            </ul>
    

		
		
	<!-- Main menu item for Leave -->
<li class="submenu-toggle">
    <a href="javascript:void(0);">
        <i class="fa fa-calendar fa-2x"></i> <!-- Calendar icon for Leave -->
        <span class="nav-text">Leave</span>
    </a>
</li>
<ul class="submenu">
    <!-- Sub-menu item for View All Leaves -->
    <li>
        <a href="viewallleaves">
            <i class="fa fa-users fa-2x"></i> <!-- Users icon for viewing all leaves -->
            <span class="nav-text">View All Leaves</span>
        </a>
    </li>
</ul>

  
		
            <!-- My Profile heading -->
            <li class="submenu-toggle">
                <a href="javascript:void(0);">
                    <i class="fa fa-user fa-2x"></i>
                    <span class="nav-text"> Profile</span>
                </a>
            </li>
            <ul class="submenu">
                <li>
                    <a href="adminprofile">
                        <i class="fa fa-eye fa-2x"></i>
                        <span class="nav-text">View Profile</span>
                    </a>
                </li>
                <li>
                    <a href="updateadminprofile">
                        <i class="fa fa-edit fa-2x"></i>
                        <span class="nav-text">Update Profile</span>
                    </a>
                </li>
            </ul>


			<li class="submenu-toggle">
    <a href="javascript:void(0);">
        <i class="fa fa-calendar fa-2x"></i> <!-- Calendar icon for Timetable -->
        <span class="nav-text">Timetable</span>
    </a>
</li>

            </li>
			<ul class="submenu">
				<li>
                    <a href="showAddTimetableForm">
                        <i class="fa fa-plus fa-2x"></i>
                        <span class="nav-text">Add TimeTable</span>
                    </a>
                </li>
               
				<li>
                    <a href=" selectYearAndSemestertimetable">
                        <i class="fa fa-eye fa-2x"></i>
                        <span class="nav-text">View TimeTable</span>
                    </a>
                </li>
               </ul>


			
<li class="submenu-toggle">
    <a href="javascript:void(0);">
        <i class="fa fa-calendar-check-o fa-2x"></i> <!-- Icon for Attendance -->
        <span class="nav-text">Attendance</span>
    </a>
</li>
    
    <ul class="submenu">
        <li>
            <a href="adminviewallattendance">
                <i class="fa fa-eye fa-2x"></i> <!-- Icon for View Attendance -->
                <span class="nav-text">View Attendance</span>
            </a>
        </li>
    </ul>

<li class="submenu-toggle">
    <a href="javascript:void(0);">
        <i class="fa fa-file fa-2x"></i> <!-- Icon for Exams -->
        <span class="nav-text">Exams</span>
    </a>
</li>

<ul class="submenu">
    <li>
        <a href="uploadExamForm">
            <i class="fa fa-plus fa-2x"></i>
            <span class="nav-text">Add Exam PDFs</span>
        </a>
    </li>

    <li>
        <a href="selectyearandsemesterexamadmin">
            <i class="fa fa-eye fa-2x"></i>
            <span class="nav-text">View All Exams</span>
        </a>
    </li>
</ul>


<li class="submenu-toggle">
    <a href="javascript:void(0);">
        <i class="fa fa-file fa-2x"></i> <!-- Icon for Exams -->
        <span class="nav-text">Feeback</span>
    </a>
</li>
<ul class="submenu">
<li>
        <a href="showfeedbackform">
                        <i class="fa fa-plus fa-2x"></i>
            <span class="nav-text">Add Feedback</span>
        </a>
    </li>
   

 <li>
        <a href="viewallfeedbackresponses">
            <i class="fa fa-users fa-2x"></i> <!-- Users icon for viewing all leaves -->

            <span class="nav-text">View All Feedback</span>
        </a>
    </li>
    </ul> 
    
 		



            <!-- Logout -->
            <li>
                <a href="adminlogout">
                    <i class="fa fa-power-off fa-2x"></i>
                    <span class="nav-text">Logout</span>
                </a>
            </li>
        </ul>
    </nav>

    <!-- Toggle Button -->
    <div class="toggle-btn">
        <i class="fa fa-arrow-left"></i>
    </div>
<script>
    // JavaScript to toggle the submenu visibility when clicked
    document.querySelectorAll('.submenu-toggle').forEach(item => {
        item.addEventListener('click', () => {
            const submenu = item.nextElementSibling; // Get the next <ul> (submenu)
            if (submenu) {
                submenu.classList.toggle('submenu'); // Toggle the submenu visibility
            }
        });
    });
</script>

</body>
</html>