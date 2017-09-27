<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
<meta charset="UTF-8">
<title>讀取XML文件</title>
</head>
<body>
<div class='center'>
<script>
xhr = new XMLHttpRequest();
if (xhr!=null){
	xhr.onreadystatechange = processXML;//    回呼
	var sourceURL = "CD.xml";
	xhr.open("GET", sourceURL, true);
	xhr.send();
}
function processXML(){
	if (xhr.readyState === 4) {
		// 伺服器回應成功
		if (xhr.status === 200) {
			xmlDoc = xhr.responseXML;
			var txt = "";
			var x = xmlDoc.getElementsByTagName("ARTIST");
			var t = xmlDoc.getElementsByTagName("TITLE");

	        if (x.length > 0) {
				txt += "<table border='1' style='margin-left:auto; margin-right:auto;'>";
				txt += "<tr><th colspan='2'>精選世界名曲</th></tr>";
				txt += "<tr><th width='300'>作者</th><th width='300'>曲名</th></tr>";
				for (i = 0; i < x.length; i++) {
					txt += "<tr>";
					txt += "<td>" + x[i].childNodes[0].nodeValue + "</td>";
					txt += "<td>" + t[i].childNodes[0].nodeValue + "</td>";
					txt += "</tr>";
				}
				txt += "</table>";
			}
			document.getElementById("result").innerHTML = "<font color='blue'>"
					+ txt + "</font>";
			}
		}
	}
</script>

<div id='result'>
</div>
<%@ include file='/segment/upPage.jsp' %>
</div>
</body>
</html>