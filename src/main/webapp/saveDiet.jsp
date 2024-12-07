<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Check if user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("patientLogin.html");
        return;
    }

    // Retrieve form data
    String mealType = request.getParameter("mealType");
    String foodItems = request.getParameter("foodItems");
    int calories = Integer.parseInt(request.getParameter("calories"));
    int protein = Integer.parseInt(request.getParameter("protein"));
    int carbs = Integer.parseInt(request.getParameter("carbs"));
    int fats = Integer.parseInt(request.getParameter("fats"));

    // Database connection variables
    String dbURL = "jdbc:mysql://localhost:3306/hack1";
    String dbUser = "root";
    String dbPassword = "sandeepsql0674";

    try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         PreparedStatement pstmt = con.prepareStatement(
             "INSERT INTO daily_diet (username, meal_type, food_items, calories, protein, carbs, fats) VALUES (?, ?, ?, ?, ?, ?, ?)")) {

        Class.forName("com.mysql.cj.jdbc.Driver");

        // Set parameters for the SQL insert
        pstmt.setString(1, username);
        pstmt.setString(2, mealType);
        pstmt.setString(3, foodItems);
        pstmt.setInt(4, calories);
        pstmt.setInt(5, protein);
        pstmt.setInt(6, carbs);
        pstmt.setInt(7, fats);

        // Execute the insert
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            out.println("<p>Diet entry saved successfully!</p>");
            out.println("<a href='healthDashboard.jsp'>Back to Dashboard</a>");
        } else {
            out.println("<p>Failed to save diet entry. Please try again.</p>");
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diet Entry Confirmation</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            flex-direction: column;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }

        h2 {
            color: #28a745;
            margin-bottom: 20px;
            font-size: 24px;
            animation: fadeIn 1s ease-in-out;
        }

        p {
            font-size: 18px;
            color: #333;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #ffffff;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }
    </style>
</head>
<body>


</body>
</html>
