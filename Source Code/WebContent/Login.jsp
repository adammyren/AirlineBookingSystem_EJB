
<%@ page import="java.util.ArrayList,entities.Flight;"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/login.css">

</head>
<body>
	<script type="text/javascript" src="js/script.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			toggleRegister();
		});
	</script>
	<div id="top_bar">
		<img id="small_logo" src="Pictures/logo.jpg" />
		<h3 id="top_bar_heading">Airline Booking System</h3>
	</div>
	<%
		String background_picture = (String) request.getSession().getAttribute("background_picture");
		if(background_picture==null)
			background_picture="Pictures/IMG1.JPG";
	%>

	<script type="text/javascript" src="search.js"></script>

	<img src="<%=background_picture%>" id="background"></img>
	<div id="the_circle"></div>
	<img src="Pictures/user2.jpg" class="user_image" />
	<div class="box" id="login_box">
		<h1 id="login_heading">Login</h1>
		<form action="LoginServlet" metod="post">
			<input class="input_field login_input" type="text"
				placeholder="Username" name="username" required /> <input
				class="input_field login_input" type="password"
				placeholder="Password" name="password" required /> <input
				class="input_field login_input" type="password"
				placeholder="Repeat Password" name="password_repeat"
				id="password_repeat" /> <input class="input_field login_input"
				type="email" placeholder="email" name="email" id="email" /> <input
				id="login_button" type="submit" value="Login" class="mybuttons" />
		</form>
		<p onClick="toggleRegister()" id="toggle_button">Register New User</p>
	</div>
	<%
		Boolean login_error = (Boolean) request.getAttribute("login_error");
		if (login_error != null && login_error == true) {
	%>
	<div id="error_box" class="box">Wrong Username or Password</div>
	<%
		}
	%>



</body>
</html>