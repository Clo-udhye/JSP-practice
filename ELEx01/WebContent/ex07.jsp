<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.BoardTO"%>
<%
	BoardTO to1 = new BoardTO();
	to1.setSubject("제목1");
	to1.setWriter("작성자1");
	
	BoardTO to2 = new BoardTO();
	to2.setSubject("제목2");
	to2.setWriter("작성자2");
	
	
	BoardTO[] lists = {to1, to2};
	request.setAttribute("lists", lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
제목 : ${lists[0].subject}<br />
작성자 : ${lists[0].writer}<br />

제목 : ${lists[1].subject}<br />
작성자 : ${lists[1].writer}<br />

제목 : ${lists[2].subject}<br />	<!-- 널일때 처리를 따로 안해줘도 에러가 나지않음 -->
작성자 : ${lists[2].writer}<br />
</body>
</html>