<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.BoardTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%
	BoardTO to1 = new BoardTO();
	to1.setSubject("제목1");
	to1.setWriter("작성자1");
	
	BoardTO to2 = new BoardTO();
	to2.setSubject("제목2");
	to2.setWriter("작성자2");
	
	
	//ArrayList<BoardTO> lists = new ArrayList();
	//lists.add(to1);
	//lists.add(to2);
	
	HashMap<String, BoardTO> lists = new HashMap();
	lists.put("to1", to1);
	lists.put("to2", to2);
	
	request.setAttribute("lists", lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- ArrayList도 배열화해서 값을 가져올수있도록 내부적으로 구현되어있다. -->
<!-- 
제목 : ${lists[0].subject}<br />	
작성자 : ${lists[0].writer}<br />

제목 : ${lists[1].subject}<br />
작성자 : ${lists[1].writer}<br />
 -->

<!-- HashMap - 접근방법 -->
제목 : ${lists.to1.subject}<br />	
작성자 : ${lists.to1.writer}<br />

제목 : ${lists.to2.subject}<br />	
작성자 : ${lists.to2.writer}<br />

제목 : ${lists['to1'].subject}<br />		<!-- 배열식으로 접근도 가능 -->	
작성자 : ${lists['to1']['writer']}<br />

</body>
</html>