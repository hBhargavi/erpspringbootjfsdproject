<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Registration Success</title>
    <style>
        /* Styling for the popup message */
        .popup-message {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: black; /* Black background for contrast */
            color: white; /* White text for readability */
            padding: 15px;
            border-radius: 5px;
            border: 1px solid white; /* Optional: White border for a sharper look */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            font-size: 16px;
            display: none; /* Initially hidden */
            z-index: 1000; /* Ensures it appears above other elements */
        }
    </style>
</head>
<body>
    <%@ include file="studentnavbar.jsp" %>

    <!-- Popup Message -->
    <div id="popupMessage" class="popup-message">
        ${message}
    </div>

    <script>
        // Show the popup message
        const popupMessage = document.getElementById('popupMessage');
        popupMessage.style.display = 'block';

        // Hide the popup after 3 seconds
        setTimeout(() => {
            popupMessage.style.display = 'none';
        }, 3000);
    </script>
</body>
</html>
