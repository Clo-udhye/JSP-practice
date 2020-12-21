<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public int multiply (int a, int b){
		int multi = a+b;
		//System.out.println(multi);
		//out.println(multi);	// 사용 불가능
		return multi;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int result = multiply(10, 20);
		out.println("결과 : " + result + "<br />");
	%>
	<%= "결과 : " + result + "<br />" %>
</body>
</html>