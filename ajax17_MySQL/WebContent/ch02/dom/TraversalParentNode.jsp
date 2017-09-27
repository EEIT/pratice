<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html> 
<head>
<title>瀏覽父節點</title>
<script>
function showParentNode(tid){
   var objNode = document.getElementById (tid).parentNode;
   alert("nodeName=" + objNode.nodeName + ", nodeType=" + objNode.nodeType);
}
</script>
</head>
<body>
<h2>瀏覽父節點</h2>
<hr>
<ul id="myUL">
   <li>HTML
   <li id="js" onclick="showParentNode(this.id)">
        <font color="red">JavaScript</font>
   <li id="vs" onclick="showParentNode(this.id)">
        <font color="red">VBScript</font>
   <li>ASP
   <li>XML
</ul>
</body>
</html>

