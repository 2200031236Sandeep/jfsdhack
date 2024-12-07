<%@ page import="java.sql.*" %>


       
            

    <%
        // Database connection parameters
        String dbURL = "jdbc:mysql://localhost:3306/hack1_db"; // Replace with your DB URL
        String dbUsername = "root"; // Replace with your MySQL username
        String dbPassword = "sandeeepsql0674"; // Replace with your MySQL password

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        if (username != null && password != null && email != null) {
            Connection conn = null;
            PreparedStatement ps = null;

            try {
                // Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection
                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

                // Create SQL query to insert data
                String sql = "INSERT INTO Nutritionists (username, password, email) VALUES (?, SHA2(?, 256), ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password); // Hashing the password using SHA-256
                ps.setString(3, email);

                // Execute the insert query
                int result = ps.executeUpdate();

                if (result > 0) {
                    out.println("<p>Registration successful!</p>");
                } else {
                    out.println("<p>Error in registration. Please try again.</p>");
                }

            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>
