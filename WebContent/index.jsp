<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.CabinetUtils"%>
<html>
<head>
<!--For including Norwegian text in the webpage-->
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="main.css">
<title> 
	Home
</title>
</head>

<body>
<%@ include file="WEB-INF/menu.jsp" %>

 <div class="mainElement">
  <div class="center_div">
		<img src="Images/Home.jpg" class="header_image" alt="welcome" />
		  <p>Welcome to CabiNet.</p>
		  <p>This is the booking and administration web page for the NTNUI Koiene.</p>

		  <p>For more information about the cabins, history and pricing of the cabin service, please visit the NTNUI koiene official web page at <a href="http://org.ntnu.no/koiene/">http://org.ntnu.no/koiene/</a>.</p>

		  <p>Have a nice stay!</p>

  </div>
</div>  
<%@ include file="WEB-INF/footer.jsp" %>
</body>
</html>
