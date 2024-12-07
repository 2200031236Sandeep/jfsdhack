<%@ page import="java.sql.*" %>
<%@ page session="true" %>
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
        .chat-box {
            height: 300px;
            overflow-y: auto;
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }
        .message {
            margin: 10px 0;
        }
        .message p {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border-radius: 5px;
            max-width: 80%;
        }
        .message.patient p {
            background-color: #f0ad4e;
        }
        .form-container {
            display: flex;
            justify-content: space-between;
        }
        input[type="text"] {
            width: 80%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        button {
            width: 15%;
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
    </style>
</head>
<body>

<%@ page import="java.util.*" %>

<%
    String nutritionistId = request.getParameter("nutritionistId");
    String nutritionistName = request.getParameter("nutritionistName");
    String patientId = (String) session.getAttribute("patientId");

    // Create or fetch the chat conversation
    String dbURL = "jdbc:mysql://localhost:3306/hack1";
    String dbUser = "root";
    String dbPassword = "sandeepsql0674";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    
    // Fetch chat history for the patient and nutritionist
    List<String> messages = new ArrayList<>();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        String query = "SELECT message, sender FROM chat WHERE nutritionist_id = ? AND patient_id = ? ORDER BY timestamp";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, nutritionistId);
        preparedStatement.setString(2, patientId);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            String message = resultSet.getString("message");
            String sender = resultSet.getString("sender");
            messages.add(sender + ": " + message);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (resultSet != null) try { resultSet.close(); } catch (SQLException ignored) {}
        if (statement != null) try { statement.close(); } catch (SQLException ignored) {}
        if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
    }
%>

<div class="container">
    <h2>Chat with <%= nutritionistName %></h2>
    
    <div class="chat-box">
        <% for (String message : messages) { %>
            <div class="message <%= message.startsWith("Patient") ? "patient" : "nutritionist" %>">
                <p><%= message %></p>
            </div>
        <% } %>
    </div>

    <form action="chatPage.jsp" method="post" class="form-container">
        <input type="text" name="message" placeholder="Type your message..." required>
        <button type="submit">Send</button>
    </form>

<%
    // Handle the message submission
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String message = request.getParameter("message");
        if (message != null && !message.trim().isEmpty()) {
            try {
                // Insert the message into the database
                connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                String insertQuery = "INSERT INTO chat (patient_id, nutritionist_id, message, sender, timestamp) VALUES (?, ?, ?, ?, NOW())";
                PreparedStatement insertStatement = connection.prepareStatement(insertQuery);
                insertStatement.setString(1, patientId);
                insertStatement.setString(2, nutritionistId);
                insertStatement.setString(3, message);
                insertStatement.setString(4, "Patient");
                insertStatement.executeUpdate();
                
                // Refresh the page to show the new message
                response.sendRedirect("chatPage.jsp?nutritionistId=" + nutritionistId + "&nutritionistName=" + nutritionistName);
            } catch (SQLException e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (connection != null) try { connection.close(); } catch (SQLException ignored) {}
            }
        }
    }
%>

</div>

</body>
</html>
