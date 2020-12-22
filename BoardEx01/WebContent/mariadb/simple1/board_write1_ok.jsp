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

<% 
	request.setCharacterEncoding("utf-8");

	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String mail = request.getParameter("mail1") + "@" + request.getParameter("mail2");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	
	// 글쓴이 아이피
	String wip = request.getRemoteAddr();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int flag = 1;
	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb1");
		
		conn = dataSource.getConnection();
		
		String sql = "insert into board1 values (0, ?, ?, ?, ?, ?, 0, ?, now())";
		pstmt = conn.prepareStatement(sql);		
		pstmt.setString(1, subject);
		pstmt.setString(2, writer);
		pstmt.setString(3, mail);
		pstmt.setString(4, password);
		pstmt.setString(5, content);
		pstmt.setString(6, wip);
		
		int result = pstmt.executeUpdate();
		if(result==1){
			flag = 0;
		}
		
	} catch(NamingException e){
		System.out.println("[에러] " + e.getMessage());
	} catch(SQLException e){
		System.out.println("[에러] " + e.getMessage());
	} finally {		
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
	
	
	//결과
	out.println("<script type='text/javascript'>");
	if(flag==0){
		//out.println("성공");
		out.println("alert('글쓰기에 성공했습니다.');");
		out.println("location.href='board_list1.jsp';");	// 페이지 자동이동
	} else {
		//out.println("실패");
		out.println("alert('글쓰기에 실패했습니다.');");
		out.println("history.back();");						// 뒤로가기
	}
	out.println("</script>");
%>