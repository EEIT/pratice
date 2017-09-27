<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css'  type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVC</title>
</head>
<body>
<CENTER>
<H1>加入會員</H1>
<HR>
<script>
window.onload = function(){ 
    var btn = document.getElementById("submitForm");
    var div = document.getElementById("div");
    btn.onclick = function(){
        var userId = document.getElementById("userId").value;
        var pswd = document.getElementById("pswd").value;
        var userName = document.getElementById("userName").value;
        var eMail = document.getElementById("eMail").value;
        var experience = document.getElementById("experience").value;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "ReadFormData.do", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        var data = "userId=" + userId + "&pswd=" + pswd + "&userName=" + 
        	userName + "&eMail=" + eMail + "&experience=" + experience;
        xhr.send(data);
        xhr.onreadystatechange = function() {
            // 向伺服器提出的請求已經收到回應
            if (xhr.readyState === 4) {
                // status: HTTP通訊協定的狀態碼伺服器，
                // 200表示Server成功的處理請求
                if (xhr.status === 200) {
                	div.innerHTML = "Server送回Client送來的資料: " + xhr.responseText;              		
                }
            }                	
        }
    }
</script>
<Form Action="register.do" method="POST">
    <Table>
         <TR>
             <TD align="RIGHT">帳號：</TD>
             <TD align="LEFT">
             <input	type="text" name="userId" id="userId" value="" size="20">
             </TD>
         </TR>
         <TR>
             <TD align="RIGHT">密碼：</TD>
             <TD align="LEFT" >
             <input	type="password" name="pswd" id="pswd" value="" size="20">
             </TD>
         </TR>             
         <TR>
             <TD align="RIGHT">姓名：</TD>
             <TD align="LEFT" >
             <input	type="text" name="userName" id="userName"  value=""  size="30">
             </TD>
         </TR>             
         <TR>
             <TD align="RIGHT">EMail：</TD>
             <TD align="LEFT" >
             <input type="text" name="eMail" id="eMail"  value="" size="40">
             </TD>
         </TR>             
         <TR>
             <TD align="RIGHT">電話號碼：</TD>
             <TD align="LEFT" > 
             <input type="text" name="tel"  id="tel"  value="">
             </TD>
         </TR>             
         <TR>
             <TD align="RIGHT">使用Java經驗：</TD>
             <TD align="LEFT" > 
             <input type="text" name="experience" id="experience" value="" size="3"> 年
             </TD>
         </TR>    
        <TR>
            <TD colspan="2" align="center">      
            	<input id='submitForm' type="submit" value="提交"> 
            </TD>
            </TR>
         </Table>
</Form>
</CENTER>
<div id='div'></div>
</body>
<small>&lt;&lt;<a href="../">回首頁</a>&gt;&gt;</small>
</html>
