<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String msg = "Hello 안녕";
	String encodeMsg = URLEncoder.encode(msg, "utf-8");
	out.println(encodeMsg + "<br />");
	String decodeMsg = URLDecoder.decode(encodeMsg, "utf-8");
	out.println(decodeMsg + "<br />");
%>
</body>
</html>