<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.util.Arrays" %>

<%
    Cookie[] cookies = request.getCookies();

    String firstName = "";
    String lastName = "";
    String email = "";

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            switch (cookie.getName()) {
                case "firstName":
                    firstName = cookie.getValue();
                    break;
                case "lastName":
                    lastName = cookie.getValue();
                    break;
                case "email":
                    email = cookie.getValue();
                    break;
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        <!-- Your existing styles here -->
    </style>
</head>
<body>
    <div class="container">
        <h2>Registration Successful!</h2>
        <p>Thank you for registering.</p>
        <p>Name: <%= firstName %> <%= lastName %></p>
        <p>Email: <%= email %></p>
    </div>
</body>
</html>
