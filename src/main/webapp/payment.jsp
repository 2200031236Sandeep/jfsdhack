<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }
        img {
            width: 200px;
            height: 200px;
            margin-bottom: 20px;
        }
        p {
            margin-bottom: 10px;
        }
        .btn {
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Make Your Payment</h1>
        <img src="images/payment_qr_code.png" alt="QR Code for Payment">
        <p>Scan the QR code above to make your payment.</p>
        <a href="success.jsp" class="btn">Back to Success Page</a>
    </div>
</body>
</html>
