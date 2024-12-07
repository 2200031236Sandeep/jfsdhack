<%@ page import="java.sql.*, java.io.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritionist Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h2 {
            color: #4CAF50;
        }
        p {
            font-size: 16px;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String aadhar = request.getParameter("aadhar");
    String qualification = request.getParameter("qualification");
    String experience = request.getParameter("experience");
    String password = request.getParameter("password");

    // Database connection details
    String dbUser = "root";
    String dbPassword = "sandeepsql0674";
    String dbURL = "jdbc:mysql://localhost:3306/hack1"; // Adjust the DB name

    try {
        // Load and register the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection to the database
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL query to insert the nutritionist's details into the database
        String sql = "INSERT INTO nutritionists (name, email, aadhar, qualification, experience, password) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = conn.prepareStatement(sql);

        // Set the values for the SQL query
        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, aadhar);
        pst.setString(4, qualification);
        pst.setString(5, experience);
        pst.setString(6, password); // Set the password value here

        // Execute the insert
        int rowsInserted = pst.executeUpdate();

        if (rowsInserted > 0) {
%>
        <div class="container">
            <h2>Registration Successful!</h2>
            <p>You have been successfully registered as a nutritionist.</p>
            <button onclick="window.location.href='nutritionist-login.jsp'">Go to Login</button>
        </div>
<%
        }

        // Close the database connection
        pst.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    }
%>

</body>
</html>
