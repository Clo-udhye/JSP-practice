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

<c:set var="country" value="korea" />

<c:choose>
	<c:when test="${ country == 'korea' }">
		<c:out value="${ country }" />는 춥다.<br />
	</c:when>
	<c:when test="${ country == 'canada' }">
		<c:out value="${ country }" />는 더춥다.<br />
	</c:when>
	<c:otherwise>
		겨울은 안춥다<br />
	</c:otherwise>
</c:choose>
</body>
</html>