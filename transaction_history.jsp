<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <style>


body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(to right, #ffecd2 0%, #fcb69f 100%);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: start;
    padding: 40px 20px;
    color: #333;
    animation: fadeIn 1s ease-in;
}


table {
    border-collapse: collapse;
    width: 80%;
    margin: 30px auto;
}
th, td {
    border: 1px solid #999;
    padding: 10px;
    text-align: center;
}
th {
    background: #764ba2;
    color: white;
}
</style>
</head>
<body>
    <h2 align="center">Transaction History</h2>

    <c:if test="${not empty transactions}">
        <table>
            <tr>
                <th>Transaction ID</th>
                <th>Account Number</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Description</th>
                <th>Date & Time</th>
            </tr>
            <c:forEach var="txn" items="${transactions}">
                <tr>
                    <td>${txn.id}</td>
                    <td>${txn.accountNumber}</td>
                    <td>${txn.type}</td>
                    <td>${txn.amount}</td>
                    <td>${txn.description}</td>
                    <td>${txn.timestamp}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty transactions}">
        <p align="center">No transactions found.</p> <br>
        <div style="width: 80%; margin: 30px auto; background: rgba(255,255,255,0.7); padding: 20px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <h3>Note</h3>
    <p>
        During the development of this banking system, a problem was identified where the transaction history page always displayed "No transactions found," even after performing successful deposits or withdrawals. This issue occurred because the application was updating the account balance but not recording individual transaction details in a persistent storage system (e.g., a database). As a result, there was no historical transaction data to retrieve and display.


        <br><br>
       To overcome this problem, a solution was implemented by creating a dedicated Transaction table in the database to store every transaction (deposit, withdrawal, etc.) as a separate record. Additionally, the service layer was updated to insert a TransactionDTO into the database whenever a deposit or withdrawal is performed. This ensures that all actions are logged and can be retrieved later for audit and history purposes. By implementing this approach, users can now view a complete and accurate transaction history, improving transparency and functionality in the banking system. 
    </p>
</div>
        
    </c:if>

   
</body>
</html>
