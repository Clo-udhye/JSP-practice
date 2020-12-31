<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		
		conn = dataSource.getConnection();
		
		String sql = "insert into album_board1 values(0, ?, ?, ?, ?, ?, ?, ?, 0, ?, now())";
		pstmt = conn.prepareStatement(sql);
		for(int i=1; i<=100; i++){
			pstmt.setString(1, "제목"+i);
			pstmt.setString(2, "글쓴이");
			pstmt.setString(3, "test@test.com");
			pstmt.setString(4, "1234");
			pstmt.setString(5, "내용"+i);
			pstmt.setString(6, "christmas.jpg");
			pstmt.setLong(7, 138932);
			pstmt.setString(8, "000.000000.000");
			
			pstmt.executeUpdate();
		}
	} catch(NamingException e){
		System.out.println("[에러] " + e.getMessage());
	} catch(SQLException e){
		System.out.println("[에러] " + e.getMessage());
	} finally {
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
	
	out.println("<script type='text/javascript'>");
	out.println("alert('글쓰기에 성공했습니다.');");
	out.println("location.href='board_list1.jsp';");	
	out.println("</script>");
	
%>