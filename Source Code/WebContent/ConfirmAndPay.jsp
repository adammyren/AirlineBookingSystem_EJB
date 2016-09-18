<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, entities.Flight"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/confirmandpay.css">
<title>Confirm Booking</title>
</head>
<body>
	<div id="top_bar">
		<img id="small_logo" src="Pictures/logo.jpg" />
		<h3 id="top_bar_heading">Airline Booking System</h3>
	</div>

	<%
		String background_picture = (String) request.getSession().getAttribute("background_picture");
		if (background_picture == null)
			background_picture = "Pictures/IMG1.JPG";
		System.out.println(background_picture);
	%>
	<img src="<%=background_picture%>" id="background"></img>
	<div id="the_circle"></div>
	<form action="BookingServlet" method="post" class="confirm_form">
		<div class="box" id="details_box">
			<h1>Review Details</h1>

			<%
				int nr_of_tickets = (Integer) request.getSession().getAttribute("nr_of_tickets");
				Flight flight = (Flight) request.getSession().getAttribute("flight");
				String firstname;
				String lastname;
				String passportnr;
				String passportexp;
				String passportish;
				String birth;
				int total_price = 0;
				for (int i = 1; i <= nr_of_tickets; i++) {
					firstname = request.getParameter("firstname" + i);
					lastname = request.getParameter("lastname" + i);
					passportnr = request.getParameter("passportnr" + i);
					passportexp = request.getParameter("passportexp" + i);
					passportish = request.getParameter("passportish" + i);
					birth = request.getParameter("birth" + i);
			%>
			<input type=hidden name="firstname<%=i%>" value="<%=firstname%>" />
			<input type="hidden" name="lastname<%=i%>" value="<%=lastname%>" />
			<input type="hidden" name="passportnr<%=i%>" value="<%=passportnr%>" />
			<input type="hidden" name="passportexp<%=i%>"
				value="<%=passportexp%>" /> <input type="hidden"
				name="passportish<%=i%>" value="<%=passportish%>" /> <input
				type="hidden" name="birth<%=i%>" value="<%=birth%>" />
			<div class="flight_element">
			<%total_price = total_price + Integer.parseInt(flight.getPrice()); %>
				<div class="passenger_name">
					<%=firstname + " " + lastname%>
				</div>
				<%=flight.toString()%>
			</div>
			<%
				Boolean return_ticket = (Boolean)request.getSession().getAttribute("return_ticket");
				if (return_ticket!=null&&return_ticket) {
						Flight return_flight = (Flight) request.getSession().getAttribute("return");
			%>
			<div class="flight_element">
			<%total_price = total_price + Integer.parseInt(flight.getPrice()); %>
				<div class="passenger_name">
					<%=firstname + " " + lastname%>
				</div>
				<%=return_flight.toString()%>
			</div>
			<%
				}
			}
			%>
		<h2>Total Amount: <%=total_price %> SGD<h2>
		</div>
		<div class="box" id="payment_box">
			<h1>Payment Details</h1>
			<div>
				<input type="text" name="cardnumber"
					placeholder="XXXX XXXX XXXX XXXX" class="input_field"> <input
					type="text" name="name" placeholder="Name on Card"
					class="input_field" />
			</div>
			<div>
				<input type="text" name="expire" placeholder="yymm"
					class="input_field" width="2vw" /> <input type="text" name="CVC"
					placeholder="CVC" class="input_field" width="2vw">
			</div>


			<input type="submit" value="Book" class="mybuttons" id="book_button">
		</div>
	</form>
	<form action="IndexServlet" class="confirm_form">
		<input class="mybuttons" type="submit" value="Cancel"
			id="cancel_button" />
	</form>
</body>
</html>