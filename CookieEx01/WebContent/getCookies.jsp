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
	Cookie[] cookies = request.getCookies();

	// 쿠키가 존재하면
	if(cookies!=null && cookies.length > 0){
		for(int i=0; i<cookies.length; i++){
			out.println(cookies[i].getValue() + "<br />");
		}
	} else {
		out.println("쿠키 없음");
	}
%>

</body>
</html>