<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://d10ajoocuyu32n.cloudfront.net/mobile/1.3.1/jquery.mobile-1.3.1.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../../js/jquery-2.2.3.min.js"></script>

<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyB843AmWX8hF0Sh9jMPr3kvmYfvWQu7mLM"></script>
<!-- 
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
  -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-map/3.0-rc1/jquery.ui.map.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-map/3.0-rc1/jquery.ui.map.services.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-map/3.0-rc1/jquery.ui.map.extensions.js"></script>
<script src="../../js/jquery.googlemap.js"></script>
<script>
var centerX = 25.047240;
var centerY = 121.517080;
$(document).ready(function(){
	 $.getJSON('getPlaceData.json', 
			{
		       id: 		$('#idA').val(),
		       name: 	$('#name').val(),
		       address:	$('#address').val(),
			} ,
			function(placesJson) {
				$('#map_canvas').gmap({ 'center': centerX + ","  + centerY });
				
				$('#map_canvas').gmap().bind('init', function(ev, map) {
					$('#map_canvas').gmap('addControl', 'control', google.maps.ControlPosition.LEFT_TOP);
					$('#map_canvas').gmap('option', 'zoom', 12);
	            });
				$.each(placesJson, function(index, place) {
					$('#map_canvas').gmap('addMarker', 
		    				{
		    					'position': place.latitude + "," + place.longitude, 
		    				    'bounds': false,   // 會影響到地圖比例的大小
		    				}).click(
		    					function() {
		    				    	$('#map_canvas').gmap('openInfoWindow', {'content': place.name + "<br>" + place.address}, this);
		    			    });
		    		});		
				});
});
</script>
</head>
<body>
<%
  int num = (int)(Math.random() * 9) + 1;
  request.setAttribute("idString", String.valueOf(num));

%>

	idString==>${idString} <input type='text' id='idA' value='<%= num %>'>
	<input type='text' id='name' value='均雅'>
	<input type='text' id='address' value='台北市'>
	&nbsp;&nbsp;<a href='..'>回前一頁</a>
	<hr>
	<div id='somediv'>
		<hr>
	<div id="map_canvas" style="height: 480px; widht: 600px;"></div>
</div>
</body>
</html>