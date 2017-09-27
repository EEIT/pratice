<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" />
<meta charset="UTF-8">
<title>完整的Ajax程式</title>
<style>
  table.center {
    margin-left:auto; 
    margin-right:auto;
  }
</style>
</head>
<body>
<div class='center'>
<input type='Button' id='btnSDP' value='送出請求'><br><br>
<small>
按下"送出請求"按鈕後，瀏覽器向<font color='red'>不同</font>伺服器主機內的程式(/ch05/SDP_SendData.jsp)發出AJAX非同步請求
</small>
<hr>
<div id='resp'></div><p>
<script>
	var btnSDP = document.getElementById("btnSDP");
	var div1 = document.getElementById("resp");
	btnSDP.onclick = function() {
		// ajax的同步請求
		// 步驟一: 新建XMLHttpRequest物件
		var xhr = new XMLHttpRequest();
		// 步驟二: 經由AJAX提出HTTP請求
		if (xhr != null) {
			xhr.onreadystatechange = function(){
				// 步驟三: 處理伺服器送回的回應資料
				if  (xhr.readyState == 4 && xhr.status == 200) {
					var txt = "<table border='1' class='center'><tr><th colspan='2'>會員基本資料</th></tr>";
					txt += "<tr><th>姓名</th><th>年齡</th></tr>";
					var arr1 = JSON.parse(xhr.responseText);
					for (var i=0; i < arr1.length; i++){
						txt += "<tr><td>" + arr1[i].name + "</td><td>" + arr1[i].age + "</td></tr>";
					}
					txt += "</table>";
					div1.innerHTML = txt;
				}
			}
			xhr.open('GET', 'http://127.0.0.1:8080/ajax17/ch05/SDP_SendData.jsp', true);
			xhr.send();
		} else {
			div1.innerHTML = "<h3>您的瀏覽器不支援Ajax</h3>";
		}
	}   
</script>
<div id='control_Flow'>

</div>

<%@ include file='/segment/previousPage.jsp' %>
</div>    
</body>
</html>