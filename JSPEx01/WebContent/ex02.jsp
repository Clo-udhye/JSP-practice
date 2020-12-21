<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- html 주석 -->
Hello JSP1<br />
<%
	// Java 주석
	// console 출력 (디버깅 .. 에러 확인)
	System.out.println("Hello JSP2");
	// html 출력
	for(int i=1; i<=3; i++){
		out.println("<b>Hello JSP3</b><br />");
	}
%>
</body>
</html>