<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");
	
	int cpage = 1;	// cpage가 없으면 1
	if(request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")){	
		cpage = Integer.parseInt(request.getParameter("cpage"));
	}
	
	// 데이터갯수
	int recordPerPage = 5;
	
	int totalRecode = 0;
	
	// 전체페이지 갯수
	int totalPage = 1;
	
	// 한번에 보여질 페이지 수
	int blockPerPage = 5;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 
	
	StringBuffer sbHtml = new StringBuffer();
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		
		conn = dataSource.getConnection();
		
		String sql = "select seq, subject, writer, filename, filesize, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from album_board1 order by seq desc";	// 최근글을 가장 윗쪽에
		pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		rs = pstmt.executeQuery();
		
		rs.last();	
		totalRecode = rs.getRow();
		rs.beforeFirst(); 
		
		// 읽을 위치 지정
		int skip = (cpage-1) * recordPerPage;
		if(skip!=0) rs.absolute(skip);
				
		totalPage = ((totalRecode-1) / recordPerPage) + 1;
				
		// 5개 또는 마지막데이터 까지 
		rs.next();
		for(int i=0; i<recordPerPage; i++){
			String seq = rs.getString("seq");
			String subject = rs.getString("subject");
			String writer = rs.getString("writer");
			String filename = rs.getString("filename");
			long filesize = rs.getLong("filesize");
			String wdate = rs.getString("wdate");
			String hit = rs.getString("hit");
			int wgap = rs.getInt("wgap");
			
			sbHtml.append("<td width='20%' class='last2'>");
			sbHtml.append("  <div class='board'>");
			sbHtml.append("    <table class='boardT'>");
			sbHtml.append("      <tr>");
			sbHtml.append("        <td class='boardThumbWrap'>");
			sbHtml.append("          <div class='boardThumb'>");
			sbHtml.append("            <a href='board_view1.jsp?cpage="+ cpage +"&seq="+seq+"'><img src='../../upload/"+filename+"' border='0' width='100%' /></a>");
			sbHtml.append("          </div>");																		
			sbHtml.append("        </td>");
			sbHtml.append("      </tr>");
			sbHtml.append("      <tr>");
			sbHtml.append("        <td>");	
			sbHtml.append("		     <div class='boardItem'>");	
			sbHtml.append("			   <strong>"+subject+"</strong>");
			sbHtml.append("			   <img src='../../images/icon_new.gif' alt='NEW'>");
			sbHtml.append("		     </div>");
			sbHtml.append("	       </td>");
			sbHtml.append("      </tr>");
			sbHtml.append("      <tr>");
			sbHtml.append("	       <td><div class='boardItem'><span class='bold_blue'>"+ writer +"</span></div></td>");
			sbHtml.append("      </tr>");
			sbHtml.append("	     <tr>");
			sbHtml.append("		   <td><div class='boardItem'>"+ wdate +" <font>|</font> Hit "+ hit +"</div></td>");
			sbHtml.append("	     </tr>");
			sbHtml.append("	   </table>");
			sbHtml.append("  </div>");
			sbHtml.append("</td>");
				
			if(!rs.next()){
				for(; i<recordPerPage; i++){
					sbHtml.append("<td width='20%' class='last2'></td>");
				}
				break;
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
%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board_list.css">
<style type="text/css">
<!--
	.board_pagetab { text-align: center; }
	.board_pagetab a { text-decoration: none; font: 12px verdana; color: #000; padding: 0 3px 0 3px; }
	.board_pagetab a:hover { text-decoration: underline; background-color:#f2f2f2; }
	.on a { font-weight: bold; }
-->
</style>
</head>

<body>
<!-- 상단 디자인 -->
<div class="contents1"> 
	<div class="con_title"> 
		<p style="margin: 0px; text-align: right">
			<img style="vertical-align: middle" alt="" src="../../images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong>
		</p>
	</div> 
	<div class="contents_sub">	
		<div class="board_top">
			<div class="bold">
				<p>총 <span class="txt_orange"><%= totalRecode %></span>건</p>
			</div>
		</div>	
		
		<!--게시판-->
		<table class="board_list">
		<tr>
		<%= sbHtml %>
		</tr>
		</table>
		<!--//게시판-->	
		
		<div class="align_right">		
			<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp?cpage=<%= cpage %>'" />
		</div>
		
		<!--페이지넘버-->
		<div class="paginate_regular">
			<div class="board_pagetab">
			<%
				int startBlock = ((cpage-1) / blockPerPage) * blockPerPage + 1;
				int endBlock = ((cpage-1) / blockPerPage) * blockPerPage + blockPerPage;	
				if(endBlock >= totalPage){
					endBlock = totalPage;
				}
				
				if(startBlock == 1 ){
					out.println("<span class='off'><a>&lt;&lt;</a>&nbsp;&nbsp;</span>");
				} else {
					out.println("<span class='off'><a href='board_list1.jsp?cpage="+ (startBlock-blockPerPage) +"'>&lt;&lt;</a>&nbsp;&nbsp;</span>");
				}
				
				if(cpage == 1){
					out.println("<span class='off'><a>&lt;</a>&nbsp;&nbsp;</span>");
				} else {
					out.println("<span class='off'><a href='board_list1.jsp?cpage="+ (cpage-1) +"'>&lt;</a>&nbsp;&nbsp;</span>");
				}
				
				for(int i=startBlock; i<=endBlock; i++){
					if(i==cpage){
						// 현재 페이지
						out.println("<span class='on'><a>[ "+ i +" ]</a></span>");
					} else {
						out.println("<span class='off'><a href='board_list1.jsp?cpage="+ i +"'>[ "+ i +" ]</a></span>");
					}
				}
				
				if(cpage == totalPage){
					out.println("<span class='off'>&nbsp;&nbsp;<a>&gt;</a></span>");
				} else {
					out.println("<span class='off'>&nbsp;&nbsp;<a href='board_list1.jsp?cpage="+ (cpage+1) +"'>&gt;</a></span>");
				}
				
				if(endBlock == totalPage ){
					out.println("<span class='off'>&nbsp;&nbsp;<a>&gt;&gt;</a></span>");
				} else {
					out.println("<span class='off'>&nbsp;&nbsp;<a href='board_list1.jsp?cpage="+ (startBlock+blockPerPage) +"'>&gt;&gt;</a></span>");
				}
			%>

			</div>
		</div>
		<!--//페이지넘버-->	
  	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>
