<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="edu.jspider.springmvc.DTO.BankDTO" %>
<%
    BankDTO user = (BankDTO) session.getAttribute("authenticated_user");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit Money</title>
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

        .form-container {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            padding: 40px 30px;
            width: 380px;
            animation: slideUp 0.7s ease-in-out;
            color: #000;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #000;
        }

        input[type="number"], button {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px;
            border-radius: 8px;
            border: none;
            font-size: 16px;
            box-sizing: border-box;
        }

        input[type="number"]:focus {
            outline: 2px solid #4CAF50;
        }

        button {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        p {
            text-align: center;
            font-weight: bold;
            font-size: 14px;
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
            .form-container {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Deposit Money</h2>
        <form action="deposit" method="post">
            <input type="hidden" name="accountNumber" value="<%= user.getAccountNumber() %>">
            <label for="amount"><strong>Amount:</strong></label>
            <input type="number" name="amount" id="amount" step="0.01" required>
            <button type="submit">Deposit</button>
        </form>
        <p style="color: green;">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
        </p>
    </div>
</body>
</html>
