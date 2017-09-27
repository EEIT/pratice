<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html> 
<head>
<title>瀏覽兄弟節點</title>
<script>

function showAllSiblings(){
   var parentNode = document.getElementById("myLI").parentNode;
  
   var result = "";
   for (var i=0; i< parentNode.children.length; i++){
       result += parentNode.children[i].nodeName + " [" + parentNode.children[i].firstChild.data + "]  \n";
   }
   alert(result);
}
</script>
</head>
<body>
<h2>瀏覽兄弟節點</h2>
<hr>
<ul id="myUL">
   <li>Java</li>
   <li>JavaScript</li>
   <li id="myLI" onclick="showAllSiblings()">CSS(按我)</li>
   <li>JQuery</li>
   <li>XML</li>
</ul>
</body>
</html>
