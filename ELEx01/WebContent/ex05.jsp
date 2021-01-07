<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Enumeration"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더정보가져오기 -->

<%
	Enumeration e = request.getHeaderNames();
	while(e.hasMoreElements()){
		String name = (String)e.nextElement();
		String value = request.getHeader(name);
		out.println(name + "/" + value + "<br />");
	}
%>

<br /><hr /><br />

${header['host'] }<br />
${header.host }<br />
${header['user-agent'] }<br />	<!-- 가능 -->
\${header.user-agent}<br />	<!-- 특수기호 - 때문에 불가능 -->

</body>
</html>