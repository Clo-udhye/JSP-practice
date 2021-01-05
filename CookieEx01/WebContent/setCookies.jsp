<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie cookie1 = new Cookie("data1", "value1");
	response.addCookie(cookie1);	// 쿠키전송 -> 쿠키저장소 저장
	
	Cookie cookie2 = new Cookie("data2", "value2");
	response.addCookie(cookie2);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키생성
<br /><hr /><br />
<%
	out.println("쿠키명 : " + cookie1.getName() + "<br />");
	out.println("쿠키값 : " + cookie1.getValue() + "<br />");
	
	out.println("쿠키명 : " + cookie2.getName() + "<br />");
	out.println("쿠키값 : " + cookie2.getValue() + "<br />");
%>

</body>
</html>