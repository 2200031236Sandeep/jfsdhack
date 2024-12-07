<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutritionist Dashboard</title>
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
            max-width: 600px;
            margin: 50px auto;
            text-align: center;
        }
        h2 {
            color: #4CAF50;
            margin-bottom: 30px;
        }
        .option-buttons {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            display: block;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%
   
%>
<div class="container">
    <h2>Nutritionist Dashboard</h2>
    <div class="option-buttons">
        <!-- Button to view messages -->
        <a href="view-nutritionist-messages.jsp" class="btn">See Messages</a>
        <!-- Button to view patient details -->
        <a href="view-patient-details.jsp" class="btn">See Patients</a>
    </div>
</div>
</body>
</html>
