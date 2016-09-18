<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Enter Passenger Details</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/putinformation.css">

</head>
<body>

	<div id="top_bar">
		<img id="small_logo" src="Pictures/logo.jpg"/>
		<h3 id="top_bar_heading">Airline Booking System</h3>
	</div>
	<%
	String background_picture = (String)request.getSession().getAttribute("background_picture");
	if(background_picture==null)
		background_picture="Pictures/IMG1.JPG";
	%>
	<img src="<%=background_picture %>" id="background"></img>
	<div id="the_circle"></div>
	<% 
	Boolean book_error = (Boolean)request.getAttribute("book_error");
	
	if(book_error!=null&&book_error==true){
		%>
		<div id="error_box" class="box">
		Unable to book all passengers on this flight. One or more passenger might already be booked on this flight.
		</div>
		<br/>
		<br/>
		<%		
	}	
	
	%>
	<div class="box" id="information_box">
	<h1>Enter Passenger Information</h1>
		<form action="ConfirmAndPay.jsp">
			<%
				int nr_of_tickets = (Integer) request.getSession().getAttribute("nr_of_tickets");
				for (int i = 1; i <= nr_of_tickets; i++) {
			%>
			<h3>Passenger <%=i %></h3>
			<div><input class="input_field" type="text" 
				placeholder="Firstname" name="firstname<%=i%>" required/> <input
				class="input_field" type="text"
				placeholder="Lastname" name="lastname<%=i%>" required/></div>
				<div><input
				class="input_field" type="text" 
				placeholder="Passport Number" name="passportnr<%=i%>"required /> <input
				class="input_field" type="date" 
				placeholder="Passport Date of Expire" name="passportexp<%=i%>" value ="2019-06-03" required/></div>
				<div><input
				class="input_field" type="date" 
				placeholder="Passport Date of Issue" name="passportish<%=i%>" value="2014-06-03" required/> <input
				class="input_field" type="date"  
				placeholder="Date of Birth" name="birth<%=i%>" value="1992-04-16" required/></div><br/>

			<%
				}
			%>
			<input value="Next" id="information_next_button" class="mybuttons" type="submit" />
		</form>
		<form   action="IndexServlet"><input id="information_cancel_button" class="mybuttons" type="submit" value="Cancel"/></form>
	</div>
</body>
</html>