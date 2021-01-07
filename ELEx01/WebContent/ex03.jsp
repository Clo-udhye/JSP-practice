<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name1 = "홍길동";
	//pageContext, request, session, application
	pageContext.setAttribute("name2", "박문수");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	out.println(name1 + "<br />");
%>
name1 :<%= name1 %><br />

name2 : ${ name2 }<br />
name2 : <%=pageContext.getAttribute("name2") %><br />

name2 : ${ pageScope.name2 }<br />
name2 : ${ pageScope['name2'] }<br />
</body>
</html>