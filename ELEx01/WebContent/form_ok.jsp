<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

아이디 : ${param.id}<br />
비밀번호 : ${param.password}<br /><br />

아이디 : ${param['id']}<br />
비밀번호 : ${param['password']}<br /><br />

${paramValues.language[0]}<br />
${paramValues.language[1]}<br />
${paramValues.language[2]}<br />
${paramValues.language[3]}<br />


</body>
</html>