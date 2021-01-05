<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="./servlet02" method="get">
data1 <input type="text" name="data1" />
<input type="submit" value="get 전송" />
</form>

<form action="./servlet02" method="post">
data2 <input type="text" name="data2" />
<input type="submit" value="post 전송" />
</form>

</body>
</html>