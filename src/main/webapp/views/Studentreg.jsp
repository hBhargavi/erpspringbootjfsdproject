<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Admin adm = (Admin) session.getAttribute("admin");
if (adm == null) {
    response.sendRedirect("adminlogin"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<%@include file="adminnavbar.jsp" %>
<html>
<head>
    <title>Student Registration Form</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
        }
	 .

        .form-container {
            width: 90%;
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .form-section div {
            flex: 1;
            min-width: 300px; /* Minimum width for better responsiveness */
            padding: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="number"],
        select,
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Include padding and border in element's total width and height */
        }

        form {
            display: flex;
            flex-direction: column; /* Stack buttons vertically */
            align-items: center; /* Center items horizontally */
            justify-content: center; /* Center items vertically */
            margin-top: 20px; /* Optional: add some space above the form */
        }

        /* New styles for button container */
        .button-container {
            display: flex; /* Use flexbox for horizontal alignment */
            justify-content: center; /* Center the buttons */
            margin-top: 20px; /* Optional: add some space above the buttons */
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: black; /* Button color */
            color: white;
            padding: 10px 15px; /* Button padding */
            border: none;
            border-radius: 4px; /* Rounded corners */
            cursor: pointer;
            font-size: 14px; /* Font size */
            transition: background-color 0.3s;
            margin: 0 5px; /* Add margin between buttons */
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #45a049; /* Hover color */
        }

        @media (max-width: 600px) {
            .form-section {
                flex-direction: column; /* Stack fields on small screens */
            }
        }
        .popup-message {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #000; /* Black background */
            color: #fff; /* White text */
            font-family: 'Raleway', sans-serif;
            font-size: 16px;
            font-weight: 600;
            padding: 15px 25px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            display: none; /* Initially hidden */
            opacity: 0; /* For fade-in effect */
            transform: translateY(-20px); /* Initial position */
            transition: all 0.5s ease; /* Smooth animation */
        }

        .popup-message.show {
            display: block; /* Show the pop-up */
            opacity: 1; /* Fade-in effect */
              transform: translateY(0); /* Slide to position */
        }
        
  
    </style>
   <script>
    document.getElementById("emailInput").addEventListener("blur", function() {
        let emailField = this;
        if (!emailField.value.endsWith("@gmail.com")) {
            emailField.value = emailField.value + "@gmail.com";
        }
    });
    // Show the pop-up for 3 seconds
    function showPopup() {
        const popup = document.getElementById('popupMessage');
        popup.classList.add('show'); // Add the show class
        setTimeout(() => {
            popup.classList.remove('show'); // Remove the show class after 3 seconds
        }, 3000); // 3000ms = 3 seconds
    }

    // Automatically show the pop-up when the page loads if there's a message
    window.onload = function () {
        const message = document.getElementById('popupMessage').textContent.trim();
        if (message) {
            showPopup();
        }
    };
</script>
</head>
<body>
     <div class="popup-message" id="popupMessage">
        <c:out value="${message}"></c:out>
    </div>
    
        <form action="insertstudent" method="post" enctype="multipart/form-data">
            <div class="form-section">
                <div>
                    <h3>Personal Information</h3>
                    
                    
                    <label for="StudentId">Student ID</label>
                    <input type="number" id="id" name="id" required>
                    
                    
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required>

                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required>

                    <label for="gender">Gender:</label>
                    <select id="gender" name="gender" required>
                        <option value="">--SELECT--</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>

                    <label for="fatherName">Father's Name:</label>
                    <input type="text" id="fatherName" name="fatherName" required>

                    <label for="motherName">Mother's Name:</label>
                    <input type="text" id="motherName" name="motherName" required>

                    <label for="contactno">Contact Number:</label>
                    <input type="text" id="contactno" name="contactno"  required pattern="^[6789]\d{9}$" title="Phone number must start with 6, 7, 8, or 9 and be 10 digits long.">

                    <label for="permanentAddress">Permanent Address:</label>
                    <input type="text" id="permanentAddress" name="permanentAddress" required>

                    <label for="dateOfBirth">Date of Birth:</label>
                    <input type="date" id="dateOfBirth" name="dateOfBirth" required>

                    <label for="bloodGroup">Blood Group:</label>
                    <select id="bloodGroup" name="bloodGroup" required>
                        <option value="">--SELECT--</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select>

                    <label for="maritalStatus">Marital Status:</label>
                    <select id="maritalStatus" name="maritalStatus" required>
                        <option value="">--SELECT--</option>
                        <option value="Single">Single</option>
                        <option value="Married">Married</option>
                        <option value="Divorced">Divorced</option>
                    </select>

                    <label for="motherTongue">Mother Tongue:</label>
                     <select name="motherTongue" id="motherTongue" required>
                <option value="">--SELECT--</option>
                <option value="Telugu">Telugu</option>
                <option value="Hindi">Hindi</option>
                <option value="Urdu">Urdu</option>
                <option value="Tamil">Tamil</option>
            </select>

                    <label for="casteCategory">Caste Category:</label>
                   
                  	 <select name="casteCategory" id="casteCategory" required>
                <option value="">--SELECT--</option>
                <option value="General">General</option>
                <option value="SC">SC</option>
                <option value="ST">ST</option>
                <option value="OBC">OBC</option>
            	</select>
                    
                    
                    
                    <label>Profile</label>
					<input type="file" name="studentprofileimage" required>

                
                </div>

                <div>
                    <h3>Additional Information</h3>
                    <label for="personalEmail">Personal Email:</label>
                    <input type="email" id="personalEmail" name="personalEmail"
                       pattern="^[a-zA-Z0-9._%+-]+@gmail\.com$" 
           				title="Please enter a valid Gmail address (e.g., user@gmail.com)"
                     required>

                    <label for="identification">Identification:</label>
                    <input type="text" id="identification" name="identification"  maxlength="12" pattern=".{12}" title="Identification must be exactly 12 characters" required>

                    <label for="disability">Disability:</label>
                    <select name="disability" id="disability" required>
                <option value="">Select Disability</option>
                <option value="None">None</option>
                <option value="Visual">Visual</option>
                <option value="Hearing">Hearing</option>
                <option value="Mobility">Mobility</option>
            </select>
                    

                    <label for="placeOfBirth">Place of Birth:</label>
                    <input type="text" id="placeOfBirth" name="placeOfBirth" required>

                    <label for="height">Height (in cm):</label>
                    <input type="number" id="height" step="0.01" name="height" required=>
                    
	
				
	
                    <label for="weight">Weight (in kg):</label>
                    <input type="number" id="weight" name="weight" required>

                    <label for="religion">Religion:</label>
                    <select id="religion" name="religion" required>
                        <option value="">--SELECT--</option>
                        <option value="Hindu">Hindu</option>
                        <option value="Muslim">Muslim</option>
                        <option value="Christian">Christian</option>
                        <option value="Sikh">Sikh</option>
                        <option value="Other">Other</option>
                    </select>

                    <label for="nationality">Nationality:</label>
                    <select id="nationality" name="nationality" required>
                        <option value="">--SELECT--</option>
                        <option value="Indian">Indian</option>
                        <option value="American">American</option>
                        <option value="British">British</option>
                        <option value="Other">Other</option>
                    </select>

                    <label for="admissionDate">Admission Date:</label>
                    <input type="date" id="admissionDate" name="admissionDate" required>

                    <label for="majorDegree">Major Degree:</label>
                    <select id="majorDegree" name="majorDegree" required>
                        <option value="">--SELECT--</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Business Administration">Business Administration</option>
                        <option value="Psychology">Psychology</option>
                        <option value="Engineering">Engineering</option>
                        <option value="Mathematics">Mathematics</option>
                    </select>

                    <label for="referredBy">Referred By:</label>
                    <select id="referredBy" name="referredBy" required>
                        <option value="">--SELECT--</option>
                        <option value="Self">Self</option>
                        <option value="Teacher">Teacher</option>
                        <option value="Friend">Friend</option>
                        <option value="Other">Other</option>
                    </select>

                    <label for="program">Program:</label>
                    <select id="program" name="program" required>
                        <option value="">--SELECT--</option>
                        <option value="B.TECH">B.TECH</option>
                        <option value="B.Com">B.Com</option>
                        <option value="B.A">B.A</option>
                        <option value="M.Sc">M.Sc</option>
                        <option value="M.Com">M.Com</option>
                        <option value="M.A">M.A</option>
                    </select>

                    <label for="regulation">Regulation:</label>
                    <select id="regulation" name="regulation" required>
                        <option value="">--SELECT--</option>
                        <option value="2020">2020</option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                    </select>

                    <label for="hostelStatus">Hostel Status:</label>
                    <select id="hostelStatus" name="hostelStatus">
                        <option value="">--SELECT--</option>
                        <option value="Yes">HOSTLER</option>
                        <option value="No">DAYSCHOLAR</option>
                    </select>

                    <label for="highschool">High School:</label>
                    <input type="text" id="highschool" name="highschool" required>

                    <label for="intermediate">Intermediate:</label>
                    <input type="text" id="intermediate" name="intermediate" required>
                </div>
                
                

            </div>

            <div class="button-container">
                <input type="submit" value="Submit">
                <input type="reset" value="Clear"> <!-- Clear button -->
            </div>
        </form>
    </div>
</body>
</html>
