
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>
    
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Context initCtx = new InitialContext();
		// 자바 환경변수 검색
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb1");
		
		conn = dataSource.getConnection();
		//out.println("연결 성공");
		
		String sql = "select deptno, dname, loc from dept";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		while(rs.next()){
			out.println(rs.getString("deptno")+"<br />");
		}
		
		
	} catch(NamingException e){
		out.println("[에러] " + e.getMessage());
	} catch(SQLException e){
		out.println("[에러] " + e.getMessage());
	} finally {
		if(rs!=null) rs.close();		
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
%>
</body>
</html>