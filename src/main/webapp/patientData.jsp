<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            width: 90%;
            max-width: 900px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }
        h2 {
            font-size: 24px;
            color: #2c89c5;
            margin-bottom: 20px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            animation: slideIn 1s ease-out;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
        }
        th {
            background-color: #2c89c5;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e0f7fa;
            cursor: pointer;
        }
        
        /* Keyframe animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes slideIn {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Patient Data</h2>

    <table>
        <thead>
            <tr>
                <th>Username</th>
                <th>Email</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
            <%
                String dbURL = "jdbc:mysql://localhost:3306/hack1";  // Replace with your actual database name
                String dbUser = "root";
                String dbPassword = "sandeepsql0674";

                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection
                    con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                    stmt = con.createStatement();

                    // SQL query to get patient username, email, and password
                    String sql = "SELECT username, email, password FROM patients";  // Replace with actual table name and columns
                    rs = stmt.executeQuery(sql);

                    // Iterate through the result set and display patient data
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("password") %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                } finally {
                    // Close resources
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>

</div>

</body>
</html>
