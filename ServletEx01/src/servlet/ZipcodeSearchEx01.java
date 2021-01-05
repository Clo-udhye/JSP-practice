package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class ZipcodeSearchEx01 extends HttpServlet {
	
	private DataSource dataSource = null;

	public ZipcodeSearchEx01() {
		// TODO Auto-generated constructor stub
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource)envCtx.lookup("jdbc/mariadb1");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 입력
			req.setCharacterEncoding("utf-8");
			String dong = req.getParameter("dong")==null? "" : req.getParameter("dong");
			
			// 출력
			resp.setContentType("text/html;charset=utf-8");
			StringBuffer html = new StringBuffer();
			
			html.append("<!DOCTYPE HTML>");
			html.append("<html>");
			html.append("<head>");
			html.append("<meta charset='utf-8' />");
			html.append("</head>");
			html.append("<body>");
			html.append("<form action='' method='post'>");
			html.append("동이름<input type='text' name='dong' />");
			html.append("<input type='submit' value='우편번호 검색' />");
			html.append("</body>");
			
			html.append("<br /><hr /><br />");
			
			// 데이터베이스 연결 후 우편번호 검색...	
			if(!dong.equals("")) {
				conn = dataSource.getConnection();
				String sql = "select zipcode, sido, gugun, dong, ri, bunji from zipcode where dong like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dong + "%");
				
				rs = pstmt.executeQuery();
				
				html.append("<table border='1' width='800'>");
				html.append("<tr>");
				html.append("<td>우편번호</td><td>시도</td><td>구군</td><td>동</td><td>리</td><td>번지</td>");
				html.append("</tr>");
				while(rs.next()) {
					html.append("<tr>");
					html.append("<td>" + rs.getString("zipcode") + "</td>");
					html.append("<td>" + rs.getString("sido") + "</td>");
					html.append("<td>" + rs.getString("gugun") + "</td>");
					html.append("<td>" + rs.getString("dong") + "</td>");
					html.append("<td>" + rs.getString("ri") + "</td>");
					html.append("<td>" + rs.getString("bunji") + "</td>");			
					html.append("</tr>");
				}
				html.append("</table>");
			}		
			
			PrintWriter out = resp.getWriter();
			out.println(html);
			out.close();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(rs!=null) try {rs.close();} catch(SQLException e1) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e1) {}
			if(conn!=null) try {conn.close();} catch(SQLException e1) {}
		}
	}
}
