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
<%
	pageContext.setAttribute("data1", "value1");
%>

출력 : <%= pageContext.getAttribute("data1") %><br />
출력 : ${ data1 }<br />
출력 : <c:out value="${ data1 }" /><br />
출력 : <c:out value="${ data2 }" default="value2"/><br />		<!-- 초기값설정, data2가 없으면 초기값을 출력 -->
출력 : <c:out value="${ data2 }">value2</c:out><br />			
출력 : <c:out value="${ data3 = 'value3'}"/><br />			<!-- 선언과 동시에 출력 -->

</body>
</html>