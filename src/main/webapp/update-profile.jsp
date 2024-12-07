<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Retrieve form data
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String weight = request.getParameter("weight");
    String height = request.getParameter("height");
    String deficiency = request.getParameter("deficiency");
    String username = (String) session.getAttribute("username");

    // Database connection variables
    String dbURL = "jdbc:mysql://localhost:3306/hack1";
    String dbUser = "root";
    String dbPassword = "sandeepsql0674";

    try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         PreparedStatement pstmt = con.prepareStatement("INSERT INTO patient_profiles (username, age, gender, weight, height, deficiency) VALUES (?, ?, ?, ?, ?, ?)")) {

        Class.forName("com.mysql.cj.jdbc.Driver");

        // Set the parameters for the SQL insert statement
        pstmt.setString(1, username);
        pstmt.setInt(2, Integer.parseInt(age));
        pstmt.setString(3, gender);
        pstmt.setFloat(4, Float.parseFloat(weight));
        pstmt.setFloat(5, Float.parseFloat(height));
        pstmt.setString(6, deficiency);

        // Execute the insert
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
%>
            <div style="background-color: #d4edda; color: #155724; padding: 20px; border-radius: 8px; text-align: center; margin-top: 20px;">
                <p><strong>Profile created successfully in the new table!</strong></p>
                <a href="patient-dashboard.jsp" style="color: #0c5460; text-decoration: none; padding: 10px 20px; border-radius: 5px; background-color: #cce5ff; margin-right: 10px;">Return to Dashboard</a>
                <a href="healthDashboard.jsp" style="color: #0c5460; text-decoration: none; padding: 10px 20px; border-radius: 5px; background-color: #cce5ff;">Go to Health Dashboard</a>
            </div>
<%
        } else {
%>
            <div style="background-color: #f8d7da; color: #721c24; padding: 20px; border-radius: 8px; text-align: center; margin-top: 20px;">
                <p><strong>Insert failed. Please try again.</strong></p>
            </div>
<%
        }
    } catch (Exception e) {
%>
        <div style="background-color: #f8d7da; color: #721c24; padding: 20px; border-radius: 8px; text-align: center; margin-top: 20px;">
            <p><strong>Error:</strong> <%= e.getMessage() %></p>
        </div>
<%
    }
%>
