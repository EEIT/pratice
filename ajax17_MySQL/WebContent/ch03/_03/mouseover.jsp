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
		xhr.onreadystatechange = function(){
			if (xhr.readyState === 4) {
				// 伺服器回應成功
				if (xhr.status === 200) {
					// 收到伺服器的回應
					document.getElementById("result").innerHTML = 
					"<h2>現在時間</h2>" + 	
					"<font color='red'>" + xhr.responseText + "</font>";
				}
			}	
		};
		xhr.open("GET", "ShowTime", true);
		xhr.send();
	}
};

</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
<meta charset="UTF-8">
<title>處理</title>
</head>
<body>
<div class='center'>
<h2>Mouse Over事件</h2>
<font color='blue' size='6'>
<label id="showTime">將游標移過來</label>
</font>
<p/>
<div id='result'>
</div>

<div id='control_Flow'>
<p>
<small>
搭配的Server端程式為ch03._03.ShowTimeServlet.java
</small>
</div>
<%@ include file='/segment/previousPage.jsp' %>
</div>
</body>
</html>