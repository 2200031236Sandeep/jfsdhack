<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Nutritionist</title>
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
            width: 600px;
        }
        h2 {
            margin-bottom: 20px;
            color: #4CAF50;
        }
        .nutritionist-info {
            margin: 20px 0;
            font-size: 18px;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        .nutritionist-list {
            margin-top: 20px;
            text-align: left;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Contact Nutritionists</h2>

    <% 
        // Database connection setup
        String dbURL = "jdbc:mysql://localhost:3306/hack1";
        String dbUser = "root";
        String dbPassword = "sandeepsql0674";
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            statement = connection.createStatement();
            String query = "SELECT * FROM nutritionists"; // Get all nutritionists
            resultSet = statement.executeQuery(query);
            
            // Check if nutritionists are available
            if (!resultSet.isBeforeFirst()) {
                out.println("<p>No nutritionists available at the moment.</p>");
            } else {
    %>
                <div class="nutritionist-list">
                    <% 
                        while (resultSet.next()) {
                            String nutritionistId = resultSet.getString("nutritionist_id");
                            String nutritionistName = resultSet.getString("name");
                            String nutritionistEmail = resultSet.getString("email");
                            int nutritionistExperience = resultSet.getInt("experience");
                    %>
                        <div class="nutritionist-info">
                            <p><strong>Name:</strong> <%= nutritionistName %></p>
                            <p><strong>Email:</strong> <%= nutritionistEmail %></p>
                            <p><strong>Experience:</strong> <%= nutritionistExperience %> years</p>
                            <form action="chat.jsp" method="post">
                                <input type="hidden" name="nutritionistId" value="<%= nutritionistId %>">
                                <input type="hidden" name="nutritionistName" value="<%= nutritionistName %>">
                                <button type="submit">Contact <%= nutritionistName %></button>
                            </form>
                        </div>
                    <% 
                        }
                    %>
                </div>
            <% 
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if (resultSet != null) try { resultSet.close(); } catch (SQLException ignored) {}
            if (statement != null) try { statement.close(); } catch (SQLException ignored) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
        }
    %>
</div>

</body>
</html>
