<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
<meta charset="UTF-8">
<title>處理XML字串</title>
</head>
<body>
<div class='center'>
<p id="p_title"></p>
<p id="p_auther"></p>
<p id="p_year"></p>

<script>
var XMLString, parser, xmlDoc;

XMLString = "<bookstore><book>" +
"<title>Everyday Italian</title>" +
"<author>Giada De Laurentiis</author>" +
"<year>2005</year>" +
"</book></bookstore>";

parser = new DOMParser();
xmlDoc = parser.parseFromString(XMLString,"text/xml");

document.getElementById("p_title").innerHTML = "書名: " + 
xmlDoc.getElementsByTagName("title")[0].childNodes[0].nodeValue;
document.getElementById("p_auther").innerHTML = "作者: " + 
xmlDoc.getElementsByTagName("author")[0].childNodes[0].nodeValue;
document.getElementById("p_year").innerHTML = "出版年份: " + 
xmlDoc.getElementsByTagName("year")[0].childNodes[0].nodeValue;
</script>
<%@ include file='/segment/upPage.jsp' %>
</div>	
</body>
</html>