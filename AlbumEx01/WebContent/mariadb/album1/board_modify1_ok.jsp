<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException" %>

<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.File" %>

<%
	String uploadPath = "C:/Java/jsp-workspace/AlbumEx01/WebContent/upload";
	int maxFileSize = 1024 *1024 * 2; 
	String encType = "utf-8";

	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encType, new DefaultFileRenamePolicy());
	
	String cpage = multi.getParameter("cpage");
	String seq = multi.getParameter("seq");
	String password = multi.getParameter("password");
	
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String mail = "";
	if(!multi.getParameter("mail1").equals("") && !multi.getParameter("mail2").equals("")){
		mail = multi.getParameter("mail1") + "@" + multi.getParameter("mail2");
	}
	
	String newFilename = multi.getFilesystemName("upload");
	long newFilesize = 0;
	File newFile = multi.getFile("upload");
	if(newFile != null){
		newFilesize = newFile.length();
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	

	int flag = 2;
	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		
		conn = dataSource.getConnection();
		
		// filename select
		String sql = "select filename from album_board1 where seq = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
				
		rs = pstmt.executeQuery();
		String oldFilename = null;			
		if(rs.next()){
			oldFilename = rs.getString("filename");
		}
		pstmt.close();
		
		if(newFilename != null){ 
			sql = "update album_board1 set subject = ?, content = ?, mail = ?, filename = ?, filesize = ? where seq = ? and password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, mail);
			pstmt.setString(4, newFilename);
			pstmt.setLong(5, newFilesize);
			pstmt.setString(6, seq);
			pstmt.setString(7, password);
		} else {
			sql = "update album_board1 set subject = ?, content = ?, mail = ?  where seq = ? and password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, mail);
			pstmt.setString(4, seq);
			pstmt.setString(5, password);
		}
		
		int result = pstmt.executeUpdate();
		if(result == 0){
			// 비밀번호 오류
			flag = 1;
			// 글쓰기에 실패하면 upload된 파일을 지움
			newFile.delete();
		} else if(result == 1){
			// 정상
			flag = 0;
			if(newFilename != null && oldFilename != null){
				File file = new File(uploadPath +"/"+ oldFilename);
				file.delete();
			}
		}
	} catch(NamingException e){
		System.out.println("[에러] " + e.getMessage());
	} catch(SQLException e){
		System.out.println("[에러] " + e.getMessage());
	} finally {
		if(rs!=null) rs.close();
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