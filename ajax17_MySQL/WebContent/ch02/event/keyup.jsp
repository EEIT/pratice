<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>keyup Event</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class='center'>
<h2>keyup事件</h2>
<hr> 

        留言: <input type="text" name="txt" value="" onkeyup="keyup(this.value)">
   <p/>
   <div id='reflect'>
      	&nbsp;
   </div>
	
   <script>
	  function keyup(val) {
		var data = document.getElementById("reflect");
		data.innerHTML = "輸入的訊息: <font color='red'>" + val + "</font>";
	  }
   </script>
<%@ include file='/segment/previousPage.jsp' %>	
</div>
</body>
</html>