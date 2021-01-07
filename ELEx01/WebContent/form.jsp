<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action='form_ok.jsp' method='post'>
아이디 : <input type='text' name='id' />
비밀번호 : <input type='password' name='password' /><br />

선택 :<br /> 
<input type='checkbox' name='language' value='c'/> c언어 <br />
<input type='checkbox' name='language' value='c++' /> c++언어<br />
<input type='checkbox' name='language' value='c#' /> c#언어<br />
<input type='checkbox' name='language' value='java' /> java언어<br />
<input type='submit' value='전송' />
</form>

</body>
</html>