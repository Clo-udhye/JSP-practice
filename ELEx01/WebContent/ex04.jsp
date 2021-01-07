<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	pageContext.setAttribute("name1", "홍길동");
	request.setAttribute("name2", "박문수");
	session.setAttribute("name3", "성춘향");
	application.setAttribute("name4", "이몽룡");
	
	pageContext.setAttribute("name", "홍길동");
	request.setAttribute("name", "박문수");
	session.setAttribute("name", "성춘향");
	application.setAttribute("name", "이몽룡");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${ name1 }<br />
${ name2 }<br />
${ name3 }<br />
${ name4 }<br />
<hr /><br />

<br />
${ name }<br />	<!-- 가장 가까운 영역의 호출 -->
<hr /><br />

<br />
${ pageScope.name }<br />
${ requestScope.name }<br />
${ sessionScope.name }<br />
${ ApplicationScope.name }<br />
</body>
</html>