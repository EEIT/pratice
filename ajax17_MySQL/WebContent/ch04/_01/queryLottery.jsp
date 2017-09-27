<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c'  uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
<script type="text/JavaScript">
window.onload = function(){ 
	var btn = document.getElementById("btn");
	btn.onclick = function(){
	    var name = document.getElementById("visitor").value;
	   	var xhr = new XMLHttpRequest();
	   	xhr.open("POST", "LotteryServlet", true);
	   	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	   	xhr.send("visitor=" + name);
	    	
	   	xhr.onreadystatechange = function() {
		// 向伺服器提出的請求已經收到回應
	        if (xhr.readyState === 4) {
	        // status: HTTP通訊協定的狀態碼伺服器，
	        // 200表示Server成功的處理請求
	            if (xhr.status === 200) {
	          	// getResponseHeader: 取得回應內容的MIME Type
	                var type = xhr.getResponseHeader("Content-Type");   
	                // 判斷回應類型，這裡使用 JSON
	                 if (type.indexOf("application/json") === 0) {               
	                      var data = JSON.parse(xhr.responseText);
	                        if (data.number) {
	                            document.getElementById("lotterResult").innerHTML =
	                            	"<font color='red'>" + data.name  + '</font> 您好，' + 
	                            	'您的明牌為：' + data.number ;
	                        } else {
	                            document.getElementById("lotterResult").innerHTML = "資料錯誤";
	                        }
	                    }
	                } else {
	                    alert("發生錯誤1: " + xhr.status + ", " + xhr.responseText);
	                }
	            } 
	    	}
	    }
};
</script>

<meta charset="UTF-8">
<title>我的第一個AJAX程式</title>
</head>

<body>
<div class='center'>
<h2>查詢明牌</h2>
<Form action="<c:url value='LotteryServlet' />" method="POST">
    訪客姓名:<input id='visitor' type="text" name="visitor" size = "10"><P/>
  <input id='btn' type="button" value="確定"><P/>
</Form>

<div id='lotterResult'>
&nbsp;<br/>
</div>
<hr>
<p>	
<div id='control_Flow'>
<small>
按下"確定"按鈕後，瀏覽器向後端程式(ch04._01.LotteryServlet.java)發出AJAX非同步請求,
該程式會向Model元件(ch04._01.LotteryBean.java)要求樂透號碼(lottery.getLuckyNumbers();)，
得到樂透號碼後，接著將要送往前端程式的資料(name與number)放入Map物件(map)內，由Gson的toJson()方法
將map物件轉為JSON格式的資料，最後由out物件寫出給前端程式。
</small>
</div>
<%@ include file='/segment/upPage.jsp' %>
</div>
</body>
</html>