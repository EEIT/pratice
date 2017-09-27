<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class='center'>
	請挑選書籍: 
	<select id='bookNo'></select>
	<hr>
	<!-- 顯示書籍資料的區域 -->
	<div id='bookarea' class='center'>
	</div>
	<script>
		var selectElement = document.getElementById('bookNo');  // 取出select標籤
		var bookarea = document.getElementById('bookarea');     // 取出書籍資料的div標籤
		var xhr = new XMLHttpRequest();        	// 讀取書籍表格內的書籍資料
		var xhr2 = new XMLHttpRequest();		// 讀取單一書籍的資料
		// 存放所有書籍資料的書名與主鍵值，每一本書的書名與主鍵值放入一個陣列，在將此陣列放入(push)陣列bookData中
		var bookData = [];						
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var books = JSON.parse(xhr.responseText);
				for (var i = 0; i < books.length; i++) {
					// 每一本書的書名與主鍵值放入一個陣列
					var book = [ books[i].title, books[i].bookId ];
					// 在將此陣列放入(push)陣列bookData中
					bookData.push(book);
				}
		        // 將bookData內的資料全部移植到select標籤中
				for (var i = 0; i < bookData.length; i++) {
					var option = new Option(bookData[i][0], "" + bookData[i][1]);
					selectElement.options[selectElement.options.length] = option;
				}
			}
		}
		xhr.open("GET", "../_03/allBooks.json", true);
		xhr.send();
		// 定義select標籤的change事件處理函數
		selectElement.onchange = function(){
			//console.log(selectElement.selectedIndex, "" + selectElement.options[ selectElement.selectedIndex ].text , selectElement.options[ selectElement.selectedIndex ].value);
			xhr2.onreadystatechange = function() {
				if (xhr2.readyState == 4 && xhr2.status == 200) {
					var singleBook = JSON.parse(xhr2.responseText);
					//console.log(singleBook);
					// 將讀到的ㄧ筆記錄組成一個表格
					var txt = "<table border='1'>";
					txt += "<tr><td width='80'>書名</td><td width='280'>" + singleBook.title + "</td>";
					// 圖片欄位
					txt += "<td rowspan='4'><img width='80' height='120' src='../../ch00/util/GetImage?no=" + singleBook.bookId + "'></td></tr>";
					txt += "<tr><td>作者</td><td>" + singleBook.author + "</td></tr>";						
					txt += "<tr><td>價格</td><td>" + singleBook.price + "</td></tr>";
					txt += "<tr><td>ID</td><td>" + singleBook.bookId + "</td></tr>";
					txt += "</table>";
					bookarea.innerHTML = txt;
				}
			}
			//使用者挑選的書籍之主鍵值是存放在selectElement.options[ selectElement.selectedIndex ].value中
			var bookId = selectElement.options[ selectElement.selectedIndex ].value;
			// 定義open方法
			xhr2.open("GET", "../_03/singlebook.json?bookId=" + bookId, true);
			// 送出請求
			xhr2.send();
		}
	</script>
	<br>
	<%@ include file='/segment/upPage.jsp' %>
	</div>
	
</body>
</html>