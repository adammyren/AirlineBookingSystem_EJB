<%@ page language="java"%>
<%@ page import="entities.Flight, java.util.ArrayList"%>
<HTML>
<HEAD>
<TITLE>Select Flight</TITLE>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/selectflight.css">
</HEAD>
<BODY>

	<div id="top_bar">
		<img id="small_logo" src="Pictures/logo.jpg" />
		<h3 id="top_bar_heading">Airline Booking System</h3>
	</div>
	<%
		String background_picture = (String) request.getSession().getAttribute("background_picture");
		if(background_picture==null)
			background_picture="Pictures/IMG1.JPG";
	%>
	<img src="<%=background_picture%>" id="background"></img>
	<div id="the_circle"></div>

	<%
		ArrayList<Flight> flight_list = (ArrayList<Flight>) request.getSession().getAttribute("list_of_flights");
		ArrayList<Flight> return_list = (ArrayList<Flight>) request.getSession().getAttribute("list_of_returns");
		Boolean return_ticket = (Boolean)request.getSession().getAttribute("return_ticket");
		if (flight_list.isEmpty() || (return_list.isEmpty()&&return_ticket)) {
	%>
	<div class="box" id="no_flight_box">
		<h1 id="no_flights_available_heading">No Flights Available at the
			selected dates</h1>
	</div>
	<form action="IndexServlet">
		<input type="submit" value="New Search" id="make_new_search"
			class="mybuttons" />
	</form>
	<%
		} else {
	%>
	<div class="box" id="select_flight_box">
		<h1>Outbound Flights</h1>
		<form action="SelectFlightServlet" method="post">
			<%
				boolean user_active = request.getSession().getAttribute("user") == null;
					int counter = 0;
					for (Flight f : flight_list) {
			%>
			<div class="flight_element">
				<input type="radio" value="<%=counter%>" name="flight" checked />
				<%=f.toString()%>
			</div>
			<%
				counter++;
					}

					if ((Boolean) request.getSession().getAttribute("return_ticket")) {
			%><h1>Return Flights</h1>
			<%
				counter = 0;
						for (Flight f : return_list) {
			%>
			<div class="flight_element">
				<input type="radio" value="<%=counter%>" name="return" checked />
				<%=f.toString()%>
			</div>
			<%
				counter++;
						}
					}
			%>
			<input id="next_select_flight" class="mybuttons" type="submit"
				value="Next" />
		</form>
		<form action="IndexServlet">
			<input type="submit" value="Cancel" id="cancel_select_flight"
				class="mybuttons" />
		</form>
		<%
			}
		%>
	</div>
</BODY>