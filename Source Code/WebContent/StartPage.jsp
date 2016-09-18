<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entities.User, java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Airline Booking System</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<div id="top_bar">
		<img id="small_logo" src="Pictures/logo.jpg" />
		<h3 id="top_bar_heading">Airline Booking System</h3>
	</div>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); // Proxies.
		request.getSession().invalidate();
		request.getSession().setAttribute("booking_active", false);
		Random random_generator = new Random();
		String background_picture = "Pictures/IMG" + (random_generator.nextInt(10) + 1) + ".JPG";
		request.getSession().setAttribute("background_picture", background_picture);
	%>




	<img src="<%=background_picture%>" id="background"></img>
	<div id="the_circle"></div>
	<img src="Pictures/user2.jpg" class="user_image" />
	<form action="Login.jsp" method="get">
		<input id="large_login_button" type="submit" value="Login" />
	</form>
	<div id="searchbox" class="box">
		<div id="search_input">
			<form action="SearchServlet" method="get" id="search_form">
				<datalist id='list1'>
				<option value='Stockholm - ARN' />
				<option value='Kopenhamn - CPH' />
				<option value='Beijing - PEK' />
				<option value='Dubai - DBX' />
				<option value='Tokyo - HND' />
				<option value='Hong Kong - HKG' />
				<option value='Singapore - SIN' />
				<option value='Kuala Lumpur - KUL' />
				</datalist>
				<input class="input_field airport_input" type="text" list="list1"
					placeholder="Origin" name="origin"
					id="origin" required /> <input class="input_field airport_input"
					type="text" list="list1" 
					placeholder="Destination" name="destination" id="destination"
					required /> <input class="input_field date_input" type="date"
					value="2016-03-12" placeholder="yymmdd" name="date" id="date"
					required /> <input class="input_field date_input" type="date"
					value="2016-03-13" placeholder="yymmdd" name="return_date"
					id="return_date" required /> <select name="nr_of_tickets"
					id="nr_of_tickets">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select> <input id="search_button" class="mybuttons" type="submit"
					value="Search" />
		</div>
		<div id="radio_buttons">
			<input class="radio_button" type="radio" value="true"
				name="type_of_flight" onClick="toggleReturn();" checked /> Return <input
				class="radio_button" type="radio" value="false"
				name="type_of_flight" onClick="toggleReturn();" /> One-Way Ticket
		</div>
	</div>
	</form>
</body>
</html>