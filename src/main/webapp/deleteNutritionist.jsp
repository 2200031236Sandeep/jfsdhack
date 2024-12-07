<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Nutritionist</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
        }
        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            max-width: 400px;
            margin: auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .form-container h2 {
            text-align: center;
            color: #333;
        }
        .form-container label {
            font-size: 1rem;
            color: #555;
        }
        .form-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            background-color: #f44336;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
        }
        .form-container button:hover {
            background-color: #d32f2f;
        }
        .account-options {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .account-option {
            text-align: center;
            width: 120px;
            opacity: 0; /* Hidden initially for fade-in */
            animation: fadeIn 1s forwards, bounce 0.6s ease-out 1s; /* Fade in and bounce */
        }
        .message {
            text-align: center;
            margin-top: 20px;
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Delete Nutritionist by Username</h2>
        <form method="post">
            <label for="username">Enter Nutritionist Username:</label>
            <input type="text" id="username" name="username" required>
            <button type="submit">Delete Nutritionist</button>
        </form>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String dbURL = "jdbc:mysql://localhost:3306/hack1";
                String dbUser = "root";
                String dbPassword = "sandeepsql0674";
                String username = request.getParameter("username");

                Connection connection = null;
                PreparedStatement preparedStatement = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    // SQL query to delete nutritionist by username
                    String deleteQuery = "DELETE FROM nutritionists WHERE username = ?";
                    preparedStatement = connection.prepareStatement(deleteQuery);
                    preparedStatement.setString(1, username);

                    int rowsAffected = preparedStatement.executeUpdate();

                    if (rowsAffected > 0) {
                        out.println("<p class='message' style='color: green;'>Nutritionist successfully deleted!</p>");
                    } else {
                        out.println("<p class='message' style='color: red;'>Username not found.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p class='message' style='color: red;'>Error: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                } finally {
                    if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException ignored) {}
                    if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
                }
            }
        %>
    </div>
</body>
</html>
