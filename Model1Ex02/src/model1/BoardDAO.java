package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	DataSource dataSource = null;
	public BoardDAO() {
		// TODO Auto-generated constructor stub
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		}
	}
	
	public void boardWrite() {}
	public int boardWriteOk(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		
		try{
			conn = dataSource.getConnection();
			
			String sql = "insert into emot_board1 values (0, ?, ?, ?, ?, ?, ?, 0, ?, now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSubject());
			pstmt.setString(2, to.getWriter());
			pstmt.setString(3, to.getMail());
			pstmt.setString(4, to.getPassword());
			pstmt.setString(5, to.getEmot());
			pstmt.setString(6, to.getContent());
			pstmt.setString(7, to.getWip());
			
			int result = pstmt.executeUpdate();
			if(result == 1){
				flag = 0;
			}
		} catch(SQLException e){
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try{conn.close();} catch(SQLException e) {}
		}
	
		return flag;
	}
	
	public ArrayList<BoardTO> boardList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		ArrayList<BoardTO> lists = new ArrayList<BoardTO>();

		try{
			conn = dataSource.getConnection();
			
			String sql = "select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, emot, timestampdiff(hour, wdate, now()) wgap from emot_board1 order by seq desc";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				BoardTO to = new BoardTO(); 
				
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setWdate(rs.getString("wdate"));
				to.setHit(rs.getString("hit"));
				to.setEmot(rs.getString("emot"));
				to.setWgap(rs.getInt("wgap"));
				
				lists.add(to);
			}
		} catch(SQLException e){
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if(rs!=null) try{rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try{conn.close();} catch(SQLException e) {}
		}
		return lists;
	}
	
	public BoardTO boardView(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = dataSource.getConnection();
			
			String sql = "update emot_board1 set hit=hit+1 where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			pstmt.executeUpdate();
			
			sql = "select subject, writer, mail, wip, date_format(wdate, '%Y-%m-%d %H:%i:%m') wdate, hit, content, emot from emot_board1 where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,to.getSeq());
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setMail(rs.getString("mail"));
				to.setWip(rs.getString("wip"));
				to.setWdate(rs.getString("wdate"));
				to.setHit(rs.getString("hit"));
				to.setContent(rs.getString("content").replaceAll("\n", "<br />"));
				to.setEmot(rs.getString("emot"));	
			}
		} catch(SQLException e){
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if(rs!=null) try{rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try{conn.close();} catch(SQLException e) {}
		}
		
		return to;
	}
	
	public BoardTO boardDelete(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = dataSource.getConnection();
			
			String sql = "select subject, writer from board1 where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,to.getSeq());
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
			}
			
		} catch(SQLException e){
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if(rs!=null) try{rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try{conn.close();} catch(SQLException e) {}
		}
		return to;
	}
	
	public int boardDeleteOk(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
		
		try{
			conn = dataSource.getConnection();
			
			String sql = "delete from emot_board1 where seq = ? and password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			pstmt.setString(2, to.getPassword());
			
			
			int result = pstmt.executeUpdate();
			if(result == 0){
				// 비밀번호 오류
				flag = 1;
			} else if(result == 1){
				// 정상
				flag = 0;
			}
		} catch(SQLException e){
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try{conn.close();} catch(SQLException e) {}
		}

		return flag;
	}
	
	public BoardTO boardModify(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = dataSource.getConnection();
			
			String sql = "select subject, writer, content, emot, mail from emot_board1 where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,to.getSeq());
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setContent(rs.getString("content"));
				to.setEmot(rs.getString("emot"));
				to.setMail(rs.getString("mail"));
			}
			
		} catch(SQLException e){
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if(rs!=null) try{rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try{conn.close();} catch(SQLException e) {}
		}
		
		return to;
	}
	
	public int boardModifyOk(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
	
		try{
			conn = dataSource.getConnection();
			
			String sql = "update emot_board1 set subject = ?, content = ?, mail = ?, emot = ?  where seq = ? and password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSubject());
			pstmt.setString(2, to.getContent());
			pstmt.setString(3, to.getMail());
			pstmt.setString(4, to.getEmot());
			pstmt.setString(5, to.getSeq());
			pstmt.setString(6, to.getPassword());			
			
			int result = pstmt.executeUpdate();
			if(result == 0){
				// 비밀번호 오류
				flag = 1;
			} else if(result == 1){
				// 정상
				flag = 0;
			}
		} catch(SQLException e){
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try{conn.close();} catch(SQLException e) {}
		}
		
		return flag;
	}
}
