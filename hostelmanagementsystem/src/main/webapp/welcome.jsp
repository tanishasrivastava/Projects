<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WELCOME TO THE ADMINISTRATOR PAGE</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ensures the container takes at least the full height of the viewport */
            background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Hostel_Dormitory.jpg/440px-Hostel_Dormitory.jpg'); /* Replace 'path/to/your/image.jpg' with the actual path to your image */
            background-size: cover; /* Ensures the background image covers the entire container */
            background-position: center; /* Centers the background image */
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            padding: 20px;
            background-color: #333;
            color: #fff;
            margin-bottom: 0;
        }

        nav {
            background-color: #555;
            overflow: hidden;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            display: flex;
            justify-content: center;
        }

        li {
            margin: 0 10px;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            background-color: #4CAF50;
        }
    </style>
</head>
<body>
    <h2>WELCOME TO THE ADMINISTRATOR PAGE</h2>
    <nav>
        <ul>
            <li><a href="home.jsp">HOMEPAGE</a></li>
            <li><a href="logout.jsp">LOGOUT</a></li>
            <li><a href="userDetails.jsp">STUDENT DETAILS</a></li>
            <li><a href="showHostelStaffMembers.html">STAFF DETAILS</a></li>
        </ul>
    </nav>
</body>
</html>
