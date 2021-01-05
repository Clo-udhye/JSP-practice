<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	out.println("Hello Include<br />");
	out.println("data1 : " + request.getParameter("data1")+"<br />");
	out.println("data2 : " + request.getAttribute("data2")+"<br />");
	
	out.println("data3 : " + request.getParameter("data3")+"<br />");

%>