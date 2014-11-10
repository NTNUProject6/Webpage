<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.CabinetUtils"%>
<!DOCTYPE html>
<html>
<head>
<!--For including Norwegian text in the webpage-->
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="main.css">
<title>
	Login
</title>
<!--<img src="koiene_logo.gif" width="140" height="145">-->
</head>

<body>
<%@ include file="WEB-INF/menu.jsp" %>

<div class="mainElement">
<form action="AdminLogin" method="post"> 
<label>Password</label> <input type="password" name="formPassword" /> <br>
<input type="submit" value="Submit" name="submit" class="submitButton" /> 
</form>
</div>
<%@ include file="WEB-INF/footer.jsp" %>
</body>
</html>
