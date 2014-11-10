<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,java.text.SimpleDateFormat, 
    no.ntnu.cabinet.CabinetUtils,no.ntnu.cabinet.database.*"%>

<%	if(!CabinetUtils.IsAdmin(session)) {
		request.getRequestDispatcher("WEB-INF/notadmin.jsp").forward(request, response);
		return;
	}
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
	<form id="wood_update" action="UpdateWood" method="post">
	 <select name="cabin">
        <%
			Database db = new Database();
			for(int i = 1; i <= 23; i++) {
				Cabin cabin = db.getCabin(i);
		%>      <option value="<%= i %>"><%= cabin.getName() %></option>
		<% } %>
		
	</select>
	<input id="wood" class="input" name="wood" type="text" value="" size="1" />
	<input id="submit_button" type="submit" value="Update" />
	</form>
    <table class="sortable" >
            <thead>
                <tr>
					<th>Cabin</th>
                    <th>Wood</th>
                    <th>Updated</th>
                </tr>
            </thead>
            <tbody>
            	
				<%
				boolean even = true;
				db = new Database();
				for(int i = 1; i <= 23; i++) {
					Cabin cabin = db.getCabin(i);
				%>
                <tr style="background-color: 
                <%	if(cabin.getWood() <= 5) out.println("red");
                	else if(cabin.getWood() <=14) out.println("yellow");
                	else out.println("#9BC79C");%>;">
					<td><%= cabin.getName() %></td>
					<td><%= cabin.getWood() %></td>
					<td><%= cabin.getWood_updated() %></td>
                </tr>
                <%
	                	even = !even;
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
