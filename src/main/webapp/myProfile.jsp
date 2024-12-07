<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Check if the user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("patientLogin.html");
        return;
    }

    // Database connection variables
    String dbURL = "jdbc:mysql://localhost:3306/hack1";  // Update with your actual database name
    String dbUser = "root";
    String dbPassword = "sandeepsql0674";

    String age = "";
    String gender = "";
    String weight = "";
    String height = "";
    String deficiency = "";

    try (Connection con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         PreparedStatement pstmt = con.prepareStatement("SELECT age, gender, weight, height, deficiency FROM patient_profiles WHERE username = ?")) {

        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            age = rs.getString("age");
            gender = rs.getString("gender");
            weight = rs.getString("weight");
            height = rs.getString("height");
            deficiency = rs.getString("deficiency");
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h2 {
            color: #2c89c5;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input[type="text"], input[type="number"] {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            padding: 10px;
            background-color: #2c89c5;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #1f6d94;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>My Profile</h2>
    <form action="update-profile.jsp" method="post">
        <label>Age:</label>
        <input type="number" name="age" value="<%= age %>" required>
        
        <label>Gender:</label>
        <input type="text" name="gender" value="<%= gender %>" required>
        
        <label>Weight (kg):</label>
        <input type="number" step="0.1" name="weight" value="<%= weight %>" required>
        
        <label>Height (cm):</label>
        <input type="number" step="0.1" name="height" value="<%= height %>" required>
        
        <label>Nutrient Deficiency:</label>
        <input type="text" name="deficiency" value="<%= deficiency %>" required>
        
        <button type="submit">Update Profile</button>
    </form>
</div>

</body>
</html>
