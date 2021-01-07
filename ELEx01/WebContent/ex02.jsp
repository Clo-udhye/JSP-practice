<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table width="800" border="1">
	<tr>
		<td width="50%">표현식</td>
		<td>값</td>
	</tr>
	
	<tr>
		<td>\${2 < 3}</td>
		<td>${2 < 3}</td>
	</tr>
	
	<tr>
		<td>\${2 lt 3}</td>
		<td>${2 lt 3}</td>
	</tr>
	
	<tr>
		<td>\${empty data}</td>
		<td>${empty data}</td>
	</tr>
	
	<tr>
		<td>\${(2<3) ? "작다" : "크다"}</td>
		<td>${(2<3) ? "작다" : "크다"}</td>
	</tr>
</table>
</body>
</html>