<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Retrieve selected room type and additional services from the request
    String roomType = request.getParameter("roomType");
    String[] selectedServices = request.getParameterValues("services");

    // Define the costs for each room type
    double roomCost = 0;
    if (roomType != null) {
        switch (roomType) {
            case "1":
                roomCost = 500.0;
                break;
            case "2":
                roomCost = 600.0;
                break;
            case "3":
                roomCost = 400.0;
                break;
            // Add more room types if needed
        }
    }

    // Define the costs for additional services
    double servicesCost = 0;
    if (selectedServices != null) {
        for (String service : selectedServices) {
            // Splitting service into parts using hyphen as the delimiter
            String[] serviceParts = service.split("-");
            if (serviceParts.length == 2) {
                try {
                    // Attempt to parse the cost as a double
                    servicesCost += Double.parseDouble(serviceParts[1]);
                } catch (NumberFormatException e) {
                    // Handle the case where parsing fails (e.g., invalid format)
                    e.printStackTrace();
                }
            }
        }
    }

    // Calculate the total cost
    double totalCost = roomCost + servicesCost;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Bill</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #4CAF50;
            text-align: center;
        }

        .bill-summary {
            margin-top: 20px;
        }

        .total-cost {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .payment-options {
            margin-top: 20px;
        }

        .payment-option {
            margin-bottom: 10px;
        }

        .payment-option label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .payment-option input {
            margin-right: 5px;
        }

        /* Added styles for the link to return to the homepage */
        .return-home-link {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Generated Bill</h2>

        <div class="bill-summary">
            <p>Selected Room Type Cost: Rs. <%= roomCost %></p>
            <p>Selected Services Cost: Rs. <%= servicesCost %></p>
            <p class="total-cost">Total Cost: Rs. <%= totalCost %></p>
        </div>

        <!-- New div for payment options -->
        <div class="payment-options">
            <h3>Payment Options</h3>

            <div class="payment-option">
                <label for="googlePay">Google Pay:</label>
                <input type="text" id="googlePay" name="googlePay" placeholder="Google Pay ID">
            </div>

            <div class="payment-option">
                <label for="netBanking">Net Banking:</label>
                <input type="text" id="netBanking" name="netBanking" placeholder="Bank Account Number">
            </div>
        </div>

        <!-- Link to return to the homepage -->
        <a href="homepage.html" class="return-home-link">Return to Homepage</a>
    </div>
</body>
</html>
