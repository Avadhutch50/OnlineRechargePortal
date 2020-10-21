<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Online Recharge Portal | Recharge</title>
		<link rel="stylesheet" href="css/style2.css">
		<link rel="icon" href="img/favicon.jpg" type="image/jpg" sizes="16x16">
	</head>
	<body>
		<div class="container">
			<div class="navigation">
				<ul class="list">
					<li onclick="location.href='myaccount.jsp';">My Account</li>
					<li onclick="location.href='rechargeoperatorlist';" id="selected">Recharge</li>
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
							out.print("<h2 align='center'>&nbsp;&nbsp;&nbsp;Welcome "+str+"&nbsp;&nbsp;&nbsp;</h2>");
						else
							request.getRequestDispatcher("").forward(request, response);
					%>
			</div>
			<div class="main">
				<div class="main-div">
					<form action="recharge" method="post" id="wideform">
						<table>
							<tr>
								<td>Select Operator:</td>
								<td>
									<select name="operatorid" id='operator' onblur="getOperatorIdValue()">
										<option value="">--Select--</option>
										<c:forEach items="${operator_list}" var="operator">
											<option value="${operator.id}" ${operator.id==selectedopid?'selected="selected"':''}>${operator.name}</option>
										</c:forEach>
									</select>
									<script type="text/javascript"> 
										function getOperatorIdValue() {
											var opid = document.getElementById("operator").value;
											if(opid!="")
												window.location.replace("rechargeplanlist?opid="+opid);	
										}
									</script>
								</td>
							</tr>
							<tr>
								<td>Select Plan:</td>
								<td>
									<select name="planid" id="plan" onblur="getPlanIdValue()">
										<option value="">--Select--</option>
										<c:forEach items="${plan_list}" var="plan">
											<option value="${plan.planid}" ${plan.planid==selectedplanid?'selected="selected"':''}>${plan.plandetails},${plan.planvalidity}</option>
										</c:forEach>
									</select>
									<script type="text/javascript">
										function getPlanIdValue() {
											var opid = document.getElementById("operator").value;
											var planid = document.getElementById("plan").value;
											if(opid!=""&&planid!="")
											window.location.replace("rechargesetamount?opid="+opid+"&planid="+planid);
										}
									</script>
								</td>
							</tr>
							<tr>
								<td>Mobile Number:</td>
								<td><input type="text" name="mobileno" pattern="[0-9]{10}" title="Enter 10 Digit Number"></td>
							</tr>
							<tr>
								<td>Recharge Amount:</td>
								<td><input type="text" name="amount" value="${amount}" pattern="[1-9]{1}[0-9.]{0,5}" title="Enter amount between 1 - 9999 INR"></td>
							</tr>
						</table>
						<input type="submit" value="Recharge Now">
					</form>
				</div>
			</div>
		</div>
	</body>
</html>