<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	out.println(session.getId() + "<br />");
	out.println(session.getCreationTime() + "<br />");
	out.println(session.getLastAccessedTime() + "<br />");
	
	java.util.Date date = new java.util.Date(session.getCreationTime());
	out.println(date.toLocaleString() + "<br />");
%>
</body>
</html>	