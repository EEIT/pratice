<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	try {
		Thread.sleep(5000);
	} catch (InterruptedException e) {
		e.printStackTrace();
	}
	out.println("這是doGet()方法送出的訊息. (由JSP送出回應，同步請求的缺點)");
%>