<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Ensure the user is logged in
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
    <title>Daily Diet</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            background-color: #28a745;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Daily Diet Entry</h2>
    <form action="saveDiet.jsp" method="post">
        <div class="form-group">
            <label for="mealType">Meal Type (e.g., Breakfast, Lunch, Dinner):</label>
            <input type="text" id="mealType" name="mealType" required>
        </div>
        <div class="form-group">
            <label for="foodItems">Food Items (comma-separated):</label>
            <input type="text" id="foodItems" name="foodItems" required>
        </div>
        <div class="form-group">
            <label for="calories">Total Calories:</label>
            <input type="number" id="calories" name="calories" required>
        </div>
        <div class="form-group">
            <label for="protein">Protein (g):</label>
            <input type="number" id="protein" name="protein" required>
        </div>
        <div class="form-group">
            <label for="carbs">Carbohydrates (g):</label>
            <input type="number" id="carbs" name="carbs" required>
        </div>
        <div class="form-group">
            <label for="fats">Fats (g):</label>
            <input type="number" id="fats" name="fats" required>
        </div>
        <button type="submit">Save Diet Entry</button>
    </form>
</div>

</body>
</html>
