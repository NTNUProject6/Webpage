<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.SimpleDateFormat,java.util.Date,no.ntnu.cabinet.CabinetUtils"%>
<!DOCTYPE html>
<html>
<!--For including Norwegian text in the webpage-->
<meta charset="UTF-8">
 <head>
 <link rel="stylesheet" type="text/css" href="container.css">
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 <script src="container.js"></script>

 
 <%
  	String from_date_string = request.getParameter("from_day")
   		+ "-" + request.getParameter("from_month") 
   		+ "-" + request.getParameter("from_year");
   	String to_date_string = request.getParameter("to_day") 
  	 	+ "-" + request.getParameter("to_month") 
  	 	+ "-" + request.getParameter("to_year");

   	SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
   	Date from_date = sdf.parse(from_date_string);
   	Date to_date = sdf.parse(to_date_string);

   	// Redirect back to registration if to date is after from date
   	// TODO: Error page?
   	if(from_date.after(to_date)) {
   		response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
   		response.setHeader("Location", "Registration.jsp");
   	}
   	
   	boolean[] cabin_is_free = new boolean[23]; 	
   	for(int i = 1; i <= 23; i++) {
   		cabin_is_free[i-1] = !CabinetUtils.BookingCollides(i, from_date, to_date);
   	}
  %>

 <title>&lt;input type=&quot;email&quot;&gt;</title>
