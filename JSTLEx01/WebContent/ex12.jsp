<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forTokens var="c" items="1,2,3,4,5" delims=",">
	데이터 : ${ c }<br />
</c:forTokens>

<hr />
<c:set var="lists" value="빨간색,주황색.노란색,파란색,남색.보라색" />	<!-- 여러개의 delims -->
<c:forTokens var="c" items="${ lists }" delims=",.">
	데이터 : ${ c }<br />
</c:forTokens>

</body>
</html>