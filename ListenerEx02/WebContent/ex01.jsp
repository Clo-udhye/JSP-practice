<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Hello Listener<br />

<%
	ServletContext context = getServletContext();
	context.setAttribute("name", "홍길동");
	out.println("context 추가완료<br />");
	
	context.setAttribute("name", "박문수");
	out.println("context 수정완료<br />");
	
	context.removeAttribute("name");
	out.println("context 삭제완료<br />");
%>
</body>
</html>