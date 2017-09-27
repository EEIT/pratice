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
<input type='Button' id='btnJSP' value='動態加入伺服器端的檔案(SendCallback.jsp)'>
<br><br>
<small>
按下"動態加入伺服器端的檔案"按鈕後，瀏覽器向伺服器要求其內的檔案
</small>
<hr>
<div id='resp'></div><p>

<script>


	var btnJSP = document.getElementById("btnJSP");
	

	btnJSP.onclick = function() {
		var  script  =  document.createElement("script");
		script.type  =  "text/javascript";
		script.setAttribute('src','http://127.0.0.1:8080/ajax17/ch05/SendCallback.jsp?callBackMethod=showData');
		document.body.appendChild(script);
	}
	
	function showData(data){
		var div1 = document.getElementById("resp");
		var txt = "<table border='1' class='center'><tr><th colspan='2'>會員基本資料</th></tr>";
		txt += "<tr><th>姓名</th><th>年齡</th></tr>";
		console.log(data);
		//var arr1 = JSON.parse(data);
		for (var i=0; i < data.length; i++){
			txt += "<tr><td>" + data[i].name + "</td><td>" + data[i].age + "</td></tr>";
		}
		txt += "</table>";
		div1.innerHTML = txt;
		
		
	}
</script>
<div id='control_Flow'>

</div>

<%@ include file='/segment/previousPage.jsp' %>
</div>    
</body>
</html>