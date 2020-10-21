<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Online Recharge Portal | Add Plan</title>
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
					<li onclick="location.href='planoperatorlist'" id="selected">Add Plan</li>
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
					<form action="add-plan" method="post" id="wideform">
						<table>
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
							<tr>
								<td>Plan Details:</td>
								<td><input type="text" name="plandetails" pattern=".{1,100}" title="Enter 1-100 Characters" style="font-size: 13px;"></td>
							</tr>
							<tr>
								<td>Plan Validity:</td>
								<td><input type="text" name="planvalidity" pattern=".{1,40}" title="Enter 1-40 Characters"></td>
							</tr>
							<tr>
								<td>Price:</td>
								<td><input type="text" name="price" pattern="[1-9]{1}[0-9.]{0,3}" title="Enter amount between 1 - 9999 INR"></td>
							</tr>
						</table>
						<input type="submit" value="Add Plan">
					</form>
				</div>
			</div>
		</div>
	</body>
</html>