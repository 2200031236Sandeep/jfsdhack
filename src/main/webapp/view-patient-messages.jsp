<%@ page import="java.sql.*, java.io.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Patient Messages</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            overflow-x: auto;
        }
        h2 {
            color: #4CAF50;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    // Fetch the nutritionist ID from the session and ensure it's not null
    Integer nutritionistId = (Integer) session.getAttribute("nutritionistId");
    if (nutritionistId == null) {
        
    }

    // Database connection details
    String dbUser = "root";
    String dbPassword = "sandeepsql0674";
    String dbURL = "jdbc:mysql://localhost:3306/hack1"; // Adjust the DB name

    try {
        // Load and register the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection to the database
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL query to get patient messages for the logged-in nutritionist
        String sql = "SELECT pm.patient_name, pm.subject, pm.message, pm.timestamp FROM patient_messages pm WHERE pm.nutritionist_id = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, nutritionistId);

        // Execute the query and fetch the messages
        ResultSet rs = pst.executeQuery();
%>

<div class="container">
    <h2>Patient Messages</h2>
    
    <% if (rs.next()) { %>
        <table>
            <thead>
                <tr>
                    <th>Patient Name</th>
                    <th>Subject</th>
                    <th>Message</th>
                    <th>Timestamp</th>
                </tr>
            </thead>
            <tbody>
                <%
                // Reset the cursor to the start for iterating through all rows
                rs.beforeFirst();
                while (rs.next()) {
                    String patientName = rs.getString("patient_name");
                    String subject = rs.getString("subject");
                    String message = rs.getString("message");
                    Timestamp timestamp = rs.getTimestamp("timestamp");
                %>
                    <tr>
                        <td><%= patientName %></td>
                        <td><%= subject %></td>
                        <td><%= message %></td>
                        <td><%= timestamp %></td>
                    </tr>
                <%
                }
                %>
            </tbody>
        </table>
    <% } else { %>
        <p>No messages from patients.</p>
    <% } %>

    <!-- Button to navigate back to dashboard -->
    <a href="nutritionist-dashboard.jsp" class="button">Back to Dashboard</a>
</div>

<%
        // Close the resources
        rs.close();
        pst.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    }
%>

</body>
</html>