</head>
 <body>
 <div id="cabinpage">
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
 <div id="container">
 
  </div>
 <form action="RegisterBooking" method="get">
 <input type="hidden" name="from_date" value="<%= from_date_string %>">
 <input type="hidden" name="to_date" value="<%= to_date_string %>">
  <div class="mailsubmit"><sup>Email</sup><input type="email" name="email" placeholder="me@example.com">*
 <button  onclick="myFunction()">Submit</button></div>	
         <fieldset>
         <% if(cabin_is_free[0]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="1"> <img src="Images/flaakoia1.png"/>Flåkoia</div> </br> 
			<div class="content">
				<div><a href="Images/flaakoia1.png"><img src="Images/flaakoia1.png"></a></div>
				<div><ul id="info"><li><a href="Images/flaakoia2.png"><img src="Images/flaakoia2.png"></a></li>
							   <li><a href="Images/flaakoia3.png"><img src="Images/flaakoia3.png"></a></li>
							   <li><a href="Images/flaakoia4.png"><img src="Images/flaakoia4.png"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
				</div></div>
		<% } if(cabin_is_free[1]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="2"> <img src="Images/fosenkoia1.jpg"/ >Fosenkoia</div> </br> 
			<div class="content">
				<div><a href="Images/fosenkoia1.jpg"><img src="Images/fosenkoia1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/fosenkoia2.jpg"><img src="Images/fosenkoia2.jpg"></a></li>
							   <li><a href="Images/fosenkoia3.jpg"><img src="Images/fosenkoia3.jpg"></a></li>
							   <li><a href="Images/fosenkoia4.jpg"><img src="Images/fosenkoia4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[2]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="3"> <img src="Images/heinfjordstua1.jpg"/ >Heinfjordstua</div> </br> 
			<div class="content">
				<div><a href="Images/heinfjordstua1.jpg"><img src="Images/heinfjordstua1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/heinfjordstua2.jpg"><img src="Images/heinfjordstua2.jpg"></a></li>
							   <li><a href="Images/heinfjordstua3.jpg"><img src="Images/heinfjordstua3.jpg"></a></li>
							   <li><a href="Images/heinfjordstua4.jpg"><img src="Images/heinfjordstua4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>	
		<% } if(cabin_is_free[3]) { %>
            <div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="4"> <img src="Images/hognabu1.jpg"/ >Hognabu</div> </br> 
			<div class="content">
				<div><a href="Images/hognabu1.jpg"><img src="Images/hognabu1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/hognabu2.jpg"><img src="Images/hognabu2.jpg"></a></li>
							   <li><a href="Images/hognabu3.jpg"><img src="Images/hognabu3.jpg"></a></li>
							   <li><a href="Images/hognabu4.jpg"><img src="Images/hognabu4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
            
		<% } if(cabin_is_free[4]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="5"> <img src="Images/holmsaakoia1.jpg"/ >Holmsåkoia</div> </br> 
			<div class="content">
				<div><a href="Images/holmsaakoia1.jpg"><img src="Images/holmsaakoia1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/holmsaakoia2.jpg"><img src="Images/holmsaakoia2.jpg"></a></li>
							   <li><a href="Images/holmsaakoia3.jpg"><img src="Images/holmsaakoia3.jpg"></a></li>
							   <li><a href="Images/holmsaakoia4.jpg"><img src="Images/holmsaakoia4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>	
		<% } if(cabin_is_free[5]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="6"> <img src="Images/holvassgamma1.jpg"/ >Holvassgamma</div> </br> 
			<div class="content">
				<div><a href="Images/holvassgamma1.jpg"><img src="Images/heinfjordstua1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/holvassgamma2.jpg"><img src="Images/holvassgamma2.jpg"></a></li>
							   <li><a href="Images/holvassgamma3.jpg"><img src="Images/holvassgamma3.jpg"></a></li>
							   <li><a href="Images/holvassgamma4.jpg"><img src="Images/holvassgamma4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>	
		<% } if(cabin_is_free[6]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="7"> <img src="Images/iglbu1.jpg" />Iglbu </div></br>
			<div class="content">
				<div><a href="Images/iglbu11.jpg"><img src="Images/iglbu1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/iglbu12.jpg"><img src="Images/iglbu12.jpg"></a></li>
							   <li><a href="Images/iglbu13.jpg"><img src="Images/iglbu13.jpg"></a></li>
							   <li><a href="Images/iglbu14.jpg"><img src="Images/iglbu14.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[7]) { %>
            <div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="8"> <img src="Images/kamtjonnkoia1.jpg" />Kamtjønnkoia </div></br>
			<div class="content">
				<div><a href="Images/kamtjonnkoia1.jpg"><img src="Images/kamtjonnkoia1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/kamtjonnkoia2.jpg"><img src="Images/kamtjonnkoia2.jpg"></a></li>
							   <li><a href="Images/kamtjonnkoia3.jpg"><img src="Images/kamtjonnkoia3.jpg"></a></li>
							   <li><a href="Images/kamtjonnkoia4.jpg"><img src="Images/kamtjonnkoia4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[8]) { %>
            <div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="9"> <img src="Images/kraaklikaaten1.jpg" />Kråklikåten </div></br>
			<div class="content">
				<div><a href="Images/kraaklikaaten1.jpg"><img src="Images/Kraaklikaaten1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/kraaklikaaten2.jpg"><img src="Images/kraaklikaaten2.jpg"></a></li>
							   <li><a href="Images/kraaklikaaten3.jpg"><img src="Images/kraaklikaaten3.jpg"></a></li>
							   <li><a href="Images/kraaklikaaten4.jpg"><img src="Images/kraaklikaaten4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[9]) { %>
            <div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="10"> <img src="Images/kvernmovollen1.jpg" />Kvernmovollen </div></br>
			<div class="content">
				<div><a href="Images/kvernmovollen1.jpg"><img src="Images/kvernmovollen1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/kvernmovollen2.jpg"><img src="Images/kvernmovollen2.jpg"></a></li>
							   <li><a href="Images/kvernmovollen3.jpg"><img src="Images/kvernmovollen3.jpg"></a></li>
							   <li><a href="Images/kvernmovollen4.jpg"><img src="Images/kvernmovollen4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[10]) { %>
            <div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="11"> <img src="Images/kaasen1.jpg" />Kåsen </div></br>
			<div class="content">
				<div><a href="Images/kaasen1.jpg"><img src="Imageskaasen1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/kaasen2.jpg"><img src="Images/kaasen2.jpg"></a></li>
							   <li><a href="Images/kaasen3.jpg"><img src="Images/kaasen3.jpg"></a></li>
							   <li><a href="Images/kaasen4.jpg"><img src="Images/kaasen4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[11]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="12"> <img src="Images/Kvernmovollen1.jpg" />Lynhøgen </div></br>
			<div class="content">
				<div><a href="Images/lynhogen1.jpg"><img src="Images/lynhogen1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/lynhogen2.jpg"><img src="Images/lynhogen2.jpg"></a></li>
							   <li><a href="Images/lynhogen3.jpg"><img src="Images/lynhogen3.jpg"></a></li>
							   <li><a href="Images/lynhogen4.jpg"><img src="Images/lynhogen4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[12]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="13"> <img src="Images/mortenskaaten1.jpg" />Mortenskåten</div> </br>
			<div class="content">
				<div><a href="Images/mortenskaaten1.jpg"><img src="Images/mortenskaaten1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/mortenskaaten2.jpg"><img src="Images/mortenskaaten2.jpg"></a></li>
							   <li><a href="Images/mortenskaaten3.jpg"><img src="Images/mortenskaaten3.jpg"></a></li>
							   <li><a href="Images/mortenskaaten4.jpg"><img src="Images/mortenskaaten4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[13]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="14"> <img src="Images/nicokoia1.jpg" />Nicokoia </div></br>
			<div class="content">
				<div><a href="Images/nicokoia1.jpg"><img src="Images/nicokoia1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/nicokoia2.jpg"><img src="Images/nicokoia2.jpg"></a></li>
							   <li><a href="Images/nicokoia3.jpg"><img src="Images/nicokoia3.jpg"></a></li>
							   <li><a href="Images/nicokoia4.jpg"><img src="Images/nicokoia4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[14]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="15"> <img src="Images/rindalsloa1.jpg" />Rindalsløa</div> </br>
			<div class="content">
				<div><a href="Images/rindalsloa1.jpg"><img src="Images/rindalsloa1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/rindalsloa2.jpg"><img src="Images/rindalsloa2.jpg"></a></li>
							   <li><a href="Images/rindalsloa.jpg"><img src="Images/rindalsloa3.jpg"></a></li>
							   <li><a href="Images/rindalsloa.jpg"><img src="Images/rindalsloa4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[15]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="16"> <img src="Images/selbukaaten1.jpg" />Selbukåten</div> </br>
			<div class="content">
				<div><a href="Images/selbukaaten1.jpg"><img src="Images/selbukaaten.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/selbukaaten2.jpg"><img src="Images/selbukaaten2.jpg"></a></li>
							   <li><a href="Images/selbukaaten3.jpg"><img src="Images/selbukaaten3.jpg"></a></li>
							   <li><a href="Images/selbukaaten4.jpg"><img src="Images/selbukaaten4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[16]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="17"> <img src="Images/sonvasskoia1.jpg" />Sonvasskoia </div></br>
			<div class="content">
				<div><a href="Images/sonvasskoia1.jpg"><img src="Images/sonvasskoia1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/sonvasskoia2.jpg"><img src="Images/sonvasskoia2.jpg"></a></li>
							   <li><a href="Images/sonvasskoia3.jpg"><img src="Images/sonvasskoia3.jpg"></a></li>
							   <li><a href="Images/sonvasskoia.jpg"><img src="Images/sonvasskoia4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[17]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="18"> <img src="Images/stabburet1.jpg" />Stabburet </div></br>
			<div class="content">
				<div><a href="Images/stabburet1.jpg"><img src="Images/heinfjordstua1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/stabburet.jpg"><img src="Images/stabburet2.jpg"></a></li>
							   <li><a href="Images/stabburet3.jpg"><img src="Images/stabburet3.jpg"></a></li>
							   <li><a href="Images/stabburet4.jpg"><img src="Images/stabburet4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[18]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="19"> <img src="Images/stakkslettbua1.jpg" />Stakkslettbua </div></br>
			<div class="content">
				<div><a href="Images/stakkslettbua1.jpg"><img src="Images/stakkslettbua1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/stakkslettbua2.jpg"><img src="Images/stakkslettbua2.jpg"></a></li>
							   <li><a href="Images/stakkslettbua3.jpg"><img src="Images/stakkslettbua.jpg"></a></li>
							   <li><a href="Images/stakkslettbua4.jpg"><img src="Images/stakkslettbua4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[19]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="20"> <img src="Images/telin1.jpg" />Telin </div></br>
			<div class="content">
				<div><a href="Images/telin1.jpg"><img src="Images/telin1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/telin2.jpg"><img src="Images/telin2.jpg"></a></li>
							   <li><a href="Images/telin3.jpg"><img src="Images/telin.jpg"></a></li>
							   <li><a href="Images/telin4.jpg"><img src="Images/telin4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[20]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="21"> <img src="Images/taagaabu1.jpg" />Taagaabu</div></br>
			<div class="content">
				<div><a href="Images/holvassgamma1.jpg"><img src="Images/taagaabu1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/taagaabu2.jpg"><img src="Images/taagaabu2.jpg"></a></li>
							   <li><a href="Images/taagaabu3.jpg"><img src="Images/taagaabu3.jpg"></a></li>
							   <li><a href="Images/taagaabu4.jpg"><img src="Images/taagaabu4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[21]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="22"> <img src="Images/vekvessaetra1.jpg" />Vekvessætra</div> </br>
			<div class="content">
				<div><a href="Images/vekvessaetra1.jpg"><img src="Images/vekvessaetra1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/vekvessaetra2.jpg"><img src="Images/vekvessaetra2.jpg"></a></li>
							   <li><a href="Images/vekvessaetra3.jpg"><img src="Images/vekvessaetra3.jpg"></a></li>
							   <li><a href="Images/vekvessaetra4.jpg"><img src="Images/vekvessaetra4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } if(cabin_is_free[22]) { %>
			<div class="container collapsed"><div class="header"><input type ="radio" name ="cabins" value ="23"> <img src="Images/ovensenget1.jpg" />Øvensenget</div> </br>
			<div class="content">
				<div><a href="Images/ovensenget1.jpg"><img src="Images/ovensenget1.jpg"></a></div>
				<div><ul id="info"><li><a href="Images/ovensenget2.jpg"><img src="Images/ovensenget2.jpg"></a></li>
							   <li><a href="Images/ovensenget3.jpg"><img src="Images/ovensenget3.jpg"></a></li>
							   <li><a href="Images/ovensenget4.jpg"><img src="Images/ovensenget4.jpg"></a></li></ul></div>	
                <div><ul id="info"><li>No.of beds: 11</li>
							   <li>Location:Forest</li>
							   <li>Difficulty:2 </li></ul></div>
			</div></div>
		<% } %>
		
        </fieldset>


	
 </form>
 </div>

</div>
 </body>
</html>
