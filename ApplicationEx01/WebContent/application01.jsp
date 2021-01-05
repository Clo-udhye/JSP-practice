<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Enumeration<String> params = application.getInitParameterNames();
	while(params.hasMoreElements()){
		//out.println(params.nextElement() + "<br />");
		String param = params.nextElement();
		
		out.println(param + "/" + application.getInitParameter(param) + "<br />");
	}
%>

</body>
</html>