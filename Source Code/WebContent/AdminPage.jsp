<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entities.Flight"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/adminpage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>

	<%
		String background_picture = (String) request.getSession().getAttribute("background_picture");
		if(background_picture==null)
			background_picture="Pictures/IMG1.JPG";
	%>
	<div id="top_bar">
		<img id="small_logo" src="Pictures/logo.jpg" />
		<h3 id="top_bar_heading">Airline Booking System</h3>
	</div>
	<img src="<%=background_picture%>" id="background"></img>
	<div id="the_circle"></div>
	
	<form action="StartPage.jsp">
		<input type="submit" class="mybuttons" id="logout_button" value="Logout"/>
	</form>
	
	<div class="box" id="report_box">
		<h1>Create Report</h1>
		<form action="ReportServlet" method="get">
			<input type="text" name="flight_id" placeholder="Flight ID"
				class="input_field" /> <input type="date" name="date"
				 class="input_field" /> <input type="hidden"
				name="type_of_entity" value="passenger" /><input type="submit"
				class="mybuttons" value="Passenger list" />
		</form>
		<form action="ReportServlet" method="get">
			<input type="text" disabled="true" value="No Input Needed" class="input_field" id="user_input_field"/>
			<input type="hidden" name="type_of_entity" value="user" /> <input
				type="submit" id="get_users_button" class="mybuttons" value="Get All Users" />
		</form>
	</div>
	<%
		if (request.getAttribute("flight_to_edit") == null) {
	%>
	<div class="box" id="edit_flight_box">
		<h1>Edit Flight</h1>
		<form action="FlightInformationServlet" method="get">
			<div>
				<input type="text" name="flight_id" 
					placeholder="Flight ID" class="input_field" required /> <input
					type="date" name="date"  class="input_field" required />
			</div>
			<div>
				<input type="text" disabled="true" name="departure_time"
					placeholder="Departure Time" class="input_field" required /> <input
					type="text" disabled="true" name="duration" placeholder="Duration"
					class="input_field" required />
			</div>
			<div>
				<input type="text" disabled="true" name="destination"
					placeholder="Destination" class="input_field" required /> <input
					type="text" disabled="true" name="origin" placeholder="Origin"
					class="input_field" required />
			</div>
			<input type="text" disabled="true" name="capacity"
				placeholder="Capacity" class="input_field" required />
				<input type="text" disabled="true" name="price"
				placeholder="Price" class="input_field" required /> <input
				type="submit" class="mybuttons" id="get_information_button"
				value="Get Current Flight Information" />
		</form>
	</div>
	<%
		} else {
			Flight flight = (Flight) request.getAttribute("flight_to_edit");
	%>
	<div class="box" id="edit_flight_box">
		<h1>Edit Flight</h1>
		<form action="EditFlightServlet" method="post">
			<div>
				<input type="text" disabled="true" value="<%=flight.getId()%>"
					class="input_field" /> <input type="date" name="date"
					disabled="true" value="<%=flight.getDate()%>" class="input_field" />
				<input type="hidden" name="flight_id" value="<%=flight.getId()%>"
					placeholder="Flight ID" class="input_field" required /> <input
					type="hidden" name="date" value="<%=flight.getDate()%>"
					class="input_field" required />
			</div>
			<div>
				<input type="text" name="departure_time"
					placeholder="Departure Time"
					value="<%=flight.getDeparture_time()%>" class="input_field"
					required /> <input type="text" name="duration"
					value="<%=flight.getDuration()%>" placeholder="Duration"
					class="input_field" required />
			</div>
			<div>
				<input type="text" name="destination"
					value="<%=flight.getDestination()%>" placeholder="Destination"
					class="input_field" required /> <input type="text" name="origin"
					value="<%=flight.getOrigin()%>" placeholder="Origin"
					class="input_field" required />
			</div>
			<input type="text" name="capacity" value="<%=flight.getCapacity()%>"
				placeholder="Capacity" class="input_field" required />
				<input type="text" name="price" value="<%=flight.getPrice()%>"
				placeholder="Price" class="input_field" required /> <input
				type="submit" id="edit_flight_button" class="mybuttons" value="Edit Flight Information" />
		</form>
		<form action="AdminPage.jsp" class="confirm_form">
				<input class="mybuttons" type="submit" value="Cancel"
					id="cancel_button" />
		</form>
	</div>


	<%
	Boolean update_error = (Boolean)request.getAttribute("update_error");
	if(update_error!=null)
		System.out.println(update_error);
	
	if(update_error!=null&&update_error==true){
		System.out.println("Nu skapar vi en box");
		%>
		<div  class="box error_box" id="update_error_box">
		The specified flight could not be updated due to invalid input, please try again
		</div>
		<%		
		}	
	}
	%>
	}

	<div class="box" id="add_flight_box">
		<h1>Add New Flight</h1>
		<form action="AddFlightServlet" method="post">
			<div>
				<input type="text" name="flight_id" 
					placeholder="Flight ID" class="input_field" required /> <input
					type="date" name="date" value="date" class="input_field" required />
			</div>
			<div>
				<input type="text" name="departure_time"
					placeholder="Departure Time" class="input_field" required /> <input
					type="text" name="duration" placeholder="Duration"
					class="input_field" required />
			</div>
			<div>
				<input type="text" name="destination" placeholder="Destination"
					class="input_field" required /> <input type="text" name="origin"
					placeholder="Origin" class="input_field" required />
			</div>
			<input type="text" name="capacity" placeholder="Capacity"
				class="input_field" required />
				<input type="text" name="price" placeholder="Price"
				class="input_field" required /> <input type="submit"
				class="mybuttons" id="add_flight_button" value="Add Flight" />
		</form>
	</div>
	<%
		Boolean add_flight_error = (Boolean) request.getAttribute("add_flight_error");

		if (add_flight_error != null && add_flight_error == true) {
	%>
	<div id="error_box" class="box error_box">Could not add new flight. Please
		make sure that the specified airport is available and that a flight
		with the specified flight number does not already exists.</div>
	<%
		}
	%>

</body>
</html>