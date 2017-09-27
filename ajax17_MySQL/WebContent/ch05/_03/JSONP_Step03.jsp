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
<input type='Button' id='btnJSP' value='動態加入伺服器端的檔案(SendCallback.jsp)'>
<br><br>
<small>
按下"動態加入伺服器端的檔案"按鈕後，瀏覽器向伺服器要求其內的檔案
</small>
<hr>

<script>
	var btnJSP = document.getElementById("btnJSP");

	btnJSP.onclick = function() {
		var  script  =  document.createElement("script");
		script.type  =  "text/javascript";
		script.setAttribute('src','http://127.0.0.1:8080/ajax17/ch05/SendCallback.jsp');
		document.body.appendChild(script);
	}
</script>
<%@ include file='/segment/previousPage.jsp' %>
</div>    
</body>
</html>