<%@ page session="true" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
    // Check if the user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("patientLogin.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .navbar {
            width: 100%;
            background-color: #2c89c5;
            padding: 15px;
            display: flex;
            justify-content: flex-end;
            color: white;
        }
        .navbar a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            font-weight: bold;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
        .container {
            padding: 40px;
            text-align: center;
        }
        h1 {
            color: #2c89c5;
        }
        .option-card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            cursor: pointer;
            transition: transform 0.2s;
        }
        .option-card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="dailyDiet.jsp">Daily Diet</a>
    <a href="contactNutritionist.jsp">Contact Nutritionist</a>
    <a href="myProfile.jsp">My Profile</a>
</div>

<div class="container">
    <h1>Welcome to Your Health Dashboard, <%= username %>!</h1>
    <div class="option-card" onclick="window.location.href='dailyDiet.jsp'">
        <h2>Daily Diet</h2>
        <p>View and manage your daily diet plan.</p>
    </div>
    <div class="option-card" onclick="window.location.href='contactNutritionist.jsp'">
        <h2>Contact Nutritionist</h2>
        <p>Reach out to your assigned nutritionist for advice and guidance.</p>
    </div>
    <div class="option-card" onclick="window.location.href='myProfile.jsp'">
        <h2>My Profile</h2>
        <p>View and update your profile details.</p>
    </div>
</div>

</body>
</html>
