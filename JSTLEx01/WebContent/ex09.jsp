<%@page import="java.util.HashMap"%>
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

<c:set var="intArr" value="<%= new int[]{1, 2, 3, 4, 5} %>" />
<c:out value="${ intArr[0] }" /><br />
<c:out value="${ intArr[1] }" /><br />
<c:out value="${ intArr[2] }" /><br />

<hr />

<!-- 배열 인덱스에 의존 -->
<c:forEach var="data" items="${ intArr }" begin="2" end="4">
	<c:out value="${ data }" /><br />
</c:forEach>

<hr />

<c:set var="strArr" value='<%=new String[]{"AA", "BB", "CC", "DD", "EE"} %>' />
<c:forEach var="data" items="${ strArr }">
	<c:out value="${ data }" /><br />
</c:forEach>

<hr />
<%
	//java
	//java.util.HashMap<String, Object> hm1 = new HashMap<String, Object>();
	//hm1.put("name", "홍길동");	
	//hm1.put("today", new java.util.Date());
%>

<c:set var="hm1" value = "<%= new java.util.HashMap() %>" />
<c:set target="${ hm1 }" property="name" value="홍길동" />
<c:set target="${ hm1 }" property="today" value="<%= new java.util.Date() %>" />

<c:forEach var="data" items="${ hm1 }">
	${ data.key } = ${ data.value };<br />
</c:forEach>


</body>
</html>