<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LOGIN PAGE</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        div {
            text-align: center;
            background-color: #4CAF50;
            color: #fff;
            padding: 15px;
            border-bottom: 5px solid #1a1a1a;
        }

        h1 {
            margin: 0;
            font-size: 2em;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            margin: 0 auto;
        }

        td {
            padding: 8px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
            border: none;
            border-radius: 4px;
            padding: 10px;
            font-size: 16px;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div>
        <h1>User Login</h1>
    </div>

    <form action="LoginServlet" method="post">
        <table>
            <tr>
                <td>Enter Name:</td>
                <td><input type="text" name="txtName"></td>
            </tr>
            <tr>
                <td>Enter Password:</td>
                <td><input type="password" name="txtPwd"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Login"></td>
                <td><input type="reset"></td>
            </tr>
        </table>
    </form>
</body>
</html>
