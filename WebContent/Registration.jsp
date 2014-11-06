<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.CabinetUtils"%>
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

<body>
	<%@ include file="WEB-INF/menu.jsp" %>	
	<div class="mainElement">	
<form action="container.jsp" method="post">
	<div class="row">
		<label for="date">StartDate:</label><br />
	
<select name="from_day">
	<option value="01">1
	<option value="2">2
	<option value="03">3
	<option value="04">4
	<option value="05">5
	<option value="06">6
	<option value="07">7
	<option value="08">8
	<option value="09">9
	<option value="10">10
	<option value="11">11
	<option value="12">12
	<option value="13">13
	<option value="14">14
	<option value="15">15
	<option value="16">16
	<option value="17">17
	<option value="18">18
	<option value="19">19
	<option value="20">20
	<option value="21">21
	<option value="22">22
	<option value="23">23
	<option value="24">24
	<option value="25">25
	<option value="26">26
	<option value="27">27
	<option value="28">28
	<option value="29">29
	<option value="30">30
	<option value="31">31
</select>
<select name="from_month">
	 <option value="01">January
	 <option value="02">February
	 <option value="03">March
	 <option value="04">April
	 <option value="05">May
	<option value="06">June
	<option value="07">July
	<option value="08">August
	<option value="09">September
	<option value="10">October
	<option value="11">November
	<option value="12">December
</select>
<select name="from_year">
	<option value="2014">2014
	<option value="2015">2015
	<option value="2016">2016
</select>
		</div><label>EndDate:</label><br />
	
<select name="to_day">
	<option value="01">1
	<option value="02">2
	<option value="03">3
	<option value="04">4
	<option value="05">5
	<option value="06">6
	<option value="07">7
	<option value="08">8
	<option value="09">9
	<option value="10">10
	<option value="11">11
	<option value="12">12
	<option value="13">13
	<option value="14">14
	<option value="15">15
	<option value="16">16
	<option value="17">17
	<option value="18">18
	<option value="19">19
	<option value="20">20
	<option value="21">21
	<option value="22">22
	<option value="23">23
	<option value="24">24
	<option value="25">25
	<option value="26">26
	<option value="27">27
	<option value="28">28
	<option value="29">29
	<option value="30">30
	<option value="31">31
</select>
<select name="to_month">
	 <option value="01">January
	 <option value="02">February
	 <option value="03">March
	 <option value="04">April
	 <option value="05">May
	<option value="06">June
	<option value="07">July
	<option value="08">August
	<option value="09">September
	<option value="10">October
	<option value="11">November
	<option value="12">December
</select>
<select name="to_year">
	<option value="2014">2014
	<option value="2015">2015
	<option value="2016">2016
</select>
<input id="submit_button" type="submit" value="submit" />
</form>
	</div>
</body>
</html>
