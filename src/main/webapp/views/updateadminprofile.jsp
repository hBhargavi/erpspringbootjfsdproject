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
<html>
<head>
    <title>Update Profile</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 300px;
            text-align: center;
        }

        table {
            width: 100%;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 40px); /* Adjust width to accommodate icon */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            transition: box-shadow 0.3s ease;
            display: inline-block; /* Keep inline for the icon */
            position: relative; /* To position the icon */
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #66afe9;
            box-shadow: 0 0 5px rgba(102, 175, 233, .5);
            outline: none;
        }

        .button-container input {
            background-color: black; /* Set button color to black */
            border: none;
            color: white;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .button-container input:hover {
            background-color: #333; /* Darker shade on hover */
            transform: translateY(-2px);
        }

        .eye-icon {
            cursor: pointer;
            position: absolute; /* Use absolute positioning */
            top: 50%; /* Center vertically */
            right: 10px; /* Space from right, adjust for better alignment */
            transform: translateY(-50%); /* Adjust to vertically center */
            color: #666;
            font-size: 1.2em; /* Adjust size as needed */
            z-index: 1; /* Ensure the icon is above the input */
        }

        h4 {
            color: red;
            text-align: center; /* Center the message */
        }

        h2 {
            text-align: center; /* Center the heading */
            margin-bottom: 20px; /* Add space below the heading */
            color: #333; /* Change heading color if needed */
        }
    </style>
    <script>
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById('apwd');
            const eyeIcon = document.getElementById('eyeIcon');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                eyeIcon.textContent = '👁️'; // Change icon to open eye
            } else {
                passwordInput.type = 'password';
                eyeIcon.textContent = '👁️‍🗨️'; // Change icon to closed eye
            }
        }
    </script>
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
  
   

   
   
    <div class="form-container">
        <form method="post" action="updateadprofile">
            <table>
                <tr>
                    <td><label for="aname">Enter Name</label></td>
                    <td><input type="text" id="aname" name="aname" readonly="readonly" value="<%= adm.getUsername() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="apwd">Enter Password</label></td>
                    <td>
                        <div style="position: relative;">
                            <input type="password" id="apwd" name="apwd" value="<%= adm.getPassword() %>" required/>
                            <span class="eye-icon" id="eyeIcon" onclick="togglePasswordVisibility()">👁️‍🗨️</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Update"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
