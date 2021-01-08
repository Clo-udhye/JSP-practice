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

<c:set var="data1" value="test1" />
출력 : <c:out value="${ data1 }" /><br />
<c:remove var="data1" />
출력 : <c:out value="${ data1 }" default="값없음" /><br />

</body>
</html>