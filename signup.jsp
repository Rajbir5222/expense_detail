<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII" import="java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sign up</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form" action="<%=request.getContextPath()%>/signup" method="post">
					<div class="text-left  p-t-8 p-b-23" style="color: green; font-size: larger;">
						<span> ${sessionScope.successMsg} </span>
					</div>
					<% session.setAttribute("successMsg",null);%>
					<div class="text-right  p-b-31">
						<a href="index.jsp">
							Back to login
						</a>
					</div>
					<span class="login100-form-title p-b-49">
						Please enter user details
					</span>
					<% Boolean s1  =false;
					if(session.getAttribute("userExist")!=null){
						s1=(boolean)session.getAttribute("userExist");	
					}
					%>
    				<% if(s1!=null && s1){ %>
    					<div class="text-left text-red p-t-8 p-b-31" >
					<span >
						${sessionScope.errorMsg}
					</span>
					</div>
   					 <% } session.setAttribute("userExist",null);%>
   					 
					
   					 
   					 
					<div class="wrap-input100 validate-input m-b-23" data-validate = "First Name is reauired">
						<span class="label-input100">First Name</span>
						<input class="input100" type="text" maxlength="30" name="firstName" >
						<span class="focus-input100" ></span>
						
					</div>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Last Name is reauired">
						<span class="label-input100">Last Name</span>
						<input class="input100" type="text" maxlength="30" name="lastName" >
						<span class="focus-input100" ></span>
					</div>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Email Id is reauired">
						<span class="label-input100">Email Id</span>
						<input class="input100" type="text" maxlength="30" name="emailId" >
						<span class="focus-input100" ></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" maxlength="30" name="username" >
						<span class="focus-input100" ></span>
					</div>

					<div class="wrap-input100 validate-input m-b-31" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" maxlength="16" min="6" name="password" >
						<span class="focus-input100" ></span>
					</div>
					
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type ="submit" class="login100-form-btn">
								Sign Up
							</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>