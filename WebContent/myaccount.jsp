<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Online Recharge Portal | My Account</title>
		<link rel="stylesheet" href="css/style2.css">
		<link rel="icon" href="img/favicon.jpg" type="image/jpg" sizes="16x16">
	</head>
	<body>
		<div class="container">
			<div class="navigation">
				<ul class="list">
					<li onclick="location.href='myaccount.jsp';" id="selected">My Account</li>
					<li onclick="location.href='rechargeoperatorlist';">Recharge</li>
					<li onclick="location.href='addoperator.jsp';">Add Operator</li>
					<li onclick="location.href='planoperatorlist'">Add Plan</li>
					<li onclick="location.href='mobileoperatorlist';">Add Mobile Number</li>
					<li onclick="location.href='logout';">Logout</li>
				</ul>
			</div>
			<div class="notification-bar">
				<% String msg = (String)request.getAttribute("message"); if(msg!=null) out.print(msg);%>
			</div>
			<div class="nav">
					<% String str = (String)session.getAttribute("fname"); 
						if(str!=null)
						{
							request.setAttribute("id",session.getAttribute("id"));
							out.print("<h2 align='center'>&nbsp;&nbsp;&nbsp;Welcome "+str+"&nbsp;&nbsp;&nbsp;</h2>");
						}
						else
							request.getRequestDispatcher("").forward(request, response);
					%>
			</div>
			<div class="main">
				<div class="my-account">
					<form action="update-info" method="post">
						<table>
							<tr>
								<td>Full Name:</td><td><input type="text" name="fullname" pattern="[A-Za-z ]{5,40}" title="Enter 5-40 Character" placeholder="Full Name" value="<%=(String)session.getAttribute("fname")%>"></td>
							</tr>
							<tr>
								<td>Email Address:</td><td><input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Email Address" value="<%=(String)session.getAttribute("email")%>"></td>
							</tr>
							<tr>
								<td>Mobile Number:</td><td><input type="tel" name="mobileno" pattern="[0-9]{10}" title="Enter 10 Digit Number" placeholder="Mobile Number" value="<%=(String)session.getAttribute("mobileno")%>"></td>
							</tr>
							<tr>
								<td>Username:</td><td><input type="text" name="user" pattern="[A-Za-z0-9]{8,12}" title="Enter 8 - 12 Alpha Numeric Characters" placeholder="Username" value="<%=(String)session.getAttribute("username")%>"></td>
							</tr>
						</table>
						<input type="submit" value="Update Info"/>
					</form>
					<div class="password">
						<form action="password-change" method="post">
							<table>
								<tr>
									<td>Old Password:</td><td><input type="password" name="oldpass" pattern=".{8,12}" title="Enter 8 - 12 Alpha Numeric Characters with Symbols" placeholder="Old Password"></td>
								</tr>
								<tr>
									<td>New Password:</td><td><input type="password" name="newpass" pattern=".{8,12}" title="Enter 8 - 12 Alpha Numeric Characters with Symbols" placeholder="New Password"></td>
								</tr>
							</table>
							<input type="hidden" name="id" value="${id}">
							<input type="submit" value="Change Password">
						</form>
						<form action="delete-user" method="post" style="padding-top:46px;padding-bottom:46px;">
							<input type="submit" value="Delete My Account">
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>