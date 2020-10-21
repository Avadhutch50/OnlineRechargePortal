<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Online Recharges Portal | Login</title>
		<link rel="stylesheet" href="css/style.css">
		<link rel="icon" href="img/favicon.jpg" type="image/jpg" sizes="16x16">
	</head>
	<body>
		<% String str = (String)session.getAttribute("fname"); if(str!=null) request.getRequestDispatcher("recharge.jsp").forward(request, response);%>
		<div class="Container">
			<h1 align="center">Online Recharge Portal</h1>
			<div class="Form">
				<h2 align="center">Login to your Account</h2>
				<form action="login" method="post">
					<input class="field" type="text" name="user" pattern="[A-Za-z0-9]{8,12}" title="Enter 8 - 12 Alpha Numeric Characters" placeholder="Username"><br><br>
					<input class="field" type="password" name="pass" pattern=".{8,12}" title="Enter 8 - 12 Alpha Numeric Characters with Symbols" placeholder="Password"><br><br>
					<button type="submit" class="button">Login</button><br><br>
				</form>
				<% String msg = (String)request.getAttribute("message"); if(msg!=null) out.print(msg);%>
				<form action="register.jsp" method="post">
					<button type="submit" class="button">Create An Account</button>
				</form>
			</div>
		</div>
	</body>
</html>