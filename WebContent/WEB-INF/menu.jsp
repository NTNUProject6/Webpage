<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.CabinetUtils"%>

<div class="menu">
	<a href="index.jsp" >
    <img src="Images/koiene.png " alt="logo" class="thumbnails" />
    </a>
	<ul >	
		<!--Home<br>-->
		<li><a id="mybutton" href="index.jsp" title="Home">
		  <button>Home</button></a></li>
		<!-- <a href="Homepage.html" target="_blank">Home</a>-->
		<!--Register<br>-->
		<li><a id="mybutton" href="Registration.jsp" title="Registration">
		  <button>Register</button>
		 </a></li><!--Contact<br>-->
		<li><a id="mybutton" href="report.jsp" title="Report">
		  <button>Report</button></a></li>
		<% if(!CabinetUtils.IsAdmin(session)) { %>
	<!--Login<br>-->
		<li><a id="mybutton" href="Login.jsp" title="Admin Login">
			<button>Login</button></a></li>
		<% } else { %>
		<li><a id="mybutton" href="AdminLogout" title="Admin Logout">
		  <button>Logout</button></a></li>
		<li><a id="mybutton" href="adminMap.jsp" title="Map">
			<button>Map</button></a></li>
		<li><a id="mybutton" href="logg.jsp" title="Report Log">
			<button>Report Log</button></a></li>
		<% } %>
	</ul>
</div> 
