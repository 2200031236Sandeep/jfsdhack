<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    // Retrieve form parameters
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String aadhar = request.getParameter("aadhar");
    String qualification = request.getParameter("qualification");
    String experience = request.getParameter("experience");

    // Debugging: Print values to check if parameters are being passed
    out.println("<h3>Debugging Info</h3>");
    out.println("Name: " + name + "<br>");
    out.println("Email: " + email + "<br>");
    out.println("Aadhar: " + aadhar + "<br>");
    out.println("Qualification: " + qualification + "<br>");
    out.println("Experience: " + experience + "<br>");

    // Check if the parameters are null or empty
    if (name == null || email == null || aadhar == null || qualification == null || experience == null ||
        name.trim().isEmpty() || email.trim().isEmpty() || aadhar.trim().isEmpty() || qualification.trim().isEmpty() || experience.trim().isEmpty()) {
        out.println("<p style='color:red;'>Error: All fields are required. Please go back and fill the form.</p>");
    } else {
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

            // SQL query to insert data into the nutritionists table
            String sql = "INSERT INTO nutritionists (name, email, aadhar, qualification, experience) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, aadhar);
            pstmt.setString(4, qualification);
            pstmt.setString(5, experience);

            // Execute the query
            int result = pstmt.executeUpdate();

            if (result > 0) {
                // Registration successful, redirect to "wait for admin call" page
                response.sendRedirect("waitForAdminCall.html");
            } else {
                out.println("<p style='color:red;'>Registration failed. Please try again.</p>");
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
