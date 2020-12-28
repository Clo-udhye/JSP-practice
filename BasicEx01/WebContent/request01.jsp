<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더정보(숨겨진 정보) -->
<%
	Enumeration e = request.getHeaderNames();
	while(e.hasMoreElements()){
		String name = (String)e.nextElement();
		String value = request.getHeader(name);
		out.println(name +" : "+ value +"<br />");
	}
%>
</body>
</html>