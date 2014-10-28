<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8", import="no.ntnu.cabinet.CabinetUtils"%>
<html>
<head>
<!--For including Norwegian text in the webpage-->

<title> 
	Home
</title>
</head>

<body>
<h1>NTNUI Cabins</h1>
	<div id="nav">
		<!--Home<br>-->
		<a id="mybutton" href="index.jsp" title="Home">
		  <button>Home</button>
		 </a>
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
		<% if(CabinetUtils.IsAdmin(session)) { %>
		<a id="mybutton" href="AdminLogout" title="Admin Logout">
		  <button>Logout</button>
		 </a>
	<% } %>
</div> 

<div>
<p>
NTNUI (NTNU sportsclubb) provides an exclusive feature for NTNU students and staffs, a net of 24 small cabins.
The cabins are widely distributed from the coast to high up in the mountains in Trøndelag district. 
These are run on voluntary basis by a group of students, named NTNUI Koiene.
</p>
</div>

<div id="footer">
Copyright © CabiNet.html
</div>

</body>
</html>