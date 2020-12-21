<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- form.jsp -->

<!-- get 방식 -->
<form action="form_ok.jsp" method="get">
data1 <input type="text" name="data1" /><br />
data2 <input type="text" name="data2" /><br />
<input type="submit" value="전송" />
</form>

<br /><hr /><br />

<a href="form_ok.jsp?data1=value1&data2=value2">전송</a>

<br /><hr /><br />

<!-- post 방식 -->
<form action="form_ok.jsp" method="post">
data1 <input type="text" name="data1" /><br />
data2 <input type="text" name="data2" /><br />
<input type="submit" value="전송" />
</form>

</body>
</html>