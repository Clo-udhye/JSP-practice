<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");

	String strDong = request.getParameter("dong");
%>
<%	StringBuffer html = new StringBuffer();

	if(strDong!=null){
		String url = "jdbc:mysql://localhost:3306/sample";		
		String user = "root";
		String password = "!123456";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		
		try{ 
			Class.forName("org.mariadb.jdbc.Driver");
			
			conn = DriverManager.getConnection(url, user, password);
			
			String sql = "select zipcode, sido, gugun, dong, ri, bunji, seq from zipcode where dong like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strDong + "%");
			
			rs = pstmt.executeQuery();
			
			html.append("<table border='1' width='600'>");
			html.append("<tr>");
			html.append("<td>우편번호</td><td>시도</td><td>구군</td><td>동</td><td>리</td><td>번지</td><td>seq</td>");
			html.append("</tr>");
				
			while(rs.next()){
				html.append("<tr>");
				html.append("<td>" + rs.getString("zipcode") + "</td>");
				html.append("<td>" + rs.getString("sido") + "</td>");
				html.append("<td>" + rs.getString("gugun") + "</td>");
				html.append("<td>" + rs.getString("dong") + "</td>");
				html.append("<td>" + rs.getString("ri") + "</td>");
				html.append("<td>" + rs.getString("bunji") + "</td>");
				html.append("<td>" + rs.getString("seq") + "</td>");
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
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	const checkfrm = function(){
		if(document.frm.dong.value.trim()==''){
			alert('동이름을 입력해주세요.');
			return;	// 함수의 종료
		}
		document.frm.submit();
	};
</script>
</head>
<body>

<form action="SearchZipcode01.jsp" method="post" name="frm">
	동이름 <input type="text" name="dong" size="20" />
	<input type="button" value="검색" onclick="checkfrm()" />
</form>

<br /><hr /><br />

<%= html %>

</body>
</html>