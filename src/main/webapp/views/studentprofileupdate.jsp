<%@ page import="com.klef.jfsd.springboot.Models.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
Student stu = (Student) session.getAttribute("student");
if (stu == null) {
    response.sendRedirect("login");
    return;
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
            font-family: 'Arial', sans-serif;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
            box-sizing: border-box;
        }

        .form-container {
            background:light-black;
            border-radius: 12px;
            box-shadow: 8px 8px 15px rgba(0, 0, 0, 0.2), -8px -8px 15px rgba(255, 255, 255, 0.5);
            padding: 40px 30px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 12px 12px 20px rgba(0, 0, 0, 0.25), -12px -12px 20px rgba(255, 255, 255, 0.6);
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 22px;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        td {
            padding: 8px;
            text-align: left;
            font-size: 14px;
        }

        label {
            font-size: 14px;
            color: #555;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 16px;
            font-size: 14px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            box-shadow: inset 2px 2px 5px rgba(0, 0, 0, 0.1), inset -2px -2px 5px rgba(255, 255, 255, 0.7);
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus {
            border-color: #66afe9;
            box-shadow: 0 0 8px rgba(102, 175, 233, 0.5);
            outline: none;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .button-container input {
            background: linear-gradient(145deg, #333, #444);
            border: none;
            color: white;
            padding: 12px 25px;
            cursor: pointer;
            border-radius: 8px;
            font-size: 14px;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2), -4px -4px 8px rgba(255, 255, 255, 0.4);
        }

        .button-container input:hover {
            background: linear-gradient(145deg, #444, #555);
            transform: translateY(-3px);
            box-shadow: 6px 6px 12px rgba(0, 0, 0, 0.25), -6px -6px 12px rgba(255, 255, 255, 0.6);
        }

        .eye-icon {
            cursor: pointer;
            position: absolute;
            top: 50%;
            right: 20px;
            transform: translateY(-50%);
            color: #888;
            font-size: 1.3em;
        }

        .image-container {
            position: absolute;
            top: -60px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 100px;
            border-radius: 50%;
            overflow: hidden;
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.15), -4px -4px 8px rgba(255, 255, 255, 0.4);
            border: 3px solid #fff;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %>
    <div class="form-container">
        <h2>Update Profile</h2>

        <div class="image-container">
            <img src="displaystudentprofile?id=<%= stu.getId() %>" alt="Profile Picture">
        </div>

        <form method="post" action="updatestuprofile">
            <table>
                <tr>
                    <td><label for="sid">Student ID</label></td>
                    <td>
                        <input type="number" id="sid" name="sid" readonly="readonly" value="<%= stu.getId() %>" required/>
                    </td>
                </tr>
                <tr>
                    <td><label for="spwd">Password</label></td>
                    <td>
                        <div style="position: relative;">
                            <input type="password" id="spwd" name="spwd" value="<%= stu.getPassword() %>" required
                             pattern=".{8}" title="Password must be exactly 8 characters long" style="padding-right: 30px;"/>
                            <span class="eye-icon" id="eyeIcon" onclick="togglePasswordVisibility()">👁️</span>
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

    <script>
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById('spwd');
            const eyeIcon = document.getElementById('eyeIcon');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                eyeIcon.textContent = '🙈'; // Closed eye icon
            } else {
                passwordInput.type = 'password';
                eyeIcon.textContent = '👁️'; // Open eye icon
            }
        }
    </script>
</body>
</html>
