<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/JavaScript">
var xhr = null;
window.onload = function() {
	var obj = document.getElementById("showTime");
	obj.onmouseover = function() {
		xhr = new XMLHttpRequest();
		
		xhr.open("GET", "ShowTime", true);
		xhr.send();
		xhr.onreadystatechange = callback;
	}
};
function callback() {
	// 向伺服器提出的請求已經收到回應
	if (xhr.readyState === 4) {
		// 伺服器回應成功
		if (xhr.status === 200) {
			document.getElementById("result").innerHTML = 
			"<font color='blue'>" + xhr.responseText + "</font>";
		}
	}	
}
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
<meta charset="UTF-8">
<title>Mouse Over事件處理</title>
</head>
<body>
<div class='center'>
<h2>現在時間</h2>
<font color='blue' size='6'>
<label id="showTime">將游標移過來</label>
</font>
<p/>
<div id='result'>
</div>
</div>


</body>
</html>