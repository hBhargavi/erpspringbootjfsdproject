<%@ page import="com.klef.jfsd.springboot.Models.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Student stu = (Student) session.getAttribute("student");
    if (stu == null) {
        response.sendRedirect("sessionexpiry"); // Redirect to login if not authenticated
        return; // Prevent further processing
    }

    Long studentId = (Long) session.getAttribute("studentId");
%>
<%@ include file="studentnavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders Page</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Light background for contrast */
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
        }

        /* Center the table in the viewport */
        table {
            margin: auto;
            border-collapse: collapse;
            width: 70%; /* Increased width to 70% of the container */
            background-color: white; /* White background for the table */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Add shadow for depth */
            border-radius: 8px; /* Rounded corners */
        }

        /* Table row and cell styling */
        td {
            padding: 15px; /* Increased space inside each cell */
            text-align: left; /* Align text to the left */
        }

        /* Styling for input fields */
        .form-control {
            width: 100%; /* Full width for inputs */
            padding: 12px; /* Increased padding for inputs */
            border: 1px solid #ccc; /* Light border */
            border-radius: 4px; /* Rounded corners */
            box-sizing: border-box; /* Include padding in width */
            font-size: 16px; /* Increased font size for better readability */
        }

        /* Button container styling */
        .button-container {
            display: flex; /* Use flexbox for alignment */
            justify-content: space-between; /* Space between buttons */
            margin-top: 15px; /* Space above the button container */
        }

        /* Button styling */
        .btn {
            background-color: #000; /* Black button color */
            color: white; /* Text color */
            border: none; /* Remove default border */
            border-radius: 4px; /* Rounded corners */
            padding: 12px 20px; /* Increased padding for button */
            cursor: pointer; /* Pointer on hover */
            transition: background-color 0.3s; /* Smooth transition for hover effect */
            flex: 1; /* Allow buttons to grow equally */
            margin: 0 5px; /* Space between buttons */
            min-width: 120px; /* Minimum width for buttons */
        }

        .btn:hover {
            background-color: #555; /* Darken button on hover */
        }

        /* Clear button specific styles */
        .btn-clear {
            background-color: #ccc; /* Light gray for clear button */
            color: black; /* Black text for clear button */
        }

        .btn-clear:hover {
            background-color: #aaa; /* Darken clear button on hover */
        }

        /* Responsive design for smaller screens */
        @media (max-width: 600px) {
            table {
                width: 90%; /* Increase width on smaller screens */
            }

            .form-control {
                padding: 10px; /* Adjust padding for smaller devices */
            }

            .btn {
                padding: 10px 15px; /* Adjust button padding */
                min-width: 100px; /* Adjust minimum width for smaller screens */
            }
        }
    </style>
</head>
<body>
    <div>
        <table>
        <tr>
                <td>Year:</td>
                <td>
                    <select id="year" name="year" class="form-control" required>
                        <option value="">Select Year</option>
                        <option>2021-2022</option>
                        <option>2022-2023</option>
                        <option>2023-2024</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Semester:</td>
                <td>
                    <select id="semester" name="semester" class="form-control" required>
                        <option value="">Select Semester</option>
                        <option>odd</option>
                        <option>even</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>
                    <input type="text" name="name" id="name" class="form-control" required />
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <input type="email" name="email" id="email" class="form-control" required />
                </td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td>
                    <input type="number" name="amount" id="amount" class="form-control" required />
                </td>
            </tr>
            
            <tr>
                <td></td>
                <td>
                    <input type="hidden" name="studentId" id="studentId" value="<%= studentId %>" /> <!-- Hidden input for studentId -->
                    <div class="button-container">
                        <button id="rzp-button1" class="btn" onclick="validateAndPay()">Proceed To Pay</button>
                        <button id="clear-button" class="btn btn-clear" type="button" onclick="clearForm()">Clear</button>
                    </div>
                </td>
            </tr>
        </table>
    </div>

    <script>
        function validateAndPay() {
            // Check if all fields are filled
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const amount = document.getElementById('amount').value.trim();
            const year = document.getElementById('year').value;
            const semester = document.getElementById('semester').value;

            if (name === "" || email === "" || amount === "" || year === "" || semester === "") {
                alert("Please fill in all the fields.");
                return; // Do not proceed with payment
            }

            // Proceed to payment if validation is successful
            initiatePayment();
        }

        async function createOrder() {
            const response = await fetch("http://localhost:2004/createOrder", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    name: document.getElementById('name').value,
                    email: document.getElementById('email').value,
                    amount: document.getElementById('amount').value,
                    studentId: document.getElementById('studentId').value,
                    year: document.getElementById('year').value,
                    semester: document.getElementById('semester').value
                })
            });
            const order = await response.json();
            return order;
        }

        async function initiatePayment() {
            const order = await createOrder();

            const options = {
                "key": "rzp_test_q0u32Vj8uWTQLG", 
                "amount": order.amount,
                "currency": "INR",
                "name": "SRINIVASA RAO DUDDUKURI",
                "description": "Order for Test",
                "order_id": order.razorpayOrderId,
                "callback_url": "http://localhost:2004/paymentCallback",
                "prefill": {
                    "name": order.name,
                    "email": order.email
                },
                "theme": {
                    "color": "#339900"
                }
            };

            const rzp1 = new Razorpay(options);
            rzp1.open();
        }

        function clearForm() {
            document.getElementById('name').value = '';
            document.getElementById('email').value = '';
            document.getElementById('amount').value = '';
            document.getElementById('year').value = '';
            document.getElementById('semester').value = '';
        }
    </script>
</body>
</html>
