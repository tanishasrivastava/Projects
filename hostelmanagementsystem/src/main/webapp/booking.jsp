<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel Booking</title>
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

        label {
            display: block;
            margin-top: 10px;
            margin-bottom: 8px;
            color: #4CAF50;
        }

        .checkbox-group {
            margin-bottom: 16px;
        }

        .checkbox-group label {
            display: block;
            margin-bottom: 8px;
        }

        input[type="checkbox"] {
            margin-right: 8px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        .note {
            font-size: 14px;
            color: #777;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Hostel Booking</h2>
        <form action="generateBill.jsp" method="post">
            <div class="form-group">
                <label for="roomType">Choose Room Type:</label>
                <select id="roomType" name="roomType" required>
                    <option value="1">Single Room</option>
                    <option value="2">Double Room</option>
                    <option value="3">Dormitory</option>
                </select>
            </div>

            <div class="checkbox-group">
                <label>Select Additional Services:</label>
                <label><input type="checkbox" name="services" value="Wi-Fi"> Wi-Fi - Rs.100</label>
                <label><input type="checkbox" name="services" value="Breakfast"> Breakfast - Rs.150</label>
                <label><input type="checkbox" name="services" value="Laundry"> Laundry - Rs.200</label>
                <!-- Add more services with their respective costs from the About Us page -->
            </div>

            <button type="submit">Generate Bill</button>

            <p class="note">Note: Prices are in Indian Rupees (INR).</p>
        </form>
    </div>
</body>
</html>
