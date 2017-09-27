<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" />
<meta charset="UTF-8">
<title>完整的Ajax程式</title>
</head>
<body>
<div class='center'>
<input type='Button' id='btnSDP' value='動態加入&lt;script&gt;標籤'><br><br>
<small>
按下"動態加入&lt;script&gt;標籤"按鈕後，瀏覽器動態產生ㄧ個&lt;script&gt;標籤，並將其加入DOM Tree內
</small>
<hr>
<script>
	var btnSDP = document.getElementById("btnSDP");
	var div1 = document.getElementById("resp");
	
	btnSDP.onclick = function() {
		
		var  script  =  document.createElement("script");
		script.type  =  "text/javascript";
		script.text  =  "alert('已經動態加入<script>標籤');";
		
		document.body.appendChild( script);
	}   
</script>
<%@ include file='/segment/previousPage.jsp' %>
</div>    
</body>
</html>