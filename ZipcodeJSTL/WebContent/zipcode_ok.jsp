<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% 
	request.setCharacterEncoding("utf-8");
%>

<s:query var="rs" dataSource="jdbc/mariadb1"> 
	select zipcode, sido, gugun, dong, ri, bunji from zipcode where dong like ?
	<s:param value="${ param.dong }%" />
</s:query>
	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" width="800">	
	<tr><td>우편번호</td><td>시도</td><td>구군</td><td>동</td><td>리</td><td>번지</td></tr>
	<c:forEach var="data" items="${ rs.rows }">
		<tr>
	 		<td>${ data["zipcode"] }</td>
	 		<td>${ data["sido"] }</td>
	 		<td>${ data["gugun"] }</td>
	 		<td>${ data["dong"] }</td>
	 		<td>${ data["ri"] }</td>
	 		<td>${ data["bunji"] }</td>
		</tr>
	</c:forEach>	
</table>

</body>
</html>