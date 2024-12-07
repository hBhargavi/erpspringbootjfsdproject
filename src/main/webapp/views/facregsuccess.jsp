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
    <title>Registration Success</title>
    <style>
        /* General page styling */
        
    </style>
</head>
<body>
   <%@ include file="adminnavbar.jsp" %>
    <!-- Animated background -->
    <div class="background-float">
        <img  
             alt="background" 
             style="width: 100%; height: 100%; opacity: 0.2; object-fit: cover;">
    </div>

    <!-- Main content container -->
    <div class="content-container">
        <h1 align="center ">Registration Successful!</h1>
        <p align="center"><c:out value="${message}"></c:out></p>
    </div>
</body>
</html>
