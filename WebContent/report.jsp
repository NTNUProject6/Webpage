<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.CabinetUtils,java.util.Calendar"%>
<!DOCTYPE html>
<html>
<!--For including Norwegian text in the webpage-->
<meta charset="UTF-8">
<head>
<link rel="stylesheet" type="text/css" href="main.css">

<title> 
	Reporting
</title>
</head>

<%!
	String Months[] = {
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

<%
Calendar now = Calendar.getInstance();
Calendar end = Calendar.getInstance();
end.add(Calendar.MONTH, -2);
int day = now.get(Calendar.DAY_OF_MONTH);
int month = now.get(Calendar.MONTH) + 1;
int year = now.get(Calendar.YEAR);
%>

<body>
<%@ include file="WEB-INF/menu.jsp" %>

<div class="mainElement">	
<form id="contact_form" action="RegisterReport" method="post">
	<div class="row">
		<label for="cabin">Cabin Name:</label>
         <select name="cabin_id">             
                <option value="1">Flåkoia</option>
                <option value="2">Fosenkoia</option>
                <option value="3" selected>Heinfjordstua</option>
                <option value="4">Hognabu</option>
				<option value="5">Holmsåkoia</option>
                <option value="6">Holvassgamma</option>
                <option value="7">Iglbu</option>
                <option value="8">Kamtjønnkoia</option>
				<option value="9">Kråklikåten</option>
                <option value="10">Kvernmovollen</option>
                <option value="11">Kåsen</option>
				<option value="12">Lynhøgen</option>
                <option value="13">Mortenskåten</option>
                <option value="14">Nicokoia</option>
				<option value="15">Rindalsløa</option>
				<option value="16">Selbukåten</option>
                <option value="17">Sonvasskoia</option>
                <option value="18">Stabburet</option>
				<option value="19">Stakkslettbua</option>
                <option value="20">Telin</option>
                <option value="21">Taagaabu</option>
				<option value="22">Vekvessætra</option>
                <option value="23">Øvensenget</option>
				
         </select>

			</div>
	<div class="row">
		<label for="date">Date:</label>
	
<select name="day">
	<%	for(int i = 1; i <= 31; i++) {%>
	<option value="<%= i %>"<%= day == i ? " selected" : "" %>><%= i %>
	<% } %>
</select>
<select name="month">
	<% for(int i = 2; i >= 0; i--) { %>
	<option value="<%= (month + 11 - i) % 12 + 1 %>"<%= i == 0 ? " selected" : "" %>><%= Months[(month + 11 - i) % 12] %>
	<% } %>
</select>
<select name="year">
	<% if(end.get(Calendar.YEAR) < now.get(Calendar.YEAR)) { %>
	<option value="<%= year-1 %>"><%= year-1 %>
	<% } %>
	<option value="<%= year %>" selected><%= year %>
</select>
		</div>
	<div class="row">
		<label for="email">Your email:</label>
		<input id="email" class="input" name="email" type="text" value="" size="30" /><br />
	</div>
	<div class="row">
		<label for="wood">Wood left:</label>
		
	<select name="wood">
	<option value="na" selected>N/A
	 <option value="0">0
	 <option value="1">1
	 <option value="2">2
	 <option value="3">3
	 <option value="4">4
	<option value="5">5
	<option value="6">6
	<option value="7">7
	<option value="8">8
	<option value="9">9
	<option value="10">10
	<option value="11">12
	 <option value="13">13
	 <option value="14">14
	<option value="15">15
	<option value="16">16
	<option value="17">17
	<option value="18">18
	<option value="19">19
	<option value="20">20
	</select>
		
	</div>
	<div class="row">
		<label for="damage">Damaged Item:</label><br />
		<input type="text" id="damage" class="input" name="damage" size="30"></input><br />
	</div>
	<div class="row">
		<label for="missing">Items missing from cabin:</label><br />
		<input type="text" id="missing" class="input" name="missing" size="30"></input><br />
	</div>
	<div class="row">
		<label for="other">Forgotten Items / Other:</label><br />
		<input type="text" id="other" class="input" name="other" size="30"></input>
	</div>
	<input id="submit_button" type="submit" value="submit" />
</form>			

</div>
<%@ include file="WEB-INF/footer.jsp" %>
</body>
</html>