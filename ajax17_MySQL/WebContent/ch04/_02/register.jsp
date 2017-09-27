<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
window.onload = function() {
	alink = document.getElementById("accountlink");
	alink.onclick = function() {

	var div = document.getElementById('result0');
	var userId = document.getElementById("userId").value;
	if (!userId) {
		div.innerHTML = "<font color='blue' size='-2'>請輸入帳號</font>";
		return;
	}
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "CheckUserIdServlet", true);
	xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
	xhr.send("userId=" + userId);
	var message = "";
	xhr.onreadystatechange = function() {
	// 伺服器請求完成
	if (xhr.readyState == 4 && xhr.status == 200) {
		result = JSON.parse(xhr.responseText);
		var color = "";
		if (result.custId.length == 0) {
			message = "帳號可用";
			color = 'green';
		} else if (	result.custId.startsWith("Error") ) {
			message = result.custId ;
			color = 'red';
		} else {
			message = "帳號重複，請重新輸入帳號";
			color = 'red';
		}
		div.innerHTML = "<font color='" + color + "' size='-1'>" + message
			+ "</font>";
	}
			}
		}
		var sendData = document.getElementById("sendData");
		sendData.onclick = function() {
			// 讀取欄位資料	  
			var userId = document.getElementById("userId").value;
			var pswd = document.getElementById("pswd").value;
			var email = document.getElementById("email").value;

			var hasError = false; // 設定判斷有無錯誤的旗標
			var div0 = document.getElementById('result0');
			var div1 = document.getElementById('result1');
			var div2 = document.getElementById('result2');
			var divResult = document.getElementById('resultMsg');
			// 	    if (!userId){
			// 		    div0.innerHTML = "<font color='red' size='-2'>請輸入帳號</font>";
			// 		    hasError = true;
			// 	    } else {
			// 		    div0.innerHTML = "";
			// 	    }
			// 	    if (!pswd){
			// 		    div1.innerHTML = "<font color='red' size='-2'>請輸入密碼</font>";
			//             hasError = true;
			// 	    } else {
			// 		    div1.innerHTML = "";
			// 	    }
			// 	    if (!email){
			// 		    div2.innerHTML = "<font color='red' size='-2'>請輸入eMail</font>";
			// 		    hasError = true;
			// 	    } else {
			// 		    div2.innerHTML = "";
			// 	    }
			// 	    if (hasError){
			// 		    return false;
			// 	    }
			var xhr1 = new XMLHttpRequest();
			xhr1.open("POST", "AddUser.do", true);
			xhr1.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr1.send("userId=" + userId + "&pswd=" + pswd + "&email=" + email);
			xhr1.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr1.readyState == 4 && xhr1.status == 200) {
					result = JSON.parse(xhr1.responseText);
					if (result.fail) {
						divResult.innerHTML = "<font color='red' >"
							+ result.fail + "</font>";
					} else if (result.success) {
						divResult.innerHTML = "<font color='GREEN'>"
								+ result.success + "</font>";
						div0.innerHTML = "";	
						div1.innerHTML = "";
						div2.innerHTML = "";
					} else {
						if (result.userIdError) {
							div0.innerHTML = "<font color='green' size='-2'>"
									+ result.userIdError + "</font>";
						} else {
							div0.innerHTML = "";
						}
						if (result.pswdError) {
							div1.innerHTML = "<font color='green' size='-2'>"
									+ result.pswdError + "</font>";
						} else {
							div1.innerHTML = "";
						}
						if (result.emailError) {
							div2.innerHTML = "<font color='green' size='-2'>"
									+ result.emailError + "</font>";
						} else {
							div2.innerHTML = "";
						}
					}
				} 
			}
		}
		
	}
</script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/styles.css">
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>
<div class='center'>
   <h2>加入會員</h2>
   <div id='resultMsg' style="height: 18px;"></div>
   	<br>
		<fieldset style='display: inline-block;'> 
			<legend>填寫下列資料</legend>
			帳號: <input type="text" name="userId" id='userId'><br>
			<div style='font-size: 10pt; text-align: right;'>
			    <a href='#' id='accountlink' style='font-size: 10pt;'>檢查帳號</a>
			</div>
			<div id='result0' style="height: 10px;"></div>
			<br> 密碼: <input type="password" name="pswd" id='pswd'><br>
			<div id='result1' style="height: 10px;"></div><br>
			<br> 電郵: <input type="text" name="email" id='email'>
			<div id='result2' style="height: 10px;"></div><br>
			<button id='sendData'>送出</button>
		</fieldset>
	<hr>	
	<p>	
<div id='control_Flow'>
<small>
按下"檢查帳號"超連結後，前端的JavaScript會先進行ㄧ些檢查，然後向後端程式(ch04._02.controller.CheckUserIdServlet.java)發出AJAX非同步請求。	
該程式會請Model元件(ch04._02.model.UserDAOMySQL.java)代為檢查帳號是否可用(dao.checkUserId(userId);)，
接著將該方法傳回的資料(custId)放入Map物件(map)內，由Gson的toJson()方法
將map物件轉為JSON格式的資料，最後由out物件將此資料寫出給前端程式。<br>
按下"送出"按鈕後，瀏覽器向後端程式(ch04._02.controller.AddUserServlet.java)發出AJAX非同步請求，
該程式會進行Controller的標準功能：(1)讀取使用者輸入資料，(2)進行必要的型態轉換(本程式不需要)，(3)檢查輸入資料，
(3-1)如果輸入資料有誤，將錯誤訊息送回前端，請使用者修正，(4)呼叫Model元件(ch04._02.model.UserDAOMySQL.java)
進行企業邏輯運算，(5)依照企業邏輯運算的結果送回適當的訊息。
要寫回的訊息都先放入Map物件(map)內，再由Gson的toJson()方法將map物件轉為JSON格式的資料，最後由out物件寫出給前端程式。
</small>
<div class='center'>
<%@ include file='/segment/upPage.jsp' %>	
</div>
</div>
</body>
</html>