<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Time Report</title>

</head>
<body>
	<input type='Button' value='現在時間:	'>
	<div id='showTime'></div>
	<script>
		var btn = document.getElementById("timeReport");
		var div1 = document.getElementById("showTime");
		btn.onclick = function() {
			// ajax的同步請求
			// 步驟一: 新建XMLHttpRequest物件
			var xhr = new XMLHttpRequest();
			// 步驟二: 經由AJAX提出HTTP請求
			if (xhr != null) {
				xhr.open('GET', '_01/TimeReport', false);
				xhr.send();
				div1.innerHTML = "<h2>" +  xhr.responseText + "</h2>";
				// 步驟三: 處理伺服器送回的回應資料
			} else {

			}
		}
	</script>

</body>
</html>