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
		<title>Rapport logg</title>
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
					<th>Dates</th>
                    <th>Cabin</th>
                    <th>Email</th>
					<th>Wood</th>
					<th>Other</th>
                </tr>
            </thead>
			
            <tbody>
				<%
				boolean even = true;
				SimpleDateFormat fmt = new SimpleDateFormat("dd-MM-yyyy");
				Database db = new Database();
				for(int i = 1; i <= 23; i++) {
					Cabin cabin = db.getCabin(i);
					ArrayList<Report> reports = db.getReports(i);
					for(Report r : reports) {
				%>
                <tr<%= even ? "" : " class='odd'" %>>
					<td><%= fmt.format(r.getReport_date()) %></td>
                    <td><%= cabin.getName() %></td>       
                    <td><%= r.getEmail() %></td> 
					<td><%= r.getWood() %></td> 
					<td><%= r.getOther() %></td> 
                </tr>
                <%
					}
					even = !even;
				}
				db.close();
				%>
            </tbody>
        </table>

     </div> 
    </body>
</html>
