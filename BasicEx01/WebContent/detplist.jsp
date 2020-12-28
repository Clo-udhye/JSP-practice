<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.DeptTO" %>
<%@ page import="model1.DeptDAO" %>
<%@ page import="java.util.ArrayList"%>

<%
	DeptDAO dao = new DeptDAO();
	ArrayList<DeptTO> lists = dao.listDept();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for(DeptTO to : lists){
		out.println(to.getDeptno() + "/" + to.getDname() + "/" + to.getLoc() + "<br />");
	}
%>
</body>
</html>