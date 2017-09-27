<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
<meta charset="UTF-8">
<title>Ajax範例二: 說明『同步請求的缺點』</title>
</head>
<body>
<div class='center'>
    <b>同步請求的缺點:</b> 前端程式必須等待後端程式送回要求的資料，若後端程式需要較長的執行時間...<p>
	<input type='Button' id='btnJSP' value='送出請求(JSP)，需時5秒'>
	<input type='Button' id='btnServlet' value='送出請求(Servlet)，需時5秒'>
	<hr>
	<div id='resp'></div><p>
	<script>
		var btnJSP = document.getElementById("btnJSP");
		var btnServlet = document.getElementById("btnServlet");
		var div1 = document.getElementById("resp");
		btnJSP.onclick = function() {
			// ajax的同步請求
			// 步驟一: 新建XMLHttpRequest物件
			var xhr = new XMLHttpRequest();
			// 步驟二: 經由AJAX提出HTTP請求
			if (xhr != null) {
				xhr.open('GET', 'SimpleJSPAjax.jsp', false);
				xhr.send();
				div1.innerHTML = "<h3>" +  xhr.responseText + "</h3>";
				// 步驟三: 處理伺服器送回的回應資料
			} else {
				div1.innerHTML = "<h3>您的瀏覽器不支援Ajax</h3>";
			}
		}
		btnServlet.onclick = function() {
			// ajax的同步請求
			// 步驟一: 新建XMLHttpRequest物件
			var xhr = new XMLHttpRequest();
			// 步驟二: 經由AJAX提出HTTP請求
			if (xhr != null) {
				xhr.open('GET', 'SimpleServletAjax', false);
				xhr.send();
				div1.innerHTML = "<h3>" +  xhr.responseText + "</h3>";
				// 步驟三: 處理伺服器送回的回應資料
			} else {
				div1.innerHTML = "<h3>您的瀏覽器不支援Ajax</h3>";
			}
		}
	</script>
    <%@ include file='/segment/upPage.jsp' %>
</div>    
</body>
</html>