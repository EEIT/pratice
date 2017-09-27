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
<h2>Ajax非同步請求</h2>
</div>
<div style="text-align: center;">
<div style="display: inline-block; text-align: left">
	
<a href='_00/_00_ReadyStateChangeEvent.jsp' >1. 觀察XMLHttpRequest物件之readyState屬性的變化</a><br>
<a href='_01/_01_ReadyStateChangeEvent2.jsp' >2. 當Server端程式有錯誤時</a><br>
<a href='_02/_02_Asynchronous.jsp' >3. 完整的Ajax程式</a><br>
<a href='_03/mouseover.jsp' >4. Ajax範例：MouseOver事件</a><br>
<a href='_04/longrun.jsp' >5. 長時間執行程式  </a><br>
<a href='_05/citytime.jsp' >6. 查詢世界主要城市的時間  </a><br>
<a href='_06/XMLReader.jsp' >7. 處理Server端傳回的XML文件  </a><br>
<a href='_07/ShowPicture.jsp' >8. Ajax傳送圖片  </a><br>
</div>
</div>
<div class='center'>
<%@ include file='/segment/backToHomePage.jsp' %>
</div>
</body>
</html>