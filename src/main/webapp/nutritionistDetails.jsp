<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritionist Details</title>
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
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #2c89c5;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Nutritionist Details</h2>

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Aadhar</th>
                <th>Qualification</th>
                <th>Experience</th>
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

                    // SQL query to get nutritionist details (name, email, aadhar, qualification, experience)
                    String sql = "SELECT name, email, aadhar, qualification, experience FROM nutritionists";  // Replace with actual table name and columns
                    rs = stmt.executeQuery(sql);

                    // Iterate through the result set and display nutritionist data
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("aadhar") %></td>
                <td><%= rs.getString("qualification") %></td>
                <td><%= rs.getString("experience") %></td>
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
