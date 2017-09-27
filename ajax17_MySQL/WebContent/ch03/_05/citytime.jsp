<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/JavaScript">
	window.onload = function() {
		// SELECT標籤
		var city = document.getElementById("city");
		city.onchange = function() {
			var xhr = new XMLHttpRequest();
			var cityName = city.options[ city.selectedIndex ].text;	
			var queryString = "city=" + city.value + "&cityName=" + cityName;
			var url = "ShowCityTime?" + queryString;
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				// 向伺服器提出的請求已經收到回應
				if (xhr.readyState === 4) {
					// 伺服器回應成功
					if (xhr.status === 200) {
						document.getElementById("result").innerHTML = 
						"<font color='red'>" + xhr.responseText + "</font>";
					}
				}
			}
		}
	};
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
<meta charset="UTF-8">
<title>顯示時間</title>
</head>
<body>
<div id='control_Flow' style="text-align: center;">
<p>
<hr>
<small>
搭配的Server端程式為ch03._05.ShowCityTimeServlet.java
</small>
</div>
<div class='center'>
<h2 style='color: blue;'>查詢世界主要城市的時間</h2>

<select id='city'>
  <option value='Asia/Taipei'>台北</option>
  <option value='America/New_York'>紐約</option>
  <option value='Asia/Tokyo'>東京</option>
  <option value='Europe/London'>倫敦</option>
</select>
<div id='result' style='position:relative; top:40px;'>
</div>
<br/><br/>
<%@ include file='/segment/previousPage.jsp' %>
</div>
</body>
</html>