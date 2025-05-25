<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add User</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(to right, #74ebd5, #acb6e5);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-box {
        background-color: #ffffff;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        padding: 40px 30px;
        width: 400px;
        box-sizing: border-box;
        text-align: center;
    }

    .form-box h2 {
        margin-bottom: 25px;
        color: #333;
    }

    .form-box label {
        display: block;
        text-align: left;
        margin-bottom: 5px;
        font-weight: 600;
        color: #555;
    }

    .form-box input,
    .form-box select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 14px;
        box-sizing: border-box;
    }

    .form-box button {
        width: 100%;
        padding: 12px;
        background-color: #007BFF;
        color: white;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-box button:hover {
        background-color: #0056b3;
    }

    .message {
        margin-top: 15px;
        color: #d9534f;
        font-weight: bold;
    }
</style>
</head>
<body>

    <div class="form-box">
        <h2>Create Bank Account</h2>
        <form action="./add-user" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required>

            <label for="accountNumber">Account Number:</label>
            <input type="number" name="accountNumber" id="accountNumber" required>

            <label for="balance">Balance:</label>
            <input type="number" step="0.01" name="balance" id="balance" required>

            <label for="accountType">Account Type:</label>
            <select name="accountType" id="accountType" required>
                <option value="">--Select Type--</option>
                <option value="Saving">Saving</option>
                <option value="Current">Current</option>
            </select>

            <button type="submit">Register</button>
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
