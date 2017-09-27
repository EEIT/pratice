<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyB843AmWX8hF0Sh9jMPr3kvmYfvWQu7mLM"></script>
<script type="text/javascript">
var centerX = 51.508742;
var centerY = -0.120850;
var myCenter=new google.maps.LatLng(centerX,  centerY);
var map ;
function init() {
	var mapProp = {
		center : myCenter,
		zoom: 10,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
	var marker=new google.maps.Marker({
		  position: myCenter
		});
	marker.setMap(map);
	
};
function addMarker(){
	var x1  = centerX + (Math.random() - 0.5 ) / 3.0;
	var y1  = centerY + (Math.random() - 0.5 ) ;
	var aCenter=new google.maps.LatLng(x1,  y1);
	var marker=new google.maps.Marker({
		  position: aCenter
		});
		marker.setMap(map);
}
function addMarkers(){
	var arr = [];
	for (x = 0; x < 10; x++){
	   var x1  = centerX + (Math.random() - 0.5 ) / 3.0;
	   var y1  = centerY + (Math.random() - 0.5 ) ;
	   arr.push(
		 {'x':x1,'y':y1}	  
	   );
	} 
	for (i = 0; i < arr.length; i++){
		var aCenter = new google.maps.LatLng(arr[i].x,  arr[i].y);
		var marker = new google.maps.Marker({
			  position: aCenter
		});
		marker.setMap(map);	   
	}
	
	
}

google.maps.event.addDomListener(window, 'load', init);

</script>
</head>
<body>
<input type='button' value='加一個Marker' id='btn' onclick=addMarker() />
<input type='button' value='加一組Marker' id='btn' onclick=addMarkers() />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='https://developers.google.com/maps/documentation/javascript/get-api-key#key'>可能需要到Google網站申請憑證</a>
&nbsp;&nbsp;&nbsp;&nbsp;<a href='..'>回前一頁</a> 
<hr>
<div id="googleMap" style="height:480px; width:840px;"></div>
</body>
</html>