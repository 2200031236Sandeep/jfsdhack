<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Messages</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            margin: 0 auto;
        }
        h2 {
            text-align: center;
            color: #4CAF50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<%
    // Database connection details
    String dbUser = "root";
    String dbPassword = "sandeepsql0674";
    String dbURL = "jdbc:mysql://localhost:3306/hack1"; // Adjust database name

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Fetch all messages
        String fetchMessagesSQL = "SELECT * FROM messages";
        pst = conn.prepareStatement(fetchMessagesSQL);
        rs = pst.executeQuery();
%>
<div class="container">
    <h2>All Messages</h2>
    <table>
        <thead>
            <tr>
                <th>Message ID</th>
                <th>Patient Name</th>
                <th>Nutritionist ID</th>
                <th>Message</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <%
            if (rs.next()) {
                do {
                    int messageId = rs.getInt("message_id");
                    String patientName = rs.getString("patient_name");
                    int nutritionistId = rs.getInt("nutritionist_id");
                    String message = rs.getString("message");
                    String date = rs.getString("date");
            %>
            <tr>
                <td><%= messageId %></td>
                <td><%= patientName %></td>
                <td><%= nutritionistId %></td>
                <td><%= message %></td>
                <td><%= date %></td>
            </tr>
            <%
                } while (rs.next());
            } else {
            %>
            <tr>
                <td colspan="5">No messages found.</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</div>
<%
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>An error occurred: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
