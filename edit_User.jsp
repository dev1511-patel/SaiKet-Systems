<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="edu.jspider.springmvc.DTO.BankDTO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-card {
        background: rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(15px);
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        padding: 35px 30px;
        width: 100%;
        max-width: 420px;
        text-align: center;
        color: #000;
        animation: slideUp 0.7s ease-in-out;
    }

    .form-card h2 {
        margin-bottom: 25px;
        color: #000;
    }

    .form-card table {
        width: 100%;
        margin-bottom: 20px;
    }

    .form-card td {
        padding: 10px 5px;
        text-align: left;
        font-size: 14px;
    }

    .form-card input[type="text"] {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 14px;
        outline: none;
        transition: border-color 0.3s ease;
    }

    .form-card input[type="text"]:focus {
        border-color: #4CAF50;
        box-shadow: 0 0 5px rgba(76, 175, 80, 0.2);
    }

    .form-card input[readonly] {
        background-color: #f3f3f3;
        cursor: not-allowed;
    }

    .form-card input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 14px 0;
        width: 100%;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-card input[type="submit"]:hover {
        background-color: #45a049;
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

    @media screen and (max-width: 480px) {
        .form-card {
            padding: 25px 20px;
            width: 90%;
        }

        .form-card td {
            font-size: 13px;
        }

        .form-card input[type="submit"] {
            font-size: 15px;
            padding: 12px 0;
        }
    }
</style>
</head>
<body>
<%
    BankDTO user = (BankDTO) session.getAttribute("authenticated_user");
    if (user == null) {
        response.sendRedirect("login-page-user");
        return;
    }
%>

    <div class="form-card">
        <h2>Edit User Details</h2>
        <form action="./updated-user" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id" value="<%=user.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="name" value="<%=user.getName()%>" required></td>
                </tr>
                <tr>
                    <td>Account Number</td>
                    <td><input type="text" name="accountNumber" value="<%=user.getAccountNumber()%>" required></td>
                </tr>
                <tr>
                    <td>Balance</td>
                    <td><input type="text" name="balance" value="<%=user.getBalance()%>" readonly></td>
                </tr>
                <tr>
                    <td>Account Type</td>
                    <td><input type="text" name="accountType" value="<%=user.getAccountType()%>" required></td>
                </tr>
            </table>
            <input type="submit" value="Update">
        </form>
    </div>

</body>
</html>
