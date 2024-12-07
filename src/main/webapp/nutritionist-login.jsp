<%@ page import="java.sql.*, java.io.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritionist Login</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #e6f3fa;
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
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>

<%
    // Fetching login data from the form
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String errorMessage = "";
    
    if (email != null && password != null) {
        try {
            // Database connection
            String dbURL = "jdbc:mysql://localhost:3306/hack1";
            String dbUser = "root";
            String dbPassword = "sandeepsql0674";
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL query to validate login credentials
            String sql = "SELECT * FROM nutritionists WHERE email = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Valid login
                session.setAttribute("nutritionist_id", resultSet.getInt("nutritionist_id"));
                session.setAttribute("nutritionist_name", resultSet.getString("name"));
                response.sendRedirect("nutritionist-dashboard.jsp"); // Redirect to the dashboard
            } else {
                // Invalid login
                errorMessage = "Invalid email or password. Please try again.";
            }

            conn.close();
        } catch (SQLException e) {
            errorMessage = "Error connecting to the database: " + e.getMessage();
        }
    }
%>

<div class="container">
    <h2>Nutritionist Login</h2>
    <form action="nutritionist-login.jsp" method="post">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <button type="submit">Login</button>
    </form>
    <% if (!errorMessage.isEmpty()) { %>
        <p class="error"><%= errorMessage %></p>
    <% } %>
</div>

</body>
</html>
