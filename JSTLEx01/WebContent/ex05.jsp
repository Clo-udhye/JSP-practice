<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- BoardTO to1 = new BoardTO(); -->
<c:set var="to1" value="<%= new model1.BoardTO() %>" scope="page"/>	<%-- 생성자 호출 --%>
<c:set target="${ to1 }" property="subject" value="제목1" />
<c:set target="${ to1 }" property="writer" value="작성자1" />

<c:set var="to2" value="<%= new model1.BoardTO() %>" scope="page"/>
<c:set target="${ to2 }" property="subject" value="제목2" />
<c:set target="${ to2 }" property="writer" value="작성자2" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

제목 : ${ to1.subject }<br />
제목 : <c:out value="${ to1.subject }" /><br />
작성자 : ${ to1.writer }<br />
제목 : ${ to2.subject }<br />
작성자 : ${ to2.writer }<br />

</body>
</html>