<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Online Recharge Portal | Add Mobile Number</title>
		<link rel="stylesheet" href="css/style2.css">
		<link rel="icon" href="img/favicon.jpg" type="image/jpg" sizes="16x16">
	</head>
	<body>
		<div class="container">
			<div class="navigation">
				<ul class="list">
					<li onclick="location.href='myaccount.jsp';">My Account</li>
					<li onclick="location.href='rechargeoperatorlist';">Recharge</li>
					<li onclick="location.href='addoperator.jsp';">Add Operator</li>
					<li onclick="location.href='planoperatorlist'">Add Plan</li>
					<li onclick="location.href='mobileoperatorlist';" id="selected">Add Mobile Number</li>
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
					<form action="add-mobile" method="post">
						<table>
							<tr>
								<td>Mobile Number:</td><td><input type="text" name="mobileno" pattern="[0-9]{10}" title="Enter 10 Digits"></td>
							</tr>
							<tr>
								<td>Owner Name:</td><td><input type="text" name="ownername" pattern="[A-Za-z .]{1,20}" title="Enter 1-20 Charachters"></td>
							</tr>
							<tr>
								<td>Select Operator:</td>
								<td>
									<select name="operatorid">
										<option value="">--Select--</option>
										<c:forEach items="${operator_list}" var="operator">
											<option value="${operator.id}">${operator.name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
						<input type="submit" value="Add Mobile">
					</form>
				</div>
			</div>
		</div>
	</body>
</html>