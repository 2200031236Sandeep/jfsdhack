<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Login</title>
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
    <h2>Patient Login</h2>
    <%
        // Retrieve form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Database connection variables
        String dbURL = "jdbc:mysql://localhost:3306/hack1";  // Replace with your actual database name
        String dbUser = "root";
        String dbPassword = "sandeepsql0674";
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isAuthenticated = false;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish database connection
            con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            
            // SQL query to check username and password
            String sql = "SELECT * FROM patients WHERE username = ? AND password = ?";
            
            // Prepare statement
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            
            // Execute the query
            rs = pstmt.executeQuery();
            
            // Check if a record exists with matching username and password
            if (rs.next()) {
                isAuthenticated = true;
            }

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Display result to the user
        if (isAuthenticated) {
            out.println("<div class='message'>Login successful! Welcome, " + username + ".</div>");
            out.println("<a href='patient-dashboard.jsp'>Go to Dashboard</a>");
            session.setAttribute("username", username);
           
        } else {
            out.println("<div class='message'>Invalid username or password. Please try again.</div>");
            out.println("<a href='patientslogin.html'>Back to Login</a>");
        }
    %>
</div>

</body>
</html>
