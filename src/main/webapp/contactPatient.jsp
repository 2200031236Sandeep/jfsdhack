<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="https://jakarta.ee/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Nutritionist</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Contact Nutritionist</h1>
        <form action="submitMessage.jsp" method="POST">
            <div class="form-group">
                <label for="nutritionistUsername">Nutritionist Username:</label>
                <input type="text" id="nutritionistUsername" name="nutritionistUsername" required placeholder="Enter Nutritionist Username" />
            </div>

            <div class="form-group">
                <label for="message">Your Message:</label>
                <textarea id="message" name="message" rows="4" required placeholder="Type your message here"></textarea>
            </div>

            <button type="submit">Send Message</button>
        </form>
    </div>
</body>
</html>
