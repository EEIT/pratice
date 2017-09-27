<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
<meta charset="UTF-8">
<title>Array</title>
</head>
<body>

<script>
var customer = new  Object();      // 方法1
customer.name = "張君雅";
customer.address = "新北市板橋區";

var product = 
   {
	 "name": "鉛筆",  
	 "price": 15.5, 
	 "quantity": 300
   };      //方法2

</script>
<div class='center'>
<h2>JavaScript 物件處理</h2>
<div id='dataArea1' class='center'>
	
</div>
<hr>
<div id='dataArea2' class='center'>

</div>
<script>
   var div1 = document.getElementById("dataArea1");
   var div2 = document.getElementById("dataArea2");
   var tab1 = "<table border='1'>" + 
              "<tr><th>姓名</th><th>地址</th></tr>" + 
              "<tr><td>" + customer.name +"</td><td>" + customer.address + "</td></tr>" +
              "</table>" ;
   var tab2 = "<table border='1'>" + 
              "<tr><th>產品名稱</th><th>價格</th><th>數量</th></tr>" + 
              "<tr><td>" + product.name + "</td><td>" + product.price  + "</td><td>" + product.amount + "</td></tr>" +
              "</table>" ;              
   
   div1.innerHTML=tab1;
   div2.innerHTML=tab2;
</script>
<%@ include file='/segment/previousPage.jsp' %>
</div>
</body>
</html>