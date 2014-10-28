<!DOCTYPE html>
<html>
<head>
<!--For including Norwegian text in the webpage-->
<meta charset="UTF-8">
<title> 
	Login
</title>

<!--<img src="koiene_logo.gif" width="140" height="145">-->
</head>

<body>
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


<form action="AdminLogin" method="post"> 
<label>Username</label> <input type="text" name="username" /> <br>
<label>Password</label> <input type="password" name="formPassword" /> <br>
<input type="submit" value="Submit" name="submit" class="submitButton" /> 
</form>
</body>
</html>
