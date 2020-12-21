<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%    	
	request.setCharacterEncoding("utf-8");	// post방식의 다국어처리
	//form_ok.jsp
    out.println("form_ok.jsp<br />");

	String data1 = request.getParameter("data1");
	String data2 = request.getParameter("data2");
	
	out.println("data1 : " + data1 + "<br />");
	out.println("data2 : " + data2 + "<br />");
%>