<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
<meta charset="UTF-8">
<title>Hello JSP (holeWebPage.jsp)</title>
</head>
<body>
<div class='center'>
     這是doGet()方法送出的訊息. (由JSP送出的完整網頁)    
<p/>
<%@ include file='/segment/previousPage.jsp' %>
</div>
</body>
</html>  
