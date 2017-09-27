<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html> 
<head>
<title>根節點</title>
<script>
  window.onload=function(){
      var msg = document.getElementById("msg");
      msg.innerHTML = "HTML網頁的Root Node為" +  
    	  "<font color='red'>" +
    	    document.documentElement.nodeName + ",  nodeType=" +
    	    document.documentElement.nodeType +
    	  "</font>" ;
  }
</script>
</head>
<body>
<h2>根節點</h2>
<div id='msg'></div>
<hr>
</body>
</html>

