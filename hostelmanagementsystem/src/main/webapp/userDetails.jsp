<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #d0b4de
             ; /* Light gray background */
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            padding: 20px;
            background-color: #333;
            color: #fff;
            margin-bottom: 0;
        }

        select {
            display: block;
            margin: 20px auto;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            color: #333;
        }

        select option {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h2>USER DETAILS</h2>
    <select onchange="location = this.value;">
        <option value="#" selected>SELECT AN OPTION</option>
        <option value="showUsers.html">SHOW CURRENT STUDENTS</option>
        <option value="registration.html">REGISTER (NEW STUDENT)</option>
    </select>
</body>
</html>
