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
	   <p>Thank you for sending a report about your stay with NTNUI Koiene</p>
         Below is the summary of info provided:
        <%	Database db = new Database();
	   		if(request.getAttribute("report_id") != null) {
	   			int report_id = (Integer) request.getAttribute("report_id");
	   			Report r = db.getReportById(report_id);
	   			Cabin c = db.getCabin(r.getCabin_id());
	   	%>
	   	<p>Date: <%= r.getReport_date() %></p>
	   	<p>Contact: <%= r.getEmail() %></p>
	   	<p>Cabin: <%= c.getName() %></p>
	   	<p>Wood left: <%= r.getWood() >= 0 ? r.getWood() : "N/A" %></p>
	   	<p>Damaged: <%= r.getDamage() %></p>
	   	<p>Missing: <%= r.getMissing() %></p>
	   	<p>Other: <%= r.getOther() %></p>
	   	<%}
	   	db.close();
	   	%>	
       <p> </p>
		</div> 
	</div>
</body>
</html>