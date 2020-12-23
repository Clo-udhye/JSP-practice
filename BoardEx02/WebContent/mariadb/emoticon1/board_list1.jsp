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
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 
	
	StringBuffer sbHtml = new StringBuffer();
	int totalRecode = 0;
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		
		conn = dataSource.getConnection();
		
		String sql = "select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, emot from emot_board1 order by seq desc";	// 최근글을 가장 윗쪽에
		pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		rs = pstmt.executeQuery();
		
		rs.last();	//읽을 위치를 맨 아래로
		totalRecode = rs.getRow(); // 현재 행번호 
		
		rs.beforeFirst(); // 읽을 위치 원위치
		while(rs.next()){
			String seq = rs.getString("seq");
			String subject = rs.getString("subject");
			String writer = rs.getString("writer");
			String wdate = rs.getString("wdate");
			String hit = rs.getString("hit");
			String emot = rs.getString("emot");
			
			sbHtml.append("<tr>");		
			sbHtml.append("		<td><img src='../../images/emoticon/emot"+ emot +".png' width='15'/></td>");
			sbHtml.append("		<td>"+ seq +"</td>");
			sbHtml.append("		<td class='left'><a href='board_view1.jsp?seq="+ seq +"'>"+ subject +"</a>&nbsp;<img src='../../images/icon_hot.gif' alt='HOT'></td>");
			sbHtml.append("		<td>"+ writer +"</td>");
			sbHtml.append("		<td>"+ wdate +"</td>");
			sbHtml.append("		<td>"+ hit +"</td>");
			sbHtml.append("		<td>&nbsp;</td>");
			sbHtml.append("</tr>");
		}
		
	} catch(NamingException e){
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
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
	<h3>게시판</h3>
	<p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
	<div class="contents_sub">
		<div class="board_top">
			<div class="bold">총 <span class="txt_orange"><%= totalRecode %></span>건</div>
		</div>

		<!--게시판-->
		<div class="board">
			<table>
			<tr>
				<th width="3%">&nbsp;</th>
				<th width="5%">번호</th>
				<th>제목</th>
				<th width="10%">글쓴이</th>
				<th width="17%">등록일</th>
				<th width="5%">조회</th>
				<th width="3%">&nbsp;</th>
			</tr>
			<!-- 행 시작 -->
			<%= sbHtml %>
			<!--
			<tr>
				<td><img src="../../images/emoticon/emot01.png" width="15"/></td>
				<td>1</td>
				<td class="left"><a href="board_view1.jsp">adfas</a>&nbsp;<img src="../../images/icon_hot.gif" alt="HOT"></td>
				<td>asdfa</td>
				<td>2017-01-31</td>
				<td>6</td>
				<td>&nbsp;</td>
			</tr>
			-->
			<!-- 행 끝 -->			
			</table>
		</div>	
		<div class="align_right">
			<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
		</div>
		<!--//게시판-->
	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>
