<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Login</title>
    <style>
        body {
           display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #e6f3fa; /* Light background color */
            margin: 0;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }
        h2 {
            margin-bottom: 20px;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
        .message {
            margin: 20px 0;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>admin Login</h2>
<%

    // Retrieve the email and password from the request parameters
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Define the admin credentials
    String adminEmail = "admin@gmail.com";
    String adminPassword = "pass2";

    // Check if email and password are not null
    if (email != null && password != null) {
        // Compare email and password with the admin credentials
        if (email.equals(adminEmail) && password.equals(adminPassword)) {
            out.println("<p>Login successful! <a href='admindash.jsp'>Go to Dashboard</a></p>");
        } else {
            out.println("<p>Invalid email or password. Please try again. <a href='adminlog.html'>Back to Login</a></p>");
        }
    } else {
        out.println("<p>Email or password is missing. Please fill the form correctly. <a href='adminlog.html'>Back to Login</a></p>");
    }
%>
</div>

</body>
</html>
