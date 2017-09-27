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
	
<a href='_01/queryLottery.jsp' >1. 接收Server送回的JSON物件</a><br>
<a href='_02/register.jsp' >2. 加入會員</a><br>
<a href='_03/allBooks.json' >3. 為了瞭解JSON格式，本範例僅顯示書籍的Raw Data</a><br>
<small>每本書籍存入一個JavaScript物件(由ㄧ對大括弧包住)，全部書籍<br>資料存入由多個JavaScript物件所組成的陣列(由ㄧ對中括弧包住)。<br>搭配的程式為
ch04._03.controller.BookJsonServlet.java</small><br>
<a href='_04/ShowAllBooksAjax.jsp' >4. 由前端程式將處理後端送來的全部書籍(JSON)資料</a><br>
<small>搭配的後端程式為ch04._03.controller.BookJsonServlet.java</small><br>

<a href='_05/ShowSingleBookAjax.jsp' >5. 發出Ajax請求查看單筆書籍資料</a><br>
<small>搭配的後端程式為ch04._03.controller.BookJsonServlet.java<br>與ch04._03.controller.SingleBookJsonServlet.java</small><br>

<a href='_06/GoogleMap.jsp' >6. Google Map(隨機產生Marker, JavaScript版)</a><br>
<a href='_07/GoogleMapAjax.jsp' >7. Google Map(隨機產生Marker, JQuery版)</a><br>
<small>搭配的後端程式為ch04._07.controller.PlaceJsonServlet.java<br>與ch04._07.model.*.java<br>
依照後端程式送來的座標標示Marker(s)</small>
</div>
</div>
<div class='center'>
<%@ include file='/segment/backToHomePage.jsp' %>
</div>
</body>
</html>