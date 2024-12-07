<%@ page import="com.klef.jfsd.springboot.Models.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Admin adm = (Admin) session.getAttribute("admin");
if (adm == null)
{
    response.sendRedirect("sessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white; /* Dark background */
            color: #fff; /* White text */
            margin: 0;
            padding: 0;
            height: 100vh; /* Full height */
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .content {
            background-color: grey; /* White content area */
            color: #333; /* Dark text for content */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 300px;
        }

        h1 {
            font-size: 1.5rem;
            color: #333;
        }

        p {
            font-size: 1rem;
            color: #333;
        }

        /* Responsive design for smaller screens */
        @media screen and (max-width: 480px) {
            .content {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<%@ include file="adminnavbar.jsp" %>

<div class="content">
    <h1>Success</h1>
    
</div>

</body>
</html>
