<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>Account Type Login</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #e6f3fa;
            margin: 0;
            overflow: hidden;
        }
        .login-container {
            width: 500px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .login-container h2 {
            font-size: 24px;
            color: #2c89c5;
            margin-bottom: 20px;
        }
        .account-options {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .account-option {
            text-align: center;
            width: 120px;
            opacity: 0; /* Hidden initially for fade-in */
            animation: fadeIn 1s forwards, bounce 0.6s ease-out 1s; /* Fade in and bounce */
        }
        /* Delayed fade-in for each option */
        .account-option:nth-child(1) { animation-delay: 0.3s; }
        .account-option:nth-child(2) { animation-delay: 0.6s; }
        .account-option:nth-child(3) { animation-delay: 0.9s; }

        .account-option img {
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
            border-radius: 50%;
            transition: transform 0.3s ease;
        }
        .account-option img:hover {
            transform: scale(1.1);
        }
        .account-option a {
            display: inline-block;
            background-color: #2c89c5;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease-in-out, transform 0.3s ease-in-out;
            width: 100%;
            text-align: center;
            margin-top: 5px;
        }
        .account-option a:hover {
            background-color: #1a659c;
            transform: scale(1.05);
        }

        /* Keyframes for animations */
        @keyframes fadeIn {
            to { opacity: 1; }
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Select Your Account Type</h2>
    <div class="account-options">
        <!-- Nutritionist -->
        <div class="account-option">
            <img src="images/nut.jpg" alt="Nutritionist Icon">
            <a href="nutritionist-login.html" class="nutritionist-btn">NUTRITIONIST</a>
        </div>

        <!-- Patient -->
        <div class="account-option">
            <img src="images/patient.jpg" alt="Patient Icon">
            <a href="patientslogin.html" class="patients-btn">PATIENT</a>
        </div>

        <!-- Admin -->
        <div class="account-option">
            <img src="images/admin.jpeg" alt="Admin Icon">
            <a href="adminlog.html" class="admin-btn">ADMIN LOGIN</a>
        </div>
    </div>
</div>

</body>
</html>
