<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.database.*" %>

<!DOCTYPE html>
<html>
<!--For including Norwegian text in the webpage-->
<meta charset="UTF-8">
 <head>
 <link rel="stylesheet" type="text/css" href="main.css">
 <title>Confirmation page</title>
 </head>
 <body>
 <%@ include file="menu.jsp" %>
 	<div class="mainElement">
       <div class="center_div">
	   <p>Thank you for Registering cabins with NTNUI Koiene</p>
         Below is the summary of info provided:
        <%	Database db = new Database();
	   		if(request.getAttribute("booking_id") != null) {
	   			int booking_id = (Integer) request.getAttribute("booking_id");
	   			Booking b = db.getBookingById(booking_id);
	   			Cabin c = db.getCabin(b.getCabin_id());
	   	%>
	   	
	   	<p>Date: <%= b.getDate_From() %> - <%= b.getDate_To() %></p>
	   	<p>Contact: <%= b.getUser_id() %></p>
	   	<p>Cabin: <%= c.getName() %></p>
	   	
	   	<%}
	   	db.close();
	   	%>	
       <p> </p>
		</div> 
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>