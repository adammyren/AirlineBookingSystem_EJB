<%@page import="entities.MyPagesBookingElement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,entities.Flight"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Pages</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/mypages.css">
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
		request.setAttribute("booking_active", false);
		String background_picture = (String) request.getSession().getAttribute("background_picture");
		if (background_picture == null)
			background_picture = "Pictures/IMG1.JPG";
	%>

	<img src="<%=background_picture%>" id="background"></img>
	<div id="the_circle"></div>
	<img src="Pictures/user_adam.jpg" class="user_image" />
	<form action="LogoutServlet" method="get">
		<input id="large_login_button" type="submit" value="Logout" />
	</form>
	<div id="searchbox" class="box">
		<div id="search_input">
			<form action="SearchServlet" method="get" id="search_form">
				<div>
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
				</div>
				<input class="input_field airport_input" type="text" list="list1"
					placeholder="Origin" name="origin" id="origin" required /> <input
					class="input_field airport_input" type="text" list="list1"
					placeholder="Destination" name="destination"
					id="destination" required /> <input class="input_field date_input"
					type="date" value="2016-03-12" placeholder="yymmdd" name="date"
					id="date" required /> <input class="input_field date_input"
					type="date" value="2016-03-13" placeholder="yymmdd"
					name="return_date" id="return_date" required /> <select
					name="nr_of_tickets" id="nr_of_tickets">
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
	<div id=display_information>
		<div id="information_box" class="box">
			<h1>My Flights</h1>
			<%
				ArrayList<MyPagesBookingElement> booking_elements = (ArrayList<MyPagesBookingElement>) request.getSession()
						.getAttribute("booking_elements");
				int counter = 1;
				int nr_of_elements = booking_elements.size();
				for (MyPagesBookingElement e : booking_elements) {
			%>
			<form class="flight_element" action="DeleteBookingServlet"
				method="post">
				<div class="passenger_name"><%=e.getFirstname() + " " + e.getLastname()%></div>
				<%=e.getOrigin() + "\t|" + e.getDuration() + "|\t" + e.getDestination() + "|\t" + e.getDate() + " " + e.getDeparture_time()%>
				<input class="cancel_button" type="button" id="input<%=counter%>"
					onClick="showConfirm('<%=counter%>','<%=nr_of_elements%>')"
					value="Cancel"></input> <input class="confirm_button" type="hidden"
					id="confirm<%=counter%>" value="Confirm"></input> <input
					type="hidden" name="date" value="<%=e.getDate()%>" /> <input
					type="hidden" name="flight_id" value="<%=e.getId()%>" /> <input
					type="hidden" name="passportnr" value="<%=e.getPassportnr()%>" />
			</form>
			<%
				counter++;
				}
			%>

		</div>
	</div>
</body>
<html />