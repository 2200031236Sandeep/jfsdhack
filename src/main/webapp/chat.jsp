<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat with Nutritionist</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            max-width: 100%;
        }
        h2 {
            text-align: center;
            color: #4CAF50;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input[type="text"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%
    // Database connection parameters
    String dbURL = "jdbc:mysql://localhost:3306/hack1";
    String dbUser = "root";
    String dbPassword = "sandeepsql0674";
    Connection connection = null;

    // Handle form submission
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String patientUsername = request.getParameter("patientUsername");
        String nutritionistUsername = request.getParameter("nutritionistUsername");
        String message = request.getParameter("message");

        if (patientUsername != null && nutritionistUsername != null && message != null &&
            !patientUsername.trim().isEmpty() &&
            !nutritionistUsername.trim().isEmpty() &&
            !message.trim().isEmpty()) {
            try {
                // Save the message to the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                String insertQuery = "INSERT INTO chat (patient_username, nutritionist_username, message, timestamp) VALUES (?, ?, ?, NOW())";
                PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
                preparedStatement.setString(1, patientUsername);
                preparedStatement.setString(2, nutritionistUsername);
                preparedStatement.setString(3, message);

                int rowsInserted = preparedStatement.executeUpdate();
                if (rowsInserted > 0) {
                    // Redirect to success page
                    response.sendRedirect("success.jsp");
                    return; // Stop further execution
                } else {
                    out.println("<p style='color:red;'>Failed to send message.</p>");
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
            }
        } else {
            out.println("<p style='color:red;'>All fields are required!</p>");
        }
    }
%>

<div class="container">
    <h2>Chat with Nutritionist</h2>
    <form action="success.jsp" method="post">
        <label for="patientUsername">Your Username:</label>
        <input type="text" id="patientUsername" name="patientUsername" placeholder="Enter your username" required>

        <label for="nutritionistUsername">Nutritionist Username:</label>
        <input type="text" id="nutritionistUsername" name="nutritionistUsername" placeholder="Enter nutritionist's username" required>

        <label for="message">Message:</label>
        <input type="text" id="message" name="message" placeholder="Type your message" required>

        <button type="submit">Send</button>
    </form>
</div>
</body>
</html>
