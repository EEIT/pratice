<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Event</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class='center'>
<h2>onchange事件</h2>
<hr> 
    
                  標題: <input type="text" name="title" value="" onchange="valueChanged(this.value)"><br><br>
                  留言: <input type="text" name="msg" value="" onchange="valueChanged(this.value)"><br><br>
        <p/>
        <div id='reflect'>
        	&nbsp;
        </div>
	
	<hr>
	<script>
		function valueChanged(val) {
			var data = document.getElementById("reflect");
			data.innerHTML = "輸入的訊息: <font color='red'>" + val + "</font>";
		}
	</script>
<%@ include file='/segment/previousPage.jsp' %>
</div>
</body>
</html>