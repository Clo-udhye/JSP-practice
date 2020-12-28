<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
시작<br />
<%
	String data = "value1";
%>
<jsp:include page="./sub.jsp">
	<jsp:param name="data1" value="<%= data %>" />
	<jsp:param name="data2" value="value2" />
</jsp:include>
끝<br />
</body>
</html>