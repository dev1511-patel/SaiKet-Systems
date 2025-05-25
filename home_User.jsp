<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="edu.jspider.springmvc.DTO.BankDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style type="text/css">
/* Resetting some default styles */
/* Reset & global settings */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

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

/* Fade-in effect */
@keyframes fadeIn {
	from {
		opacity: 0;
		transform: translateY(-20px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

/* Nav Bar Styling */
nav {
	width: 100%;
	text-align: center;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(12px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
	border-radius: 0 0 20px 20px;
	padding: 25px 0;
	margin-bottom: 40px;
}

nav h1 {
	color: #fff;
	font-size: 36px;
	letter-spacing: 1.5px;
	text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.2);
}

/* Button Container */
#btn-container {
	background: rgba(255, 255, 255, 0.2);
	backdrop-filter: blur(20px);
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
	border-radius: 25px;
	padding: 40px;
	width: 95%;
	max-width: 650px;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 20px;
	animation: slideUp 1s ease-in-out;
}

@keyframes slideUp {
	from {
		transform: translateY(30px);
		opacity: 0;
	}
	to {
		transform: translateY(0);
		opacity: 1;
	}
}

/* Stylish Buttons */
#btn-container a {
	text-decoration: none;
	color: #fff;
	padding: 14px 28px;
	border-radius: 50px;
	background: linear-gradient(135deg, #667eea, #764ba2);
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
	font-weight: 600;
	font-size: 16px;
	transition: all 0.4s ease;
	text-align: center;
	min-width: 200px;
}

#btn-container a:hover {
	transform: translateY(-5px) scale(1.03);
	background: linear-gradient(135deg, #ff6a00, #ee0979);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

/* Message */
h4 {
	color: #fff;
	font-size: 18px;
	margin-top: 25px;
	background-color: rgba(0, 0, 0, 0.3);
	padding: 10px 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Responsive */
@media (max-width: 600px) {
	nav h1 {
		font-size: 24px;
	}
	#btn-container a {
		font-size: 14px;
		min-width: 160px;
		padding: 12px 20px;
	}
}

</style>
</head>
<body>

		<%
	BankDTO user = (BankDTO) session.getAttribute("authenticated_user");
	int id = user.getId();
	%>
 	
	<nav>
			<h1>WELCOME TO BANK OF BARODA</h1>
	</nav>
	
	<div align="center" id="btn-container">
	
	       <a href="useers">Show Bank Account Details</a> 
			<a href="deposit"> Deposit </a> 
			<a href="withdraw"> withdraw</a>  
			<a href="transaction-history?accountNumber=<%= user.getAccountNumber() %>">View Transaction History</a>



			<a href="edit-user?id=<%=id%>">Edit Account</a> 
			<a href="delete-user?id=<%=id%>">Delete Account</a>
			<a href="logout-user">Logout</a>
		
		
			
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<h4><%=message%></h4>
		<%
		}
		%>
		
	</div>

</body>
</html>