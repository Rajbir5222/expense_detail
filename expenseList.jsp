<%@page import="java.util.List"%>
<%@page import="model.Expense"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Expense List</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">


<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- MDBootstrap Datatables  -->
<link href="css/addons/datatables.min.css" rel="stylesheet">
<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">
		<%
			if (session.getAttribute("user_id") != null) {
		%>
		<div class="topnav">
			<a href="expenseDetails.jsp">New Submission</a> <a class="active"
				href="<%=request.getContextPath()%>/expenses">View Submissions</a> <a
				href="contact.jsp">Contact</a> <a
				href="<%=request.getContextPath()%>/logout" style="float: right;">Logout</a>
		</div>
		<div class="container-login100"
			style="background-image: url('images/bg-01.jpg');">


			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54" style="width:75%">
			<span class=" login100-form-title  p-b-49"> List of saved expenses </span>
				<TABLE id="expenseTable"
					class="table table-striped table-bordered table-sm" >
					<thead>
						<tr>
							<th class="th-sm">Expense ID</th>
							<th class="th-sm">Expense Details</th>
							<th class="th-sm">Expense Amount(CAD)</th>
							<th class="th-sm">Created Date</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach items="${expenseList}" var="expense">


							<tr>
								<td><c:out value="${expense.expense_id}" /></td>
								<td><c:out value="${expense.expense_details}" /></td>
								<td><c:out value="${expense.amount}" /></td>
								<td><c:out value="${expense.created_time}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</TABLE>
			</div>
		</div>
		<%
			} else {
		%>
		<div class="text-center p-t-100 p-b-31">
			<span class="p-b-31">User have been logged out. Please login
				again.</span> <br> <a href="index.jsp"> Login </a>
		</div>
		<%
			}
		%>
	</div>



	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="js/addons/datatables.min.js"></script>
	<script src="js/main.js"></script>


</body>
</html>