<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date,java.util.Calendar,
		no.ntnu.cabinet.CabinetUtils,no.ntnu.cabinet.database.*" %>
<!DOCTYPE html>
<html>
<!--For including Norwegian text in the webpage-->
<meta charset="UTF-8">
 <head>
 <link rel="stylesheet" type="text/css" href="main.css">
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 <script src="container.js"></script>

 <title>Cabins</title>
 </head>
 
 <% Date from_date;
 	Date to_date;
 	String from_date_string;
 	String to_date_string;
 	RequestDispatcher erd = request.getRequestDispatcher("WEB-INF/register_error.jsp");
 	try {
	   	from_date_string = request.getParameter("from_day")
	   		+ "-" + request.getParameter("from_month") 
	   		+ "-" + request.getParameter("from_year");
	   	to_date_string = request.getParameter("to_day") 
	  	 	+ "-" + request.getParameter("to_month") 
	  	 	+ "-" + request.getParameter("to_year");
	
	   	SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
	   	from_date = sdf.parse(from_date_string);
	   	to_date = sdf.parse(to_date_string);
	} catch(Exception e) {
		request.setAttribute("error", "Invalid date values.");
		erd.forward(request, response);
		return;
 	}
	
 	String date_error = CabinetUtils.ValidateBookingDates(from_date, to_date);
 	if(date_error != null) {
 		request.setAttribute("error", date_error);
 		erd.forward(request, response);
 		return;
 	}
   	
   	boolean[] cabin_is_free = new boolean[23]; 	
   	for(int i = 1; i <= 23; i++) {
   		cabin_is_free[i-1] = !CabinetUtils.BookingCollides(i, from_date, to_date);
   	}
  %>

 <body>
<%@ include file="WEB-INF/menu.jsp" %>

<div class="mainElement">
 <form action="RegisterBooking" method="post">
 <input type="hidden" name="from_date" value="<%= from_date_string %>">
 <input type="hidden" name="to_date" value="<%= to_date_string %>">
  <div class="mailsubmit"><sup>Email</sup><input type="email" name="email" placeholder="me@example.com">*
 <button>Submit</button></div>	
         <fieldset>
         <% Database db = new Database();
         	for(int i = 1; i <= 23; i++) {
        	 Cabin c = db.getCabin(i);
        	 if(cabin_is_free[i-1]) {%>
			 <div class="container collapsed">
			  <div class="header">
			  <input type ="radio" name ="cabins" value ="<%= i %>"> 
			  <img src="Images/<%= i %>_1.jpg" /><%= c.getName() %> </div><br /> 
				<div class="content">
					<div><a href="Images/<%= i %>_2.jpg"><img src="Images/<%= i %>_3.jpg"></a></div>
					<div><ul id="info">
					 <li>No.of beds: <%= c.getCapacity() %></li>
					 <li>Location: <%= c.getLocation() %></li>
					 <li>Difficulty: <%= c.getDifficulty() %></li>
					</ul></div>
			 </div>
			</div>
			 <%  }
        	 }
         	db.close();
         	%>
         </fieldset>
 </form>
 </div>
 <%@ include file="WEB-INF/footer.jsp" %>
 </body>
</html>
