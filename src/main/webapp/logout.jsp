<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }

        .message {
            text-align: center;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .message h2 {
            color: #4CAF50;
        }

        .message a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .message a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    // Invalidate the session
    HttpSession userSession = request.getSession(false); // Changed variable name to avoid conflict
    if (userSession != null) {
        userSession.invalidate(); // Invalidate the current session
    }
%>

<div class="message">
    <h2>You have successfully logged out!</h2>
    <a href="login.jsp">Go to Login Page</a> <!-- Redirect to your login page -->
</div>

</body>
</html>
