<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.database.*,
    no.ntnu.cabinet.CabinetUtils"%>

<%	if(!CabinetUtils.IsAdmin(session)) {
		request.getRequestDispatcher("WEB-INF/notadmin.jsp").forward(request, response);
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Map</title>
<link rel="stylesheet" type="text/css" href="main.css">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
html, body, #map-canvas {
height: 100%;
margin: 0px;
padding: 0px
}
</style>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script>

function initialize() {
    
    var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(63.196788, 10.461720),zoomControl: false,scrollwheel: false, streetViewControl:false,panControl: false,mapTypeControl: false };
    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    infowindow = new google.maps.InfoWindow({content: "holding..."});
	<%
	Database db = new Database();
	for(int i = 1; i <= 23; i++) {
		Cabin cabin = db.getCabin(i);
	%>
        var myLatLng = new google.maps.LatLng(<%= cabin.getLat() %>,<%= cabin.getLng() %>);
        var marker = new google.maps.Marker({ animation: google.maps.Animation.DRO,
                                            position: myLatLng,
                                            map: map,
                                            content:'<p><%= cabin.getName() %></p>' +
                                            		'<p>wood: <%= cabin.getWood() %> </p>' + 
                                            		'<p><a href=<%= "\"logg.jsp?filter="+i+"\"" %>>Reports</a></p>' +
                                            		'<p><a href=<%= "\"booking_log.jsp?filter="+i+"\"" %>>Bookings</a></p>',
                                            title: '<%= cabin.getName() %>'
                                            });
        
        google.maps.event.addListener(marker, 'click', function() {infowindow.setContent(this.content);
                                      infowindow.open(map,this);});
        
        
	<% }
	db.close();
	%>
    
    
    
}



google.maps.event.addDomListener(window, 'load', initialize);


</script>

</head>
<body>

	<%@ include file="WEB-INF/menu.jsp" %>
<div id="map-canvas"></div>
</body>
</html>
