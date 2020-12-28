<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model1.ZipcodeTO" %>
<%@ page import="model1.ZipcodeDAO" %>
<%@ page import="java.util.ArrayList"%>

<%
	request.setCharacterEncoding("utf-8");
	String strDong = request.getParameter("dong");
	
	StringBuffer html = new StringBuffer();
	if(strDong != null){
		ZipcodeDAO dao = new ZipcodeDAO();
		ArrayList<ZipcodeTO> lists = dao.searchList(strDong);
		
		html.append("<table border='1' width='600'>");
		html.append("<tr>");
		html.append("<td>우편번호</td><td>시도</td><td>구군</td><td>동</td><td>리</td><td>번지</td><td>seq</td>");
		html.append("</tr>");

		for(ZipcodeTO to : lists){
			html.append("<tr>");
			html.append("<td>" + to.getZipcode() + "</td>");
			html.append("<td>" + to.getSido() + "</td>");
			html.append("<td>" + to.getGugun() + "</td>");
			html.append("<td>" + to.getDong() + "</td>");
			html.append("<td>" + to.getRi() + "</td>");
			html.append("<td>" + to.getBunji() + "</td>");
			html.append("</tr>");
		}
		html.append("</table>");
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	const checkfrm = function(){
		if(document.frm.dong.value.trim()==''){
			alert('동이름을 입력해주세요.');
			return;
		}
		document.frm.submit();
	};
</script>
</head>
<body>

<form action="SearchZipcode01.jsp" method="post" name="frm">
	동이름 <input type="text" name="dong" size="20" />
	<input type="button" value="검색" onclick="checkfrm()" />
</form>

<br /><hr /><br />

<%= html %>
</body>
</html>