<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Online Recharge Portal | Register</title>
		<link rel="stylesheet" href="css/style.css">
		<link rel="icon" href="img/favicon.jpg" type="image/jpg" sizes="16x16">
	</head>
	<body>
		<% String str = (String)session.getAttribute("fname"); if(str!=null) request.getRequestDispatcher("recharge.jsp").forward(request, response);%>
		<div class="Container">
			<h1 align="center">Online Recharge Portal</h1>
			<div class="Form">
				<h2 align="center">Create Your Account</h2>
				<form action="register" method="post">
					<input class="field" type="text" name="fullname" pattern="[A-Za-z ]{5,40}" title="Enter 5-40 Character" placeholder="Full Name"><br><br>
					<input class="field" type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Email Address"><br><br>
					<input class="field" type="tel" name="mobileno" pattern="[0-9]{10}" title="Enter 10 Digit Number" placeholder="Mobile Number"><br><br>
					<i class="note">(Minimum 8-12 Characters, Numbers)*</i>
					<input class="field" type="text" name="user" pattern="[A-Za-z0-9]{8,12}" title="Enter 8 - 12 Alpha Numeric Characters" placeholder="Username"><br><br>
					<i class="note">(Minimum 8-12 Characters, Numbers, Symbols)*</i>
					<input class="field" type="password" name="pass" pattern=".{8,12}" title="Enter 8 - 12 Alpha Numeric Characters with Symbols" placeholder="Password"><br><br>
					<button type="submit" class="button">Register</button><br><br>
				</form>
				<% String msg = (String)request.getAttribute("message"); if(msg!=null) out.print(msg);%>
				<form action="index.jsp" method="post">
					<button type="submit" class="button">Already have Account! Login</button>
				</form>
			</div>
		</div>
	</body>
</html>