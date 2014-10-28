<!DOCTYPE html>
<html>
<head>
<div id="nav">
		<!--Home<br>-->
		<a id="mybutton" href="index.jsp" title="Home">
		  <button>Home</button>
		 </a>
		<!-- <a href="Homepage.html" target="_blank">Home</a>-->
		<!--Register<br>-->
		<a id="mybutton" href="Registration.jsp" title="Registration">
		  <button>Register</button>
		 </a>
		<!--Contact<br>-->
		<a id="mybutton" href="report.jsp" title="Report">
		  <button>Report</button>
		 </a>
		<!--Login<br>-->
		<a id="mybutton" href="Login.jsp" title="Admin Login">
		  <button>Login</button>
		 </a>
		 
	<% if(session.getAttribute("isAdmin") != null &&
		(Boolean)session.getAttribute("isAdmin") == true) { %>
		<a id="mybutton" href="AdminLogout" title="Admin Logout">
		  <button>Logout</button>
		 </a>
	<% } %>

	</div>
<title> 
	Reporting
</title>
<!--For including Norwegian text in the webpage-->
<meta charset="UTF-8">
<form id="contact_form" action="#" method="POST" enctype="multipart/form-data">
	<div class="row">
		<label for="cabin">Cabin Name:</label>
		<form>
         <select name="Cabin Name">
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
      </form>
			</div>
	<div class="row">
		<label for="date">Date:</label>
	
<select name="day">
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
	 <option value="1">January
	 <option value="2">February
	 <option value="3">March
	 <option value="4">April
	 <option value="5">May
	<option value="6">June
	<option value="7">July
	<option value="8">August
	<option value="9">September
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
		<textarea id="damage" class="input" name="damage" rows="7" cols="30"></textarea><br />
	</div>
	<div class="row">
		<label for="missing">Missing Item:</label><br />
		<textarea id="missing" class="input" name="missing" rows="7" cols="30"></textarea><br />
	</div>
	<input id="submit_button" type="submit" value="submit" />
</form>			
</head>

<body>

</body>
</html>


