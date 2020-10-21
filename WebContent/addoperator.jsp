<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Online Recharge Portal | Add Operator</title>
		<link rel="stylesheet" href="css/style2.css">
		<link rel="icon" href="img/favicon.jpg" type="image/jpg" sizes="16x16">
	</head>
	<body>
		<div class="container">
			<div class="navigation">
				<ul class="list">
					<li onclick="location.href='myaccount.jsp';">My Account</li>
					<li onclick="location.href='rechargeoperatorlist';">Recharge</li>
					<li onclick="location.href='addoperator.jsp';" id="selected">Add Operator</li>
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
							out.print("<h2 align='center'>&nbsp;&nbsp;&nbsp;Welcome "+str+"&nbsp;&nbsp;&nbsp;</h2>");
						else
							request.getRequestDispatcher("").forward(request, response);
					%>
			</div>
			<div class="main">
				<div class="main-div">
					<form action="add-operator" method="post">
						<table>
							<tr>
								<td>Operator Name:</td><td><input type="text" name="opname" pattern="[A-Za-z0-9 ]{1,40}" title="Enter Minimum 1 to 40 Characters"></td>
							</tr>
							<tr>
								<td>Company Name:</td><td><input type="text" name="company" pattern="[A-Za-z0-9 .]{1,40}" title="Enter Minimum 1 to 40 Characters"></td>
							</tr>
						</table>
						<input type="submit" value="Add Operator">
					</form>
				</div>
			</div>
		</div>
	</body>
</html>