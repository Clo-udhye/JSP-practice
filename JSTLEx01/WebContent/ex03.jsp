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

<c:set var="data1" value="test1" />	<!--  scope defalut : page -->
<c:set var="data2" value="test2" scope="request"/>

<%
	pageContext.setAttribute("data1", "test1");
	request.setAttribute("data2", "test2");
	session.setAttribute("data3", "test3");
	application.setAttribute("data4", "test4");
%>

<c:set var="data1" value="test1" scope="page" />
<c:set var="data2" value="test2" scope="request" />
<c:set var="data3" value="test3" scope="session" />
<c:set var="data4" value="test4" scope="application" />

출력 : ${ requestScope.data2 }<br />
출력 : ${ sessionScope.data3 }<br />
출력 : ${ applicationScope.data4 }<br />

출력 : <c:out value="${ applicationScope.data4 }" /><br />

</body>
</html>