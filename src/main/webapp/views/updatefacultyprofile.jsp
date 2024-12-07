<%@page import="com.klef.jfsd.springboot.Models.Faculty"%>
<%@ page import="com.klef.jfsd.springboot.Models.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Faculty f = (Faculty) session.getAttribute("faculty");
if (f == null) 
{
    response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
    return; // Prevent further processing
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
            background-color: #f0f0f0; /* Optional: Light gray background for contrast */
        }

        .form-container {
            background: white;
            border-radius: 12px; /* Rounded corners */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px; /* More padding for a spacious look */
            width: 400px; /* Wider form */
            text-align: center;
        }

        .profile-image-container {
            text-align: center;
            margin-bottom: -20px; /* Adjust image position relative to form */
        }

        .profile-image {
            width: 150px; /* Larger image */
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            border: 4px solid black; /* Black border */
            transition: transform 0.3s ease; /* Scale effect on hover */
        }

        .profile-image:hover {
            transform: scale(1.05);
        }

        table {
            width: 100%;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="password"],
        input[type="number"] {
            width: calc(100% - 40px);
            padding: 12px; /* Increased padding */
            border: 1px solid #b2dfdb; /* Light teal border */
            border-radius: 6px; /* Rounded corners */
            margin-bottom: 20px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus {
            border-color: #00796b; /* Teal border on focus */
            outline: none; /* Remove default outline */
        }

        .button-container {
            text-align: center;
            margin-top: 10px;
        }

        .button-container input {
            background-color: black; /* Black background */
            border: none;
            color: white;
            padding: 12px 20px; /* Increased padding */
            cursor: pointer;
            border-radius: 6px;
            font-weight: bold; /* Bold text */
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .button-container input:hover {
            background-color: #333; /* Darker black on hover */
            transform: translateY(-2px);
        }

        .eye-icon {
            cursor: pointer;
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            color: #666;
            font-size: 1.4em;
            z-index: 1;
        }

        h2 {
            color: black; /* Teal heading */
            margin-bottom: 20px;
            font-weight: normal; /* Normal weight */
        }
    </style>
    <script>
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById('fpwd');
            const eyeIcon = document.getElementById('eyeIcon');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                eyeIcon.textContent = '👁️';
            } else {
                passwordInput.type = 'password';
                eyeIcon.textContent = '👁️‍🗨️';
            }
        }
    </script>
</head>
<body>
    <%@ include file="facultynavbar.jsp" %>

    <div class="profile-image-container">
        <img src="displayfacultyprofile?id=${faculty.id}" alt="Faculty Image" class="profile-image">
    </div>

    <div class="form-container">
        <h2>Update Profile</h2>
        <form method="post" action="updatefacprofile">
            <table>
                <tr>
                    <td><label for="fid">Enter Id</label></td>
                    <td><input type="number" id="fid" name="fid" readonly="readonly" value="<%= f.getId() %>" required/></td>
                </tr>
                <tr>
    <td><label for="fpwd">Enter Password</label></td>
    <td>
        <div style="position: relative;">
            <input type="password" id="fpwd" name="fpwd" value="<%= f.getPassword() %>" required
                   pattern=".{8}" title="Password must be exactly 8 characters long" style="padding-right: 30px;">
            <span class="eye-icon" id="eyeIcon" onclick="togglePasswordVisibility()" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
                👁️
            </span>
        </div>
    </td>
</tr>
            </table>
            <div class="button-container">
                <input type="submit" value="Update"/>
            </div>
        </form>
    </div>
</body>
</html>



