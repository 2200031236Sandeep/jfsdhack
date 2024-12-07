<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>How Many Patients</title>  
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6f3fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            width: 400px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            text-align: center;
            opacity: 0;
            animation: fadeIn 1s ease forwards;
        }
        h2 {
            font-size: 26px;
            color: #2c89c5;
            margin-bottom: 20px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }
        .count {
            font-size: 48px;
            font-weight: bold;
            color: #ff6347;
            transition: color 0.5s ease-in-out;
        }
        .count:hover {
            color: #e55347;
        }
        
        /* Keyframe animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Total Number of Patients</h2>

    <%
        String dbURL = "jdbc:mysql://localhost:3306/hack1";  // Replace with your database name
        String dbUser = "root";
        String dbPassword = "sandeepsql0674";

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        int patientCount = 0;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            stmt = con.createStatement();

            // SQL query to count the number of patients
            String sql = "SELECT COUNT(*) FROM patients"; // Replace with your actual table name
            rs = stmt.executeQuery(sql);

            // Retrieve the count
            if (rs.next()) {
                patientCount = rs.getInt(1); // Get the count from the first column
            }

        %>

        <p class="count" id="count">0</p>

        <script>
            // JavaScript to animate the count number
            let finalCount = <%= patientCount %>;
            let currentCount = 0;
            const countElement = document.getElementById("count");
            const increment = Math.ceil(finalCount / 100);

            function updateCount() {
                if (currentCount < finalCount) {
                    currentCount += increment;
                    countElement.textContent = currentCount;
                    setTimeout(updateCount, 20);
                } else {
                    countElement.textContent = finalCount;
                }
            }
            updateCount();
        </script>

    <%
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

</div>

</body>  
</html>
