<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
클라이언트 ip = <%=request.getRemoteAddr() %><br />
인코딩 = <%= request.getCharacterEncoding() %><br />
컨텐트타입 = <%= request.getContentType() %><br />
전송방식 = <%= request.getProtocol() %><br />
요청URI = <%= request.getRequestURI() %><br /> <!-- 도메인 빼고 -->
요청URL = <%= request.getRequestURL() %><br /> <!-- 도메인 포함 -->

<hr/>
서버이름 = <%= request.getServerName() %><br />
서버포트 = <%= request.getServerPort() %><br />
</body>
</html>