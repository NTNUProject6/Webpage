<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.CabinetUtils"%>
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
<select name="month">
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
<select name="year">
	<option value="2014">2014
	<option value="2015">2015
	<option value="2016">2016
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
</body>
</html>


