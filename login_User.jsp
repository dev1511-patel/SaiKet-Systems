<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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

    .form-box {
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(15px);
        border-radius: 15px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
        padding: 40px 30px;
        width: 380px;
        color: #000;
        text-align: center;
        animation: slideUp 0.7s ease-in-out;
    }

    .form-box h1 {
        margin-bottom: 25px;
        color: #000;
        font-size: 28px;
    }

    table {
        width: 100%;
        margin-bottom: 20px;
    }

    td, th {
        padding: 10px 0;
        text-align: left;
        font-size: 14px;
        color: #000;
    }

    input[type="text"], input[type="number"] {
        width: 100%;
        padding: 10px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 14px;
        outline: none;
        color: #000;
        background: #fff;
    }

    input[type="text"]:focus, input[type="number"]:focus {
        border: 2px solid #4CAF50;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #4CAF50;
        color: white;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    .message {
        margin-top: 15px;
        color: #b00000;
        font-weight: bold;
        background: rgba(255, 0, 0, 0.15);
        padding: 10px;
        border-radius: 8px;
    }

    h4 {
        margin-top: 20px;
        font-size: 14px;
        color: #000;
    }

    h4 a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }

    h4 a:hover {
        text-decoration: underline;
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
        .form-box {
            width: 90%;
            padding: 30px 20px;
        }
    }
</style>
</head>
<body>

    <div class="form-box">
        <h1>LOGIN</h1>
        <form action="./auth-user" method="post">
            <table>
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <th>Account Number</th>
                    <td><input type="text" name="accountNumber" required></td>
                </tr>
            </table>
            <input type="submit" value="Login">
        </form>

        <% String message = (String) request.getAttribute("message");
           if (message != null) { %>
            <div class="message"><%= message %></div>
        <% } %>

        <h4>New user? <a href="sign-up-page-user">Add User Details</a></h4>
    </div>

</body>
</html>
