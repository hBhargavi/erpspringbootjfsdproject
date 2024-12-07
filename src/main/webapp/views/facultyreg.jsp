<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Admin adm = (Admin) session.getAttribute("admin");
if (adm == null) {
	  response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
  return; // Prevent further processing
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Faculty Registration Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url('');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        margin: 0;
        padding: 20px;
    }

    .container {
        width: 60%;
        max-width: 600px;
        margin: auto;
        background-color: rgba(255, 255, 255, 0.8);
        padding: 20px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
        border-radius: 10px;
    }

    h2 {
        text-align: center;
    }

    .form-group {
        display: flex;
        margin-bottom: 15px;
    }

    .form-group label {
        width: 200px;
        font-weight: bold;
    }

    .form-group input, .form-group textarea, .form-group select {
        flex: 1;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .submit-btn {
        text-align: center;
    }

    .submit-btn input {
        padding: 10px 20px;
        background-color: black;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 10px;
    }

    .submit-btn input:hover {
        background-color: #333;
    }

    .clear-btn {
        background-color: black;
        color: white;
    }

    .clear-btn:hover {
        background-color: #333;
    }
</style>

    <script>
    document.getElementById("emailInput").addEventListener("blur", function() {
        let emailField = this;
        if (!emailField.value.endsWith("@gmail.com")) {
            emailField.value = emailField.value + "@gmail.com";
        }
    });
</script>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
<div class="container">
    <h2>Faculty Registration Form</h2>
    <form action="insertfaculty" method="POST" enctype="multipart/form-data">
    
    	 <div class="form-group">
            <label>Faculty Id</label>
            <input type="number" name="facultyid" required>
        </div>
    
        <div class="form-group">
            <label>First Name:</label>
            <input type="text" name="firstName" required>
        </div>

        <div class="form-group">
            <label>Middle Name:</label>
            <input type="text" name="middleName">
        </div>

        <div class="form-group">
            <label>Last Name:</label>
            <input type="text" name="lastName" required>
        </div>

        <div class="form-group">
            <label>Gender:</label>
            <select name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label>Father's Name:</label>
            <input type="text" name="fatherName" required>
        </div>

        <div class="form-group">
            <label>Mother's Name:</label>
            <input type="text" name="motherName" required>
        </div>

        <div class="form-group">
            <label>Date of Birth:</label>
            <input type="date" name="dob" required>
        </div>

       <div class="form-group">
            <label>Blood Group:</label>
            <select name="bloodGroup">
                <option value="">Select Blood Group</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
            </select>
        </div>

          <div class="form-group">
            <label>Marital Status:</label>
            <select name="maritalStatus" required>
                <option value="">Select Marital Status</option>
                <option value="Single">Single</option>
                <option value="Married">Married</option>
                <option value="Divorced">Divorced</option>
                <option value="Widowed">Widowed</option>
            </select>
        </div>
        <div class="form-group">
            <label>Mother Tongue:</label>
            <select name="motherTongue" required>
                <option value="">Select Mother Tongue</option>
                <option value="Telugu">Telugu</option>
                <option value="Hindi">Hindi</option>
                <option value="Urdu">Urdu</option>
                <option value="Tamil">Tamil</option>
            </select>
            
        </div>

        <div class="form-group">
            <label>Cast Category:</label>
            <input type="text" name="castCategory">
        </div>
<div class="form-group">
    <label>Email:</label>
    <input type="email" name="email" id="emailInput" required 
           pattern="^[a-zA-Z0-9._%+-]+@gmail\.com$" 
           title="Please enter a valid Gmail address (e.g., user@gmail.com)"
           >
</div>



        <div class="form-group">
            <label>Phone Number:</label>
            <input type="text" name="phoneNumber" required pattern="^[6789]\d{9}$" title="Phone number must start with 6, 7, 8, or 9 and be 10 digits long.">
        </div>

      <div class="form-group">
    <label>Identification:</label>
    <input type="text" name="identification" maxlength="12" pattern=".{12}" title="Identification must be exactly 12 characters" required>
</div>


        <div class="form-group">
            <label>Religion:</label>
            <select name="religion">
                <option value="">Select Religion</option>
                <option value="Hindu">Hindu</option>
                <option value="Muslim">Muslim</option>
                <option value="Christian">Christian</option>
                <option value="Sikh">Sikh</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="form-group">
            <label>Nationality:</label>
            <select name="nationality">
                <option value="">Select </option>
                <option value="Indian">INDIAN</option>
                <option value="NO">NO INDAIN</option>
                
            </select>
        </div>

        <div class="form-group">
            <label>Joining Date:</label>
            <input type="date" name="joiningDate" required>
        </div>

       <div class="form-group">
            <label>Designation:</label>
            <select name="designation" required>
                <option value="">Select Designation</option>
                <option value="Professor">Professor</option>
                <option value="Assistant Professor">Assistant Professor</option>
                <option value="Lecturer">Lecturer</option>
                <option value="Researcher">Researcher</option>
            </select>
        </div>

        <div class="form-group">
            <label>Department:</label>
            <input type="text" name="department" required>
        </div>
        
        <div class="form-group">
            <label>Courses Taught:</label>
            <input type="text" name="coursesTaught"><br>
        </div>

        <div class="form-group">
            <label>Recruit Agency:</label>
            <input type="text" name="recruitAgency">
        </div>

        <div class="form-group">
            <label>PF Number:</label>
            <input type="text" name="pfNumber">
        </div>

        <div class="form-group">
            <label>Recruitment Type:</label>
            <input type="text" name="recruitmentType">
        </div>

        <div class="form-group">
            <label>Resume Link:</label>
            <input type="text" name="resumeLink">
        </div>

        <div class="form-group">
            <label>Disability:</label>
            <select name="disability">
                <option value="">Select Disability</option>
                <option value="None">None</option>
                <option value="Visual">Visual</option>
                <option value="Hearing">Hearing</option>
                <option value="Mobility">Mobility</option>
            </select>
        </div>

        <div class="form-group">
            <label>Place of Birth:</label>
            <input type="text" name="placeOfBirth">
        </div>

        <div class="form-group">
            <label>Height:</label>
            <input type="number" step="0.01" name="height">
        </div>

        <div class="form-group">
            <label>Weight:</label>
            <input type="number" step="0.01" name="weight">
        </div>

        <div class="form-group">
            <label>Experience:</label>
            <input type="text" name="experience">
        </div>

        <div class="form-group">
            <label>Address:</label>
            <textarea name="address" required></textarea>
        </div>

        <div class="form-group">
            <label>City:</label>
            <input type="text" name="city" required>
        </div>

        <div class="form-group">
            <label>State:</label>
            <input type="text" name="state" required>
        </div>

        <div class="form-group">
            <label>Country:</label>
            <input type="text" name="country" required>
        </div>

       <div class="form-group">
    <label>Postal Code:</label>
    <input type="text" name="postalCode" required 
           pattern="^\d{6}$" 
           title="Please enter a valid 6-digit postal code">
</div>


    
<div class="form-group">
<label>Profile</label>
<input type="file" name="facultyprofileimage" required>
</div>


        <div class="submit-btn">
            <input type="submit" value="Register Faculty">
            <input type="button" value="Clear" class="clear-btn" onclick="this.form.reset();"> <!-- Added clear button -->
        </div>
        
    </form>
</div>

</body>
</html>
