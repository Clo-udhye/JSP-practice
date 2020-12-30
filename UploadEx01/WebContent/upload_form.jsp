<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="upload_ok01.jsp" method="post" enctype="multipart/form-data"> 
<!-- <form action="upload_ok02.jsp" method="post" enctype="multipart/form-data"> --> 
파일1 : <input type="file" name="upload1" />
파일2 : <input type="file" name="upload2" />
<input type="submit" value="파일전송" />
</form>

</body>
</html>