<%@ page language="java" %>
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
		<a id="mybutton" href="index.html" title="Home">
		  <button>Home</button>
		 </a>
		<!--Register<br>-->
		<a id="mybutton" href="Registration.html" title="Registration">
		  <button>Register</button>
		 </a>
		<!--Contact<br>-->
		<a id="mybutton" href="report.html" title="Report">
		  <button>Report</button>
		 </a>
		<!--Login<br>-->
		<a id="mybutton" href="Login.html" title="Admin Login">
		  <button>Login</button>
		 </a>
</div> 
	<% if(session.getAttribute("isAdmin") != null &&
	(Boolean)session.getAttribute("isAdmin") == true) { %>
		<a id="mybutton" href="AdminLogout" title="Admin Logout">
		  <button>Logout</button>
		 </a>
	<% } %>

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