<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 p.76 예제3.15 요청 파라미터 출력</title>
</head>
<body>
<b>request.getParameter() 메서드 사용</b><br />
name 파라미터 = <%= request.getParameter("name") %><br />
address 파라미터 = <%= request.getParameter("address") %><br />

<p>
<b>request.getParameterValues() 메서드 사용</b><br />
<%
	String[] values = request.getParameterValues("pet");
	if(values!=null){
		for(int i=0; i<values.length; i++){
			out.println(values[i]);
		}
	}
%>
</p>
<b>request.getParemeterNames() 메서드사용</b><br />
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()){
		String name = (String)paramEnum.nextElement();
		out.println(name);
	}
%>
<p>
<b>request.getParemeterMap() 메서드사용</b><br />
<% 
	Map parameterMap = request.getParameterMap();
	String[] nameParam = (String[])parameterMap.get("name");
	if(nameParam != null){
		out.println("name = " + nameParam[0]);
	}
%>
</p>
</body>
</html>