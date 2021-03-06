<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");

	String cpage = request.getParameter("cpage");
	String seq = request.getParameter("seq");
	String password = request.getParameter("password");
	
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String mail = "";
	if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
		mail = request.getParameter("mail1") + "@" + request.getParameter("mail2");
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	// 정상처리 / 비정상 => 결과를 통합처리하기위한 변수
	int flag = 2;
	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		
		conn = dataSource.getConnection();
		
		// 비밀번호는 프로그램 안쪽으로 가지고 들어오지않는다. 
		String sql = "update board1 set subject = ?, content = ?, mail = ?  where seq = ? and password = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, content);
		pstmt.setString(3, mail);
		pstmt.setString(4, seq);
		pstmt.setString(5, password);
		
		
		int result = pstmt.executeUpdate();
		if(result == 0){
			// 비밀번호 오류
			flag = 1;
		} else if(result == 1){
			// 정상
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
	
	out.println("<script type='text/javascript'>");
	if(flag == 0){
		out.println("alert('글수정에 성공했습니다.');");
		out.println("location.href='board_modify1.jsp?cpage="+ cpage +"&seq=" + seq +"';");
	} else if(flag == 1){
		out.println("alert('비밀번호가 잘못되었습니다.');");
		out.println("history.back();");
	} else {
		out.println("alert('글수정에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>