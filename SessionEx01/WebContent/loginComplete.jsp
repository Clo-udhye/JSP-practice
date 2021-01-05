<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int flag = 1;
	if(session.getAttribute("login_id") != null && !session.getAttribute("login_id").equals("")){
		// 로그인 성공
		flag = 0;
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
	if(flag==1){
		out.println("<script type='text/javascript'>");
		out.println("alert('로그인 하셔야합니다.');");
		out.println("location.href='loginForm.jsp';");
		out.println("</script>'");
	}else{
		out.println("로그인 되었습니다.<br /><br />");
		out.println("<a href='logout.jsp'>로그아웃</a>");
	}
%>

</body>
</html>