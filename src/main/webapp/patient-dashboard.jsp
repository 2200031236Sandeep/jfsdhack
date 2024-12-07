<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
        }
        .header {
            background-color: #2c89c5;
            padding: 15px;
            color: white;
            text-align: center;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .profile-link {
            float: right;
            color: #2c89c5;
            font-weight: bold;
            text-decoration: none;
            margin-top: -30px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .profile-form label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        .profile-form input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .submit-btn {
            background-color: #2c89c5;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="header">
    Patient Dashboard
    <a href="#profileSection" class="profile-link">My Profile</a>
</div>

<div class="container" id="profileSection">
    <h2>Update Profile</h2>
    <form action="update-profile.jsp" method="POST" class="profile-form">
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required>

        <label for="gender">Gender:</label>
        <input type="text" id="gender" name="gender" required>

        <label for="weight">Weight (kg):</label>
        <input type="number" id="weight" name="weight" required>

        <label for="height">Height (cm):</label>
        <input type="number" id="height" name="height" required>

        <label for="deficiency">Nutritional Deficiency:</label>
        <input type="text" id="deficiency" name="deficiency" placeholder="e.g., Iron, Vitamin D">

        <button type="submit" class="submit-btn">Save Changes</button>
    </form>
</div>

</body>
</html>
