<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<!--For including Norwegian text in the webpage-->
<meta charset="UTF-8">
 <head>
 <link rel="stylesheet" type="text/css" href="main.css">
 <title>Report error</title>
 </head>
 <body>
 <%@ include file="menu.jsp" %>
 	<div class="mainElement">
       <div class="center_div">
	   <p>Could not register report. Reason: </p>
       <p> <%= request.getAttribute("error") %> </p>
		</div> 
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>