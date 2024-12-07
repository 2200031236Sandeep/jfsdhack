<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Nutritionists</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">Nutritionists List</h1>
    <table>
        <thead>
            <tr>
                <th>Nutritionist ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Aadhar</th>
                <th>Qualification</th>
                <th>Experience</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3306/hack1";
                String dbUser = "root";
                String dbPass = "sandeepsql0674";

                // Initialize resources
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish the connection
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    // Create and execute the query
                    String query = "SELECT nutritionist_id, name, email, aadhar, qualification, experience FROM nutritionists";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(query);

                    // Iterate through the result set
                    while (rs.next()) {
                        // Fetch data from the current row
                        int nutritionist_id = rs.getInt("nutritionist_id");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String aadhar = rs.getString("aadhar");
                        String qualification = rs.getString("qualification");
                        int experience = rs.getInt("experience");
            %>
                        <tr>
                            <td><%= nutritionist_id %></td>
                            <td><%= name %></td>
                            <td><%= email %></td>
                            <td><%= aadhar %></td>
                            <td><%= qualification %></td>
                            <td><%= experience %></td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    // Display error message for debugging
            %>
                <tr>
                    <td colspan="6" style="text-align: center; color: red;">
                        Error: <%= e.getMessage() %>
                    </td>
                </tr>
            <%
                    e.printStackTrace();
                } finally {
                    // Close resources
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
            %>
        </tbody>
    </table>
</body>
</html>
