<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.CabinetUtils"%>

<div class="menu">
	<a href="index.jsp" >
    <img src="Images/koiene.png " alt="logo" class="thumbnails" />
    </a>
	<ul >	
		<li><a id="mybutton" href="index.jsp" title="Home">
		  <button>Home</button></a></li>
		<li><a id="mybutton" href="Registration.jsp" title="Registration">
		  <button>Register</button></a></li>
		<li><a id="mybutton" href="report.jsp" title="Report">
		  <button>Report</button></a></li>
		<% if(!CabinetUtils.IsAdmin(session)) { %>
		<li><a id="mybutton" href="Login.jsp" title="Admin Login">
			<button>Login</button></a></li>
		<% } else { %>
		<li><a id="mybutton" href="adminMap.jsp" title="Map">
			<button>Map</button></a></li>
		<li><a id="mybutton" href="logg.jsp" title="Report Log">
			<button>Report Log</button></a></li>
		<li><a id="mybutton" href="booking_log.jsp" title="Booking Log">
			<button>Booking Log</button></a></li>
		<li><a id="mybutton" href="wood_status.jsp" title="Wood Status">
			<button>Wood Status</button></a></li>
		<li><a id="mybutton" href="AdminLogout" title="Admin Logout">
		  <button>Logout</button></a></li>
		<% } %>
	</ul>
</div> 
