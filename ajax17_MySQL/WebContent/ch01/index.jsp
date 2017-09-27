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
<h2	>Hello AJAX</h2>
</div>
<div style="text-align: center;">
<div style="display: inline-block; text-align: left">

<a href='_01/HelloAjax.jsp' >1. Hello AJAX(同步)</a><br>
<a href='_02/Synchronous.jsp' >2. 同步請求的缺點</a><br>
</div>
</div>
<div class='center'>
<%@ include file='/segment/backToHomePage.jsp' %>
</div>	
</body>
</html>