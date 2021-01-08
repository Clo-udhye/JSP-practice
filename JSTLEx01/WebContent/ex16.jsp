<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:import var="htmlData" url="https://m.daum.net"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

html 내용 : <br />
<textarea rows="50" cols="800">
	${ htmlData }
</textarea>

</body>
</html>