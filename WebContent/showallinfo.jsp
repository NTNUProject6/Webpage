<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="no.ntnu.cabinet.database.*,no.ntnu.cabinet.CabinetUtils,java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(!CabinetUtils.IsAdmin(session)) response.sendRedirect("index.jsp"); %>
<% Database db = new Database(); 
   for(int i = 1; i <= 23; i++) {
	   Cabin cabin = db.getCabin(i);
	   ArrayList<Report> reports = db.getReports(i);
	   ArrayList<Booking> bookings = db.getBooking(i);
	   %>
	   <h3><%= cabin.getName()%></h3>
	   <div>Wood left: <%= cabin.getWood() %></div>
	   <h4>Reports:</h4>
	   <% for(Report r : reports) { %>
	<div>Wood: <%= r.getWood()%> Damage: <%= r.getDamage()%> Missing: <%= r.getDamage()%> Other: <%= r.getOther() %> Report Date: <%= r.getReport_date()%> E-Mail: <%= r.getEmail()%></div>
	<% } %>
		<h4>Bookings:</h4>
	<% for(Booking b : bookings) {%>
	<div>EMail: <%= b.getUser_id() %> cabin_id: <%= b.getCabin_id() %> From: <%= b.getDate_From() %> To: <%= b.getDate_To() %></div>
	<% } %>
<% } %>

</body>
</html>