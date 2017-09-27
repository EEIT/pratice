<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
<script>
window.onload = function(){
 	var showmsg = document.getElementById("result");
	var btn  = document.getElementById("btn");
	var img1 = document.getElementById("img1");
	btn.onclick = function(){
		showmsg.innerHTML = "";   		// 清除訊息區   
		xhr = new XMLHttpRequest();		// 建立XMLHttpRequest物件
		xhr.open("GET", "LongRunServlet", true);
		xhr.send();						// 送出非同步請求
	 	img1.style.display = "inline";
		xhr.onreadystatechange = function() {
			// 向伺服器提出的請求已經收到回應
			if (xhr.readyState === 4) {
				// 伺服器回應成功
				if (xhr.status === 200) {
					document.getElementById("result").innerHTML = "<font color='red'>"
							+ xhr.responseText  + "</font>";
				} else {
					alert("error, " + xhr.status);
				} 
				document.getElementById("img1").style.display = "none";
			} 
		}
	}
}
</script>
<meta charset="UTF-8">
<title>展示用</title>
</head>
<body>
<div id='control_Flow' style="text-align: center;">
<p>
<hr>
<small>
搭配的Server端程式為ch03._04.LongRunServlet.java
</small>
</div>
<hr>
<div style="text-align:center;">
    <input id='btn'  type="button"  value="長時間執行程式(五秒鐘)" 
    	style="position:relative; top:50px; " >
</div>
<div style="text-align:center;">
<!--工作尚未開始時應該隱藏<img>標籤==> style="display:none" -->
<img id="img1" src="${pageContext.request.contextPath}/images/ajaxloader1.gif"  
        style="display:none; position:relative; top:80px; ">   
</div>   
<div id='result' style="text-align:center; position: relative; top:150px" >

</div>
<br><br><br><br><br>
<div class='center'>
<table><tr><td align='center'>
	<%@ include file='/segment/upPage.jsp' %>
</td></tr></table>
</div>


</div>
</body>
</html>