package com.coders.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class QNACommentDAO {
	
	 Connection con = null;
	 PreparedStatement pstmt = null;
	 ResultSet rs = null;
	 String sql = null;

	
	private static QNACommentDAO instance;
	
	private QNACommentDAO() {}
		 	
		
	public static QNACommentDAO getInstance() {
		
		if(instance == null) { 
			instance = new QNACommentDAO();
		}
		return instance;
	}
	
	
	public void openConn() {
		
		try {
			Context ctx = new InitialContext();
			
			//2. lookup()메소드를 이용해 매칭되는 커넥션 찾기
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			//3. datasource를 이용하여 커넥션을 하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}//openconn end
	

	
	//db연결 자원 종료 메소드
	 public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		 
		 try {
			 if(rs != null) { rs.close();}
			 if (pstmt != null) {pstmt.close();}
			 if (con != null) {con.close(); }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 
	 } //close conn end
	

	 
	public QNACommentDTO getQnaComment(int no){
		
		QNACommentDTO dto = null;
		
		try {
			
			openConn();
			
			sql = "select * from qna_comment where qna_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new QNACommentDTO();
				
				dto.setQcomment_num(rs.getInt("qcomment_num"));
				dto.setQna_num(rs.getInt("qna_num"));
				dto.setQcomment_writer(rs.getString("qcomment_writer"));
				dto.setQcomment_cont(rs.getString("qcomment_cont"));
				dto.setQcomment_date(rs.getString("qcomment_date"));
				dto.setQcomment_update(rs.getString("qcomment_update"));
				dto.setQcomment_good(rs.getInt("qcomment_good"));
				dto.setQcommnet_file(rs.getString("qcomment_file"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		 return dto;
	 }

}
