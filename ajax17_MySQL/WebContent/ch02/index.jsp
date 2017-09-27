<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
<meta charset="UTF-8">
<title>Ajax 首頁</title>
</head>
<body>
<div class='center'>
<h2>預備工作</h2>
</div>
<div style="text-align: center;">
<div style="display: inline-block; text-align: left">
	
<a href='event/focus_blur.jsp' >1. onfocus, onblur 事件</a><br>
<a href='event/change.jsp' >2. change 事件</a><br>
<a href='event/keypress.jsp' >3. keypress 事件</a><br>
<a href='event/keyup.jsp' >4. keyup 事件</a><br>
<a href='js/JavaScriptArray.jsp' >5. JavaScript陣列</a><br>
<a href='js/JavaScriptObject.jsp' >6. JavaScript物件</a><br>
</div>
</div>
<div class='center'>
<%@ include file='/segment/backToHomePage.jsp' %>
</div>
</body>
</html>