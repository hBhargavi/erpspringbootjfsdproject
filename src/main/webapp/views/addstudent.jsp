
<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Admin adm = (Admin) session.getAttribute("admin");
if (adm == null) {
	  response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;600&display=swap');

    /* General body styling */
    body {
        font-family: 'Raleway', sans-serif;
        background-color: #f4f7fa;
        color: #333;
        margin: 0;
        padding: 0;
    }

    /* Main container */
    .container {
        max-width: 900px;
        margin: 50px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(8px);
        transition: all 0.3s ease-in-out;
    }

    /* Title styling */
    h1 {
        font-size: 28px;
        color: #212121;
        text-align: center;
        margin-bottom: 30px;
        font-weight: 600;
    }

    /* Form row (Flexbox) */
    .form-row {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 20px;
    }

    .form-group {
        flex: 1;
        min-width: 200px;
    }

    label {
        display: block;
        font-size: 14px;
        font-weight: 600;
        color: #555;
        margin-bottom: 8px;
    }

    /* Input fields */
    input[type="text"],
    input[type="email"],
    input[type="date"],
    select,
    input[type="number"] {
        width: 100%;
        padding: 12px 18px;
        border: 2px solid #ddd;
        border-radius: 6px;
        font-size: 14px;
        color: #555;
        background-color: #f9f9f9;
        transition: border-color 0.3s ease;
        box-sizing: border-box;
    }

    /* Hover effect for input fields */
    input[type="text"]:hover,
    input[type="email"]:hover,
    input[type="date"]:hover,
    select:hover,
    input[type="number"]:hover {
        border-color: #007bff;
    }

    /* Focus effect for input fields */
    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="date"]:focus,
    select:focus,
    input[type="number"]:focus {
        border-color: #0056b3;
        outline: none;
        box-shadow: 0 0 8px rgba(0, 86, 179, 0.2);
    }

    /* Submit button styling */
    input[type="submit"],
    input[type="button"] {
        background-color: #007bff;
        color: white;
        padding: 12px 18px;
        border: none;
        font-size: 16px;
        cursor: pointer;
        border-radius: 6px;
        transition: background-color 0.3s ease;
        width: 100%;
    }

    input[type="submit"]:hover,
    input[type="button"]:hover {
        background-color: #0056b3;
    }

    /* Reset button styling */
    input[type="button"] {
        background-color: #dc3545;
        margin-top: 10px;
    }

    input[type="button"]:hover {
        background-color: #c82333;
    }

    /* Additional styling for select input */
    select {
        background-color: #f9f9f9;
        padding: 12px 18px;
        border-radius: 6px;
        color: #555;
        font-size: 14px;
        cursor: pointer;
        border: 2px solid #ddd;
        transition: border-color 0.3s ease;
    }

    select:focus {
        border-color: #0056b3;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .form-row {
            flex-direction: column;
            gap: 15px;
        }
    }
</style>

</head>
<body>

<%@ include file="adminnavbar.jsp" %>

<div class="area">
 <div class="container">
    <h1>Add Student</h1>
    <form action="saveStudent" method="post">
        <div class="form-row">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required/>

                <label for="dob">Date Of Birth:</label>
                <input type="date" id="dob" name="dob" required/>

                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required/>

                <label for="contact">Contact:</label>
                <input type="text" id="contact" name="contact" required/>

                <label for="course">Course:</label>
                <input type="text" id="course" name="course" required/>

                <label for="courseBranch">Branch:</label>
                <input type="text" id="courseBranch" name="courseBranch" required/>
            </div>

            <div class="form-group">
                <label for="enrollmentDate">Enrollment Date:</label>
                <input type="date" id="enrollmentDate" name="enrollmentDate" required/>

                <label for="parentName">Parent Name:</label>
                <input type="text" id="parentName" name="parentName" required/>

                <label for="parentContact">Parent Contact:</label>
                <input type="text" id="parentContact" name="parentContact" required/>

                <label for="profilePhoto">Profile Photo:</label>
                <input type="file" id="profilePhoto" name="profilePhoto" accept="image/*" onchange="previewImage(event)"/>
                
                <!-- Password Input -->
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="klu" readonly required/>
            </div>
        </div>
        <input type="submit" value="Add Student"/>
        <input type="button" value="Cancel" onclick="window.location.href='addstu'"/>
    </form>
</div>


</div>

<script>
    document.querySelectorAll('.submenu-toggle').forEach(item => {
        item.addEventListener('click', function() {
            this.nextElementSibling.classList.toggle('submenu');
        });
    });
</script>
</body>
</html>
