<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	out.println(request.getParameter("data3") + "<br />");

	request.setAttribute("data2", "value2");
%>

<jsp:include page="sub.jsp">
	<jsp:param name="data1" value="value1" />
</jsp:include>

</body>
</html>