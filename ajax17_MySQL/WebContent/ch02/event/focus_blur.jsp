<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Focus Event</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class='center'>
<h2 class='center'>onfocus/onblur事件</h2>
<hr> 
    <div class='center'>
	<input type="button" value="顯示表單" onclick="showForm()">
	<p>
    <form style="display: none" name="form">
		帳號: <input style="" id='account' name="account" 
		             onfocus="gotFocus (this.id)"
		             onblur="lostFocus (this.id)"
		             ><p>
		姓名: <input style="" id='name' name="name" 
		             onfocus="gotFocus(this.id)" 
		             onblur="lostFocus (this.id)"
		             ><p>
		地址: <input style="" id='address' name="address" 
		             onfocus="gotFocus(this.id)" 
		             onblur="lostFocus (this.id)"
		             ><p>		             
		             
	</form>
	</div>
	<script>
		function showForm() {
			var form = document.forms['form'];
			form.style.display = 'block';
			form.elements[0].focus();
		}
		function gotFocus(x) {
		    document.getElementById(x).style.background = "yellow";
		}
		function lostFocus(x) {
		    document.getElementById(x).style.background = 'white';
		}
	</script>
<%@ include file='/segment/previousPage.jsp' %>
</div>
</body>
</html>