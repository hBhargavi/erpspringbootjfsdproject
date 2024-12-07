<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Failed</title>
    <style>
        /* Styling for the error popup message */
        .popup-error {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #333; /* Black background for the error */
            color: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            font-size: 16px;
            display: none; /* Initially hidden */
            z-index: 1000; /* Ensures it appears above other elements */
        }
    </style>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %>

    <!-- Popup Error Message -->
    <div id="popupError" class="popup-error">
        <!-- Display the error message using JSTL -->
        <c:out value="${error}" />
        <%= request.getAttribute("error") %>
        
    </div>

    <!-- Link to try again -->
    <a href="/register?studentId=${studentId}">Try Again</a>

    <script>
        // Show the popup error message only if the 'error' message is not empty
        const popupError = document.getElementById('popupError');
        const errorMessage = popupError.textContent.trim();

        if (errorMessage !== "") {
            popupError.style.display = 'block';

            // Hide the popup after 3 seconds
            setTimeout(() => {
                popupError.style.display = 'none';
            }, 3000);
        }
    </script>
</body>
</html>
