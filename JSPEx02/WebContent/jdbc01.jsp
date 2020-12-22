<%@page import="org.mariadb.jdbc.internal.com.read.dao.Results"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
	String url = "jdbc:mysql://localhost:3306/sample";
	String user = "root";
	String password = "!123456";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	StringBuffer html = new StringBuffer();
	try{ // jsp는 Exception처리를 스스로 추가
		Class.forName("org.mariadb.jdbc.Driver");
		//out.println("드라이버 로딩 성공"); 
		
		conn = DriverManager.getConnection(url, user, password);
		
		String sql = "select deptno, dname, loc from dept";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		html.append("<table border='1' width='600'>");
		html.append("<tr>");
		html.append("<td>부서번호</td><td>부서이름</td><td>위치</td>");
		html.append("</tr>");
		while(rs.next()){
			html.append("<tr>");
			html.append("<td>" + rs.getString("deptno") + "</td>");
			html.append("<td>" + rs.getString("dname") + "</td>");
			html.append("<td>" + rs.getString("loc") + "</td>");
			html.append("</tr>");
		}
		html.append("</table>");
	} catch( ClassNotFoundException e){
		out.println("[에러] " + e.getMessage());
	} catch(SQLException e){
		out.println("[에러] " + e.getMessage());
	} finally {
		if(rs!=null) try{rs.close();} catch(SQLException e){}
		if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
		if(conn!=null) try{conn.close();} catch(SQLException e){}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//out.println(html);
%>

<%= html %>
</body>
</html>