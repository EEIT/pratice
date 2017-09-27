<!-- \ch03\_00_ReadyStateChangeEvent.jsp  -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" />
<meta charset="UTF-8">
<title>當Server端程式有錯誤時</title>
</head>
<body>
<div class='center'>
	<input type='Button' id='btnJSP' value='送出請求(JSP)'>
	<hr>
	<h2>當Server端程式有錯誤時</h2>
	必須先取消AjaxWithError.jsp中第四行(out.println("這是故意含有語法錯誤的敘述"))的註解
</div>
	<div id='div1'>
	</div>
	<script>
		var btnJSP = document.getElementById("btnJSP");
		var div1 = document.getElementById("div1");
		btnJSP.onclick = function() {
			// 步驟一: 新建XMLHttpRequest物件
			var xhr = new XMLHttpRequest();
			// 步驟二: 經由AJAX提出HTTP請求
			if (xhr != null) {
				xhr.onreadystatechange = function(){
					// 步驟三: 處理伺服器送回的回應資料
					if  (xhr.readyState == 4 ) {
						// 必須取消下面四行的註解
						//if (xhr.status == 200 ) {  
						   div1.innerHTML = "<h3>" +  xhr.responseText + "</h3>";
						//} else {
						//   div1.innerHTML = "<h3><font color='red'>程式發生異常:" +  xhr.statusText + "</font></h3>";
						//}
					}
				}
				xhr.open('GET', 'AjaxWithError.jsp', true);   // true: 表示非同步
				xhr.send();
			} else {
				div1.innerHTML = "<h3>您的瀏覽器不支援Ajax</h3>";
			}
		}
		
	</script>
<div class='center'>	
    <a style="position:relative; top:150px; " href='${header.referer}'>回前頁</a>
</div>    
</body>
</html>