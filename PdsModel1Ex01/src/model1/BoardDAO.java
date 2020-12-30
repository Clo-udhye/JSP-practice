package model1;

import java.io.File;
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
	private DataSource dataSource = null;

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

	// write
	public void boardWrite() {}

	// write_ok
	public int boardWriteOk(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		
		try{
			conn = dataSource.getConnection();
			
			String sql = "insert into pds_board1 values (0, ?, ?, ?, ?, ?, ?, ?, 0, ?, now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSubject());
			pstmt.setString(2, to.getWriter());
			pstmt.setString(3, to.getMail());
			pstmt.setString(4, to.getPassword());
			pstmt.setString(5, to.getContent());
			pstmt.setString(6, to.getFilename());
			pstmt.setLong(7, to.getFilesize());
			pstmt.setString(8, to.getWip());
			
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

	// list
	public ArrayList<BoardTO> boardList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		ArrayList<BoardTO> lists = new ArrayList<BoardTO>();

		try{
			conn = dataSource.getConnection();
			
			String sql = "select seq, subject, writer, filesize, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from pds_board1 order by seq desc";	// 최근글을 가장 윗쪽에
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardTO to = new BoardTO();
				
				to.setSeq(rs.getString("seq"));
				to.setSubject(rs.getString("subject"));
				to.setWriter(rs.getString("writer"));
				to.setWdate(rs.getString("wdate"));
				to.setFilesize(rs.getLong("filesize"));
				to.setHit(rs.getString("hit"));
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

	// view
	public BoardTO boardView(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = dataSource.getConnection();
			
			String sql = "update pds_board1 set hit=hit+1 where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			pstmt.executeUpdate();
			
			pstmt.close();
			
			sql = "select subject, writer, mail, wip, date_format(wdate, '%Y-%m-%d %H:%i:%m') wdate, hit, content, filename, filesize from pds_board1 where seq = ?";
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
				to.setFilename(rs.getString("filename"));
				to.setFilesize(rs.getLong("filesize"));
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

	// modify
		public BoardTO boardModify(BoardTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				conn = dataSource.getConnection();
				
				String sql = "select subject, writer, content, mail, filename from pds_board1 where seq = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,to.getSeq());
				
				rs = pstmt.executeQuery();
				if(rs.next()){
					to.setSubject(rs.getString("subject"));
					to.setWriter(rs.getString("writer"));
					to.setContent(rs.getString("content"));
					to.setMail(rs.getString("mail"));
					to.setFilename(rs.getString("filename")==null? "" : rs.getString("filename"));		
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

		// modify_ok
		public int boardModifyOk(BoardTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;	

			int flag = 2;
			
			try{
				conn = dataSource.getConnection();
				
				// filename select
				String sql = "select filename from pds_board1 where seq = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, to.getSeq());
						
				rs = pstmt.executeQuery();
				String oldFilename = null;			
				if(rs.next()){
					oldFilename = rs.getString("filename");
				}
				
				pstmt.close();
				
				if(to.getFilename() != null){ 
					sql = "update pds_board1 set subject = ?, content = ?, mail = ?, filename = ?, filesize = ? where seq = ? and password = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, to.getSubject());
					pstmt.setString(2, to.getContent());
					pstmt.setString(3, to.getMail());
					pstmt.setString(4, to.getFilename());
					pstmt.setLong(5, to.getFilesize());
					pstmt.setString(6, to.getSeq());
					pstmt.setString(7, to.getPassword());
				} else {
					sql = "update pds_board1 set subject = ?, content = ?, mail = ?  where seq = ? and password = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, to.getSubject());
					pstmt.setString(2, to.getContent());
					pstmt.setString(3, to.getMail());
					pstmt.setString(4, to.getSeq());
					pstmt.setString(5, to.getPassword());
				}
				
				int result = pstmt.executeUpdate();
				if(result == 0){
					// 비밀번호 오류
					flag = 1;
				} else if(result == 1){
					// 정상
					flag = 0;
					if(to.getFilename() != null && oldFilename != null){
						File file = new File("C:/Java/jsp-workspace/PdsModel1Ex01/WebContent/upload", oldFilename);
						file.delete();
					}
				}
			} catch(SQLException e){
				System.out.println("[에러] " + e.getMessage());
			} finally {
				if(rs!=null) try{rs.close();} catch(SQLException e) {}
				if(pstmt!=null) try{pstmt.close();} catch(SQLException e) {}
				if(conn!=null) try{conn.close();} catch(SQLException e) {}
			}
			
			return flag;
		}
	
	// delete
	public BoardTO boardDelete(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = dataSource.getConnection();
			
			String sql = "select subject, writer from pds_board1 where seq = ?";
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

	// delete_ok
	public int boardDeleteOk(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 2;
		
		try{
			conn = dataSource.getConnection();
			
			// filename select
			String sql = "select filename from pds_board1 where seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq());
			
			rs = pstmt.executeQuery();
			String filename = null;
			if(rs.next()){
				filename = rs.getString("filename");
			}
			
			pstmt.close();
			
			sql = "delete from pds_board1 where seq = ? and password = ?";
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
				if(filename != null){
					File file = new File("C:/Java/jsp-workspace/PdsModel1Ex01/WebContent/upload", filename);
					file.delete();
				}
			}
		} catch(SQLException e){
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if(rs!=null) try{rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try{conn.close();} catch(SQLException e) {}
		}
		
		return flag;
	}
}
