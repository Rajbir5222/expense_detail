<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
</head>
<body>
<div class="limiter">
<%if(session.getAttribute("user_id")!=null) {
	%>
<div class="topnav">
				<a  href="expenseDetails.jsp">New Submission</a> <a href="<%=request.getContextPath()%>/expenses">View Submissions</a> <a
					class="active" href="contact.jsp">Contact</a> <a href="<%=request.getContextPath()%>/logout" style="float: right;">Logout</a>
			</div>
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
			<span style="font-family: Poppins-Bold;">
				For any queries please contact below email id or mobile:<br><br></span>
			<span>Email Id: rajbirsighg4@gmail.com<br><br>
				Mobile: 999999999
			</span>
				
			</div>
		</div>
		<%} else{%>
		<div class="text-center p-t-100 p-b-31">
			<span class="p-b-31">User have been logged out. Please login
				again.</span> <br> <a href="index.jsp"> Login </a>
		</div>
		<%} %>
	</div>
</body>
</html>