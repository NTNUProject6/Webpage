<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.CabinetUtils,java.util.Calendar"%>

<%! String Months[] = {
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December"
	};
%>

<!DOCTYPE html>
<html>
<head>
<title> 
	Booking
</title>
<!--For including Norwegian text in the webpage-->
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="main.css">

</head>

<%
int day = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
int month = Calendar.getInstance().get(Calendar.MONTH);
int year = Calendar.getInstance().get(Calendar.YEAR);
%>

<body>
	<%@ include file="WEB-INF/menu.jsp" %>	
	<div class="mainElement">	
<form action="container.jsp" method="post">
	<div class="row">
		<label for="date">StartDate:</label><br />
	
<select name="from_day">
	<%	for(int i = 1; i <= 31; i++) {%>
	<option value="<%= i %>"<%= day == i ? " selected" : "" %>><%= i %>
	<% } %>
</select>
<select name="from_month">
	<% for(int i = 0; i < 12; i++) { %>
	<option value="<%= (month + i) % 12 + 1 %>"><%= Months[(month + i) % 12] %>
	<% } %>
</select>
<select name="from_year">
	<option value="<%= year %>"><%= year %>
	<option value="<%= year + 1 %>"><%= year + 1 %>
</select>
		</div><label>EndDate:</label><br />
	
<select name="to_day">
	<%	for(int i = 1; i <= 31; i++) {%>
	<option value="<%= i %>"<%= day == i ? " selected" : "" %>><%= i %>
	<% } %>
</select>
<select name="to_month">
	<% for(int i = 0; i < 12; i++) { %>
	<option value="<%= (month + i) % 12 + 1 %>"><%= Months[(month + i) % 12] %>
	<% } %>
</select>
<select name="to_year">
	<option value="<%= year %>"><%= year %>
	<option value="<%= year + 1 %>"><%= year + 1 %>
</select>
<input id="submit_button" type="submit" value="submit" />
</form>
</div>
</body>
</html>