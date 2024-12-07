<%@ page import="java.sql.*, java.util.*, javax.mail.*, javax.mail.internet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Nutritionist Credentials</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
        }
        h2 {
            font-size: 24px;
            color: #2c89c5;
            margin-bottom: 20px;
        }
        .form-group {
            margin: 10px 0;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #2c89c5;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #1a659c;
        }
        .message {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Send Nutritionist Credentials</h2>

    <form action="" method="post">
        <div class="form-group">
            <label for="nutritionistEmail">Nutritionist Email:</label>
            <input type="email" id="nutritionistEmail" name="nutritionistEmail" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="text" id="password" name="password" required>
        </div>
        <button type="submit">Send Credentials</button>
    </form>

    <%
        // Check if the form has been submitted
        if (request.getMethod().equalsIgnoreCase("post")) {
            String nutritionistEmail = request.getParameter("nutritionistEmail");
            String password = request.getParameter("password");

            // Admin email and password for sending email
            String adminEmail = "mandemsandeep@gmail.com"; // Admin email
            String adminPassword = "sandeepmail0674"; // Admin email password

            try {
                // Set up mail server properties
                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP host
                props.put("mail.smtp.port", "587"); // SMTP port
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true"); // Enable TLS

                // Create a new session for email
                Session emailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(adminEmail, adminPassword);
                    }
                });

                // Create a message
                Message message = new MimeMessage(emailSession);
                message.setFrom(new InternetAddress(adminEmail));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(nutritionistEmail));
                message.setSubject("Your Nutritionist Credentials");
                message.setText("Hello,\n\nYour nutritionist credentials are as follows:\n\nPassword: " + password + "\n\nBest Regards,\nAdmin");

                // Send the message
                Transport.send(message);
                out.println("<p class='message' style='color:green;'>Credentials sent successfully to " + nutritionistEmail + "!</p>");

            } catch (MessagingException e) {
                out.println("<p class='message' style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        }
    %>
</div>

</body>
</html>
