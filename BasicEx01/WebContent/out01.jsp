<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="4kb" autoFlush="false"%>

<%
	//Default : 8kb
	out.println(out.getBufferSize() + "<br />");
	
	// 버퍼의 남은 용량
	out.println(out.getRemaining() + "<br />");
	
	out.println(out.isAutoFlush() + "<br />");
%>