<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String callback = request.getParameter("callBackMethod");
  if (callback == null){
	  callback = "alert";
  } 
  String msg  = "([{\"name\":\"劉麗芳\", \"age\":19}, {\"name\":\"黎文林\", \"age\":20}])";
  out.print(callback + msg);
%>