<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery-1.12.2.min.js"></script>
<script>
	window.onload = function() {
		var btn = document.getElementById("clickmeS");  // 『Click Me(JavaScript)』按鈕的事件處理函數
		btn.onclick = function() {
			var xhr = new XMLHttpRequest();
			xhr.open("GET", '../_03/allBooks.json', true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var content = "<table border='1'>";
					var books = JSON.parse(xhr.responseText);
					for(var i=0; i < books.length; i++){
						content += "<tr><td>" + books[i].bookId + "</td>" + 
						               "<td>" + books[i].title + "</td>" +
						               "<td>" + books[i].author + "</td>" +
						               "<td>" + books[i].price + "</td>" +
						               "<td><img  width='40' height='48' " +   
						               " src='../../ch00/util/GetImage?no=" + books[i].bookId + "'></td>";

						           "</tr>";    
					}
					content += "</table>";
					var divs = document.getElementById("somedivS");
					divs.innerHTML = content;
				}
			}
		}
	}
</script>
<script>
$(document).ready(
	function() {
	$('#clickmeQ').click(
		function() {
			$("#somedivS").empty();
		    $.getJSON('../_03/allBooks.json',
				function(categoriesJson) {
		    	
				var $table = $(
				'<table border="1">')
					.appendTo(
					$('#somedivS'));
				     $.each(categoriesJson,
		             function(index, element) {
						$('<tr>').appendTo($table)
						.append($('<td>').text(element.bookId))
						.append($('<td>').text(element.title))
						.append($('<td>').text(element.author + "(JQuery版)"))
						.append("<td><img src='../../ch00/util/GetImage?no=" + element.bookId + "'></td>")
						
								;
					  });
				});
			});
			});
</script>
</head>
<body>
	<h3>由前端的jQuery()發出Ajax請求，後端程式送回純Json格式的資料，由前端的jQuery程式組合成一個網頁</h3>
	<a href='..'>回前頁</a>
	<p />

	<!-- 
// Call-Back function/Mathod 回呼函數/方法
 -->
	<button id='clickmeS'>Click Me(JavaScript)</button>
	<button id='clickmeQ'>Click Me(JQuery)</button>
	<hr>
	<div id='somedivS'></div>

</body>
</html>