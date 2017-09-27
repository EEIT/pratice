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
<h2>JSON與資料庫存取</h2>
<font color='red'>再次提醒必須先執行ch00.util.InitialDataSetupMySql.java(for MySQL)
</font>
</div>
<br>
<div style="text-align: center;">
<div style="display: inline-block; text-align: left">
	
<a href='_01/SameDomain.jsp' >1. 存取相同網域的資源</a><br>
<a href='_02/DifferentDomain.jsp' >2. 存取不同網域的資源</a><br>
<a href='_03/JSONP_Step01.jsp' >3. 解決跨網域問題JSONP - 動態加入script標籤ㄧ</a><br>
<a href='_03/JSONP_Step02.jsp' >4. 解決跨網域問題JSONP - 動態加入script標籤二</a><br>
<a href='_03/JSONP_Step03.jsp' >5. 解決跨網域問題JSONP - 動態加入script標籤三</a><br>
<a href='_03/JSONP_Step04.jsp' >6. 解決跨網域問題JSONP - 動態加入script標籤四</a><br>

</div>
</div>
<div class='center'>
<%@ include file='/segment/backToHomePage.jsp' %>
</div>
</body>
</html>