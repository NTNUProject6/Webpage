<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="no.ntnu.cabinet.database.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Test Map</title>

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
    center: new google.maps.LatLng(63.196788, 10.461720) ,zoomControl: false,scrollwheel: false,streetViewControl:false,panControl: false, mapTypeControl: false};
    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    infowindow = new google.maps.InfoWindow({content: "holding..."});
    
	<%
	Database db = new Database();
	for(int i = 1; i <= 23; i++) {
		Cabin cabin = db.getCabin(i);
	%>
        
        var myLatLng = new google.maps.LatLng(<%= cabin.getLat() %>, <%= cabin.getLng() %>);
        var marker = new google.maps.Marker({ animation: google.maps.Animation.DRO,
                                            position: myLatLng,
                                            map: map,
                                            content: '<p><%= cabin.getName() %></p> Beds: 5  </p><p>Difficulty: ?? Altiude: ?? </p><p>traveltime: ?? </p>',
                                            title: '<%= cabin.getName() %>'
                                            });
        
        google.maps.event.addListener(marker, 'click', function() {infowindow.setContent(this.content);
                                      infowindow.open(map,this);});
        
        
	<%
    }
	db.close();
	%>
    
    
    
}



google.maps.event.addDomListener(window, 'load', initialize);


</script>












</head>
<body>




<div id="map-canvas"></div>
</body>
</html>
