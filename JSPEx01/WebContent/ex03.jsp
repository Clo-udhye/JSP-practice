<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	out.println("<table border='1' width='600'>");
	for(int row=1; row<=3; row++){	
		out.println("<tr>");
		for(int col=1; col<=3; col++){
			out.println("<td>1</td>");
		}
		out.println("</tr>");
	}
	out.println("</table>");
%>
</body>
</html>