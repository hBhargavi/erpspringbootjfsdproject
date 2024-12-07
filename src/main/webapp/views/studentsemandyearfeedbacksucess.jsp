<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Popup Messages</title>
<style>
    /* Popup container for success message */
    .popup {
        position: fixed;
        top: 20px; /* Top of the page */
        right: 20px; /* Right side of the page */
        background-color: #000; /* Black background */
        color: #fff; /* White text */
        padding: 15px 25px;
        border-radius: 8px;
        border: 1px solid #fff;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3); /* Subtle shadow */
        font-weight: bold;
        font-size: 14px;
        z-index: 1000;
        text-align: center;
        animation: slideIn 0.5s, fadeOut 0.5s 2.5s; /* Slide in and fade out */
    }

    /* Slide-in animation */
    @keyframes slideIn {
        from {
            opacity: 0;
            transform: translateX(100%); /* Start off-screen */
        }
        to {
            opacity: 1;
            transform: translateX(0); /* Fully visible */
        }
    }

    /* Fade-out animation */
    @keyframes fadeOut {
        from {
            opacity: 1;
        }
        to {
            opacity: 0;
        }
    }

    /* Error message styling */
    .error {
        color: red;
        text-align: center;
        font-weight: bold;
        margin-bottom: 20px;
    }
</style>
</head>
<body onload="hidePopup()">

<%@ include file="studentnavbar.jsp" %>

<div>
    <!-- Error Message -->
    <c:if test="${not empty error}">
        <div class="error">
            ${error}
        </div>
    </c:if>

    <!-- Success Message -->
    <c:if test="${not empty message}">
        <div class="popup" id="successPopup">
            ${message}
        </div>
    </c:if>
</div>

<script>
    // Automatically hide the popup after 3 seconds
    function hidePopup() {
        const popup = document.getElementById('successPopup');
        if (popup) {
            setTimeout(() => {
                popup.style.display = 'none'; // Hide the popup
            }, 3000); // 3 seconds
        }
    }
</script>

</body>
</html>
