<!-- \ch03\_00_ReadyStateChangeEvent.jsp  -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" />
<meta charset="UTF-8">
<title>觀察XMLHttpRequest物件之readyState屬性的變化</title>
</head>
<body>
<div class='center'>
	<input type='Button' id='btnJSP' value='送出請求(JSP)'>
	<hr>
	必須開啟Chrome瀏覽器之『開發人員工具』，進入Console頁面，觀察readyState屬性的變化
	<hr>
	<script>
		var btnJSP = document.getElementById("btnJSP");
		btnJSP.onclick = function() {
			// 步驟一: 新建XMLHttpRequest物件
			var xhr = new XMLHttpRequest();
			// 步驟二: 經由AJAX提出HTTP請求
			if (xhr != null) {
				xhr.onreadystatechange = function(){
					console.log(xhr.readyState);   // + "  " + xhr.status
				}
				xhr.open('GET', 'SimpleJSPAjax.jsp', true);   // true: 表示非同步
				xhr.send();

			} else {
				div1.innerHTML = "<h3>您的瀏覽器不支援Ajax</h3>";
			}
		}
		
	</script>
<div id='control_Flow' style="text-align:left">
<small>
按下"送出請求(JSP)"按鈕後，瀏覽器向後端程式(/ch03/_00/SimpleJSPAjax.jsp)發出AJAX非同步請求。
</small>
</div>
    <a style="position:relative; top:150px; " href='${header.referer}'>回前頁</a>
</div>    
</body>
</html>