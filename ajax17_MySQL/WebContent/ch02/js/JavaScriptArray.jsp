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
   var arr1 = new Array(100, 50, 25, 45, 80);
   var sum1 = 0;
   for (var i=0; i < arr1.length; i++){
	   sum1 += arr1[i];
   }
</script>
<div class='center'>
<h2>JavaScript 陣列處理</h2>
<div id='dataArea1' class='center'>
</div>
<hr>
<script>
var div1 = document.getElementById("dataArea1");
var tab1 = "<table border='1'>"; 
for (var i=0; i < arr1.length; i++){
   tab1 += "<tr><td  style='text-align: right; width: 124px;'>" + arr1[i] + "&nbsp;&nbsp;&nbsp;</td></tr>";
}
tab1 += "<tr><td>" + "總和:" + sum1 + "</td></tr>"; 
tab1 += "</table>";
div1.innerHTML=tab1;
</script>
<%@ include file='/segment/previousPage.jsp' %>
</div>
</body>
</html>