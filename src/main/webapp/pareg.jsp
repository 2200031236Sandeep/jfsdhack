<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Registration</title>
    <style>
        body {
           display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #e6f3fa; /* Light background color */
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
        a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
        .message {
            margin: 20px 0;
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Patient Registration</h2>
    <%
        // Retrieve form parameters
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database connection variables
        String dbURL = "jdbc:mysql://localhost:3306/hack1";  // Replace with your actual database name
        String dbUser = "root";
        String dbPassword = "sandeepsql0674";

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            con = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL query to insert data into the patients table
            String sql = "INSERT INTO patients (username, email, password) VALUES (?, ?, ?)";

            // Prepare statement
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);

            // Execute the query
            int result = pstmt.executeUpdate();

            if (result > 0) {
                out.println("<div class='message'>Patient registration successful!</div>");
                out.println("<a href='patientslogin.html'>Go to Login</a>");
            } else {
                out.println("<div class='message'>Registration failed. Please try again.</div>");
                out.println("<a href='patientreg.html'>Back to Register</a>");
            }
        } catch (Exception e) {
            out.println("<div class='message'>Error: " + e.getMessage() + "</div>");
            out.println("<a href='patientreg.html'>Back to Register</a>");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</div>

</body>
</html>
