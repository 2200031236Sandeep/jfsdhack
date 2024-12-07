<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Database connection setup
    String dbURL = "jdbc:mysql://localhost:3306/hack1";
    String dbUser = "root";
    String dbPassword = "sandeepsql0674";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    int patientCount = 0;
    int nutritionistCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        statement = connection.createStatement();

        // Query to get patient count
        resultSet = statement.executeQuery("SELECT COUNT(*) AS count FROM patients");
        if (resultSet.next()) {
            patientCount = resultSet.getInt("count");
        }

        // Query to get nutritionist count
        resultSet = statement.executeQuery("SELECT COUNT(*) AS count FROM nutritionists");
        if (resultSet.next()) {
            nutritionistCount = resultSet.getInt("count");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (resultSet != null) try { resultSet.close(); } catch (SQLException ignored) {}
        if (statement != null) try { statement.close(); } catch (SQLException ignored) {}
        if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - DietPro</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            color: #333;
        }
        header {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
        header h1 {
            margin: 0;
            font-size: 2rem;
        }
        .container {
            text-align: center;
            padding: 50px 20px;
        }
        .option-card {
            display: inline-block;
            width: 220px;
            margin: 20px;
            padding: 30px;
            background: linear-gradient(135deg, #f093fb, #f5576c);
            color: white;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease-in-out;
            position: relative;
            overflow: hidden;
            transform: translateY(0);
            animation: slideIn 0.7s ease-in-out;
        }
        .option-card:hover {
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.3);
            transform: translateY(-10px);
        }
        .option-card::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.1);
            z-index: 0;
            opacity: 0;
            transition: all 0.3s ease-in-out;
        }
        .option-card:hover::after {
            opacity: 1;
        }
        .option-card h3 {
            margin: 10px 0;
            font-size: 1.4rem;
            position: relative;
            z-index: 1;
        }
        .option-card p {
            font-size: 1.2rem;
            margin: 15px 0;
            position: relative;
            z-index: 1;
        }
        .option-card a {
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 1rem;
            position: relative;
            z-index: 1;
            transition: all 0.3s ease-in-out;
        }
        .option-card a:hover {
            color: #ffd700;
            text-decoration: underline;
        }
        footer {
            margin-top: 30px;
            text-align: center;
            color: #fff;
            font-size: 0.9rem;
        }

        /* Animations */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
    </header>
    <div class="container">
        <!-- Patient Count Card -->
        <div class="option-card">
            <h3>Patients</h3>
            <p>Total: <%= patientCount %></p>
            <a href="PatientDetails.html">View Patients</a><br>
            <a href="deletePatient.jsp">Delete Patient</a>
        </div>

        <!-- Nutritionist Count Card -->
        <div class="option-card">
            <h3>Nutritionists</h3>
            <p>Total: <%= nutritionistCount %></p>
            <a href="viewNutritionists.jsp">View Nutritionists</a><br>
            <a href="deleteNutritionist.jsp">Delete Nutritionist</a>
        </div>
    </div>
    <footer>
        <p>© 2024 DietPro Admin Dashboard</p>
    </footer>
</body>
</html>
