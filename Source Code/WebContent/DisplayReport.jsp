<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entities.Entity,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/displayreport.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Report</title>
</head>
<body>
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
	<div class="box" id="display_box">
		<h1>Report</h1>
		<%
			ArrayList<Entity> entities = (ArrayList<Entity>) request.getAttribute("entities");
			int counter = 1;
			for (Entity e : entities) {
		%>
		<div class="box display_element"><%=e%></div>
		<%
			counter++;
			}
		%>
		<form action="AdminPage.jsp">
			<input class="mybuttons" id="back_button" type="submit" value="Back" />
		</form>

	</div>
</body>
</html>