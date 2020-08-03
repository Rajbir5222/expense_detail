<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Expense Details</title>
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
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>


	<div class="limiter">
		<%if(session.getAttribute("user_id")!=null) {
	%>

		<div class="topnav">
			<a class="active" href="expenseDetails.jsp">New Submission</a> <a
				href="<%=request.getContextPath()%>/expenses">View Submissions</a> <a
				href="contact.jsp">Contact</a><a
				href="<%=request.getContextPath()%>/logout" style="float: right;">Logout</a>
		</div>
		<div class="container-login100"
			style="background-image: url('images/bg-01.jpg');">


			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form"
					action="<%=request.getContextPath()%>/expenses" method="post">
					<span class=" login100-form-title  p-b-49"> Please Enter
						Your Expense Details </span>
					<c:if test = "${sessionScope.isError ==false}" >
					<div class="text-left  p-t-8 p-b-23" style="color: green;">
						<span> ${sessionScope.msg} </span>
					</div>
					</c:if>
					<c:if test = "${sessionScope.isError ==true}" >
					<div class="text-left  p-t-8 p-b-23" style="color: red;">
						<span> ${sessionScope.msg} </span>
					</div>
					</c:if>
					<%session.setAttribute("msg",null); %>
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="Expense details is reauired">
						<span class="label-input100">Expense Details</span> <input
							class="input100" type="text" maxlength="200"  name="expense_details"> <span
							class="focus-input100"></span>

					</div>
					<div class="wrap-input100 validate-input m-b-23"
						data-validate="Amount is reauired">
						<span class="label-input100">Amount</span> <input class="input100"
							type="number" name="amount" maxlength="10" step=".01"> <span
							class="focus-input100" data-symbol="&#36;"></span>
					</div>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" onclick="onSubmit()"
								class="login100-form-btn">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<%} else{%>
		<div class="text-center p-t-100 p-b-31">
			<span class="p-b-31">User have been logged out. Please login
				again.</span> <br> <a href="index.jsp"> Login </a>
		</div>
		<%} %>
	</div>


	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="js/main.js"></script>

</body>
</html>