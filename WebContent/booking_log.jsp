<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,java.text.SimpleDateFormat, 
    no.ntnu.cabinet.CabinetUtils,no.ntnu.cabinet.database.*"%>

<%	if(!CabinetUtils.IsAdmin(session))
		request.getRequestDispatcher("WEB-INF/notadmin.jsp").forward(request, response);
%>
<!DOCTYPE html>
<html>
    <head>
		<title>Booking log</title>
        <meta charset="UTF-8">
		<link rel="stylesheet" href="main.css" type="text/css" />
		
        <script type='text/javascript' src='loggJs/common.js'></script>
		<script type='text/javascript' src='loggJs/css.js'></script>
		<script type='text/javascript' src='loggJs/standardista-table-sorting.js'></script>
    </head>
    <body>
    
    <%@ include file="WEB-INF/menu.jsp" %>
    
	<div class= "mainElement">
        <table class="sortable" >
            <thead>
                <tr>
					<th>To</th>
                    <th>From</th>
                    <th>Email</th>
                    <th>Cabin</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            	
				<%
				boolean even = true;
				SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
				Database db = new Database();
				int filter;
				try {
					filter = Integer.parseInt(request.getParameter("filter"));
				} catch(Exception e) {
					filter = -1;
				}
				
				if(filter > 0) {
					Cabin cabin = db.getCabin(filter);
					ArrayList<Booking> bookings = db.getBooking(filter);
					for(Booking b : bookings) {
				%>
					 <tr<%= even ? "" : " class='odd'" %>>
						<td><%= fmt.format(b.getDate_From()) %></td>
						<td><%= fmt.format(b.getDate_To()) %></td>
						<td><%= b.getUser_id() %></td>
						<td><%= cabin.getName() %></td>
						<td><a id="mybutton" href="CancelBooking?id=<%= b.getId() %>&filter=<%= filter %>" title="Cancel">
							<button>Cancel</button></a></td>
	                </tr>
				
				<%
					even = !even;
					}
				} else {
					for(int i = 1; i <= 23; i++) {
						Cabin cabin = db.getCabin(i);
						ArrayList<Booking> bookings = db.getBooking(i);
						for(Booking b : bookings) {
					%>
	                <tr<%= even ? "" : " class='odd'" %>>
						<td><%= fmt.format(b.getDate_From()) %></td>
						<td><%= fmt.format(b.getDate_To()) %></td>
						<td><%= b.getUser_id() %></td>
						<td><%= cabin.getName() %></td>
						<td><a id="mybutton" href="CancelBooking?id=<%= b.getId() %>" title="Cancel">
							<button>Cancel</button></a></td>
	                </tr>
	                <%
	                		even = !even;
						}
					}
				}
				db.close();
				%>
				</tbody>
				<tfoot>
				<tr>
						<td></td>
	                    <td></td>       
	                    <td></td> 
						<td></td> 
						<td></td> 
				</tr>
				</tfoot>
        </table>
     </div>
<%@ include file="WEB-INF/footer.jsp" %> 
    </body>
</html>
