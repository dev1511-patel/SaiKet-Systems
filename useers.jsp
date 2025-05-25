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
    <title>Account Details</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: fadeIn 1s ease-in-out;
            color: #000;
        }

        .card {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            padding: 40px 30px;
            width: 380px;
            color: #000;
            text-align: left;
            animation: slideUp 0.7s ease-in-out;
        }

        .card h2 {
            margin-bottom: 25px;
            text-align: center;
            color: #000;
            font-size: 24px;
        }

        .card p {
            font-size: 16px;
            margin: 12px 0;
            line-height: 1.5;
        }

        .card p strong {
            color: #333;
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
            .card {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>User Account Details</h2>
        <p><strong>Name:</strong> <%= user.getName() %></p>
        <p><strong>Account Number:</strong> <%= user.getAccountNumber() %></p>
        <p><strong>Account Type:</strong> <%= user.getAccountType() %></p>
        <p><strong>Balance:</strong> ₹<%= user.getBalance() %></p>
    </div>
</body>
</html>
