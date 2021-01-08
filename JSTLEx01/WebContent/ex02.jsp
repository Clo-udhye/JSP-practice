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
	//String data1 = "test1";	//=> 출력 : <%= data1
	pageContext.setAttribute("data1", "test1");
	request.setAttribute("data2", "test2");
%>

출력 : ${ data1 }<br />
출력 : <c:out value="${ data1 }" /><br />
출력 : <%= pageContext.getAttribute("data1") %><br />
출력 : <%= request.getAttribute("data2") %><br />

</body>
</html>