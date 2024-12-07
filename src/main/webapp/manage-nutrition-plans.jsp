<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Nutrition Plans</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 20px;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 0 auto;
        }
        h2 {
            text-align: center;
            color: #4CAF50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        input, textarea, select, button {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        button {
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%
    // Ensure the nutritionist is logged in
   
   

    // Database connection details
    String dbUser = "root";
    String dbPassword = "sandeepsql0674";
    String dbURL = "jdbc:mysql://localhost:3306/hack1"; // Update database name

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish database connection
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Fetch existing nutrition plans
        String fetchPlansSQL = "SELECT * FROM nutrition_plans WHERE nutritionist_id = ?";
        pst = conn.prepareStatement(fetchPlansSQL);
        pst.setInt(1, nutritionistId);
        rs = pst.executeQuery();
%>

<div class="container">
    <h2>Manage Nutrition Plans</h2>
    
    <h3>Existing Plans</h3>
    <table>
        <thead>
            <tr>
                <th>Patient Name</th>
                <th>Plan Details</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            if (rs.next()) {
                do {
                    String patientName = rs.getString("patient_name");
                    String planDetails = rs.getString("plan_details");
                    int planId = rs.getInt("id");
            %>
            <tr>
                <td><%= patientName %></td>
                <td><%= planDetails %></td>
                <td>
                    <form action="delete-nutrition-plan.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="planId" value="<%= planId %>">
                        <button type="submit" style="background-color: #f44336; color: white;">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                } while (rs.next());
            } else {
            %>
            <tr>
                <td colspan="3">No plans available.</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>

    <h3>Add New Nutrition Plan</h3>
    <form action="add-nutrition-plan.jsp" method="post">
        <label for="patientName">Patient Name:</label>
        <input type="text" id="patientName" name="patientName" required>
        
        <label for="planDetails">Plan Details:</label>
        <textarea id="planDetails" name="planDetails" rows="5" required></textarea>
        
        <button type="submit">Add Plan</button>
    </form>
</div>

<%
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>An error occurred: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
