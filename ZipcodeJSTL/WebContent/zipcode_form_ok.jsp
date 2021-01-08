<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% 
	request.setCharacterEncoding("utf-8");
%>

<s:setDataSource 
	var="ds" 
	dataSource="jdbc/mariadb1"
	scope="page" />

<c:if test='${!param.dong.equals("") && param.dong != null}' >
	<s:query var="rs" dataSource="${ ds }"> 
		select zipcode, sido, gugun, dong, ri, bunji from zipcode where dong like ?
		<s:param value="${ param.dong }%" />
	</s:query>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	const checkfrm = function() {
		if( document.frm.dong.value.trim() == '' ) {
			alert( '동이름을 입력해 주세요' );
			return;
		}
		document.frm.submit();
	};
</script>
</head>
<body>

<form action="./zipcode_form_ok.jsp" method="post" name="frm">
<input type="hidden" name="action" value="zipcode_ok">
동이름 <input type="text" name="dong" />
<input type="button" value="동이름 검색" onclick="checkfrm()" />
</form>

<br /><hr /><br />

<table border="1" width="800">	
	<tr><td>우편번호</td><td>시도</td><td>구군</td><td>동</td><td>리</td><td>번지</td></tr>
	<c:forEach var="data" items="${ rs.rows }">
		<tr>
	 		<td>${ data["zipcode"] }</td>
	 		<td>${ data["sido"] }</td>
	 		<td>${ data["gugun"] }</td>
	 		<td>${ data["dong"] }</td>
	 		<td>${ data["ri"] }</td>
	 		<td>${ data["bunji"] }</td>
		</tr>
	</c:forEach>	
</table>

</body>
</html>