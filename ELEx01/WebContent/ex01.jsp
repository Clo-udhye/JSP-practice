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
		<td>표현식</td>
		<td><%=2 %></td>
	</tr>
	<tr>
		<td>표현언어</td>
		<td>${"2"}</td>	<!-- 문자 -->
	</tr>
	<tr>
		<td>표현언어</td>
		<td>${2}</td>	<!-- 숫자 -->
	</tr>
	<tr>
		<td>표현언어</td>
		<td>${test}</td>
	</tr>
	<tr>
		<td>표현언어</td>
		<td>${"test"}</td>
	</tr>
	<tr>
		<td>\${2+5}</td>
		<td>${2+5}</td>	
	</tr>
	<tr>
		<td>\${2 div 5}</td>
		<td>${2 div 5}</td>	
	</tr>
	<tr>
		<td>\${2 mod 5}</td>
		<td>${2 mod 5}</td>	
	</tr>
	<tr>
		<td>\${"10" + 1}</td>
		<td>${"10" + 1}</td>	
	</tr>
	<tr>
		<td>\${"10" + "1"}</td>
		<td>${"10" + "1"}</td>	
	</tr>
	<tr>
		<td>\${"일" + "1"}</td>
		<td>${"NumberFormatException"}</td>	
	</tr>
</table>
</body>
</html>