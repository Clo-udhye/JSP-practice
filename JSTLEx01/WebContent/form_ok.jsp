<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : ${ param.name }<br />
성적1 : ${ param.grade }<br />	<!-- 앞에거만 나온다 -->
성적1 : ${ paramValues.grade[0] }<br />
성적2 : ${ paramValues.grade["1"] }<br />

<hr />

<c:forEach var="p" items="${paramValues}">
	${ p.key }<br />
	<c:forEach var="val" items="${ p.value }">
		param : ${ p.key } / ${ val }<br />
	</c:forEach>
</c:forEach>


</body>
</html>