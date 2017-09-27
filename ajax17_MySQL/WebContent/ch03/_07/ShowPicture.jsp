<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
<script>
   window.onload = function(){
	  var btn = document.getElementById("btn");
	  btn.onclick = function(){
		  var xhr = new XMLHttpRequest();
		  var img1 = document.getElementById("img1");
		  img1.style.display = "none";
		  xhr.onreadystatechange = function(){
			  if (xhr.readyState == 4 && xhr.status == 200){
				  // src屬性必須俱備下列格式:
		    	  // data:[MIME-TYPE];base64,[經由Base64編碼的非文字檔]
				  img1.src = xhr.responseText;
			  }
		  }
		  xhr.open("GET", "getPicture.do", true);
		  xhr.send();
		  img1.style.display = "inline";
	  }
   }
</script>
<meta charset="UTF-8">
<title>Show Picture</title>
</head>
<body>
<div class='center'>
<h1>JavaScript傳送圖片</h1>
<img width='300' height='200' id='img1'>
<img src="${pageContext.request.contextPath}/images/m12.jpg"  width='300' height='200'/>
<hr>
<button  id='btn' style='width:80px; height:40px' >看圖片</button>
<hr>
<div id='control_Flow' style="text-align:left">
<small>
按下"看圖片"按鈕後，瀏覽器向後端程式(ch03._07.SendPictureServlet.java)發出AJAX非同步請求，
該程式會隨機挑選ㄧ張圖片，取得該圖片檔的MIME型態，並讀取該圖片檔至位元組陣列中，接著由java.util.Base64
將存放在位元組陣列中的資料以Base64的方式來編碼，然後依照下列格式將資料寫回給前端的JavaScript程式：<br>
data:[圖檔的MIME型態];base64,[編碼後的資料]<br>

</small>
</div>

<%@ include file='/segment/upPage.jsp' %>
</div>
</body>
</html>