<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Withdraw Money</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: fadeIn 1s ease-in-out;
            color: #000;
        }

        .withdraw-box {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            width: 380px;
            text-align: center;
            animation: slideUp 0.7s ease-in-out;
            color: #000;
            
        }

        .withdraw-box h2 {
            margin-bottom: 25px;
            color: #000;
        }

        .withdraw-box input,
        .withdraw-box button {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px;
            border-radius: 8px;
            border: none;
            font-size: 16px;
            box-sizing: border-box;
        }

        .withdraw-box input:focus {
            outline: 2px solid #4CAF50;
        }

        .withdraw-box button {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .withdraw-box button:hover {
            background-color: #45a049;
        }

        .message {
            margin-top: 15px;
            color: green;
            font-weight: bold;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @media (max-width: 480px) {
            .withdraw-box {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>

    <div class="withdraw-box">
        <h2>Withdraw Money</h2>
        <form action="./withdraw" method="post">
            <input type="number" name="accountNumber" placeholder="Account Number" required />
            <input type="number" name="amount" step="0.01" placeholder="Amount" required />
            <button type="submit">Withdraw</button>
        </form>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <div class="message"><%= message %></div>
        <%
            }
        %>
    </div>

</body>
</html>
