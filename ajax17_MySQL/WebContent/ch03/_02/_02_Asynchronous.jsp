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
<input type='Button' id='btnJSP' value='送出請求'>
<hr>
<div id='resp'></div><p>
<script>
	var btnJSP = document.getElementById("btnJSP");
	var div1 = document.getElementById("resp");
	btnJSP.onclick = function() {
		// ajax的同步請求
		// 步驟一: 新建XMLHttpRequest物件
		var xhr = new XMLHttpRequest();
		// 步驟二: 經由AJAX提出HTTP請求
		if (xhr != null) {
			xhr.onreadystatechange = function(){
				// 步驟三: 處理伺服器送回的回應資料
				if  (xhr.readyState == 4 && xhr.status == 200) {
					div1.innerHTML = "<h3>" +  xhr.responseText + "</h3>";
				}
			}
			xhr.open('GET', 'SimpleJSPAjax.jsp', true);
			xhr.send();
		} else {
			div1.innerHTML = "<h3>您的瀏覽器不支援Ajax</h3>";
		}
	}   
</script>
<div id='control_Flow'>
<small>
按下"送出請求"按鈕後，瀏覽器向後端程式(/ch03/_02/SimpleJSPAjax.jsp)發出AJAX非同步請求
</small>
</div>

<%@ include file='/segment/previousPage.jsp' %>
</div>    
</body>
</html>