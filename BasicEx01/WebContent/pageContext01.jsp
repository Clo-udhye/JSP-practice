<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.println("Hello JSP<br />");

	JspWriter writer = pageContext.getOut();
	// getRequest()
	// getResponse()
	
	//writer - out
	out.println(out + "<br />");
	out.println(writer + "<br />");
	
	writer.println("Hello JSP<br />");
%>