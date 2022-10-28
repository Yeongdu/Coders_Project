package com.coders.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	
		// DB�� �����ϴ� ��ü.
		Connection con = null;
		
		// DB�� SQL���� �����ϴ� ��ü
		PreparedStatement pstmt = null;
		
		// SQL���� ������ �Ŀ� ��� ���� ������ �ִ� ��ü.
		ResultSet rs = null;
		
		// �������� ������ ����
		String sql = null;
		
		// UserDAO ��ü�� �̱��� ������� ����� ����.
		// 1�ܰ� : �̱��� ������� ��ü�� ����� ���ؼ��� �켱������
		//        �⺻�������� ���������ڸ� public�� �ƴ� private
		//        ���� �ٲپ� �־�� �Ѵ�.
		//        ��, �ܺο��� ���������� �⺻�����ڸ� ȣ������
		//        ���ϰ� �ϴ� ����̴�.
		
		// 2�ܰ� : UserDAO ��ü�� ����(static) ����� ������ 
		//        �� �־�� �Ѵ�.
		private static UserDAO instance;
		
		private UserDAO() {  }  // �⺻ ������
		
		
		// 3�ܰ� : �⺻ ������ ��ſ� �̱��� ��ü�� return �� �ִ�
		//        getInstance() ��� �޼��带 ���� �ش�
		//        getInstance() ��� �޼��带 �ܺο��� ������ ��
		//        �ֵ��� �� �ָ� ��.
		public static UserDAO getInstance() {
			
			if(instance == null) {
				instance = new UserDAO();
			}
			
			return instance;
		}
		
		
		// DB�� �����ϴ� �۾��� �����ϴ� �޼���.
		public void openConn() {
			
			try {
				// 1�ܰ� : JNDI ���� ��ü ����
				Context ctx = new InitialContext();
				
				// 2�ܰ� : lookup() �޼��带 �̿��Ͽ� ��Ī�Ǵ�
				//        Ŀ�ؼ��� ã�´�.
				DataSource ds =
					(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
				
				// 3�ܰ� : DataSource ��ü�� �̿��Ͽ�
				//        Ŀ�ؼ��� �ϳ� �����´�.
				con = ds.getConnection();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}  // openConn() �޼��� end
		
		
		// DB�� ����� �ڿ� �����ϴ� �޼���.
		public void closeConn(ResultSet rs,
				PreparedStatement pstmt, Connection con) {
			
			try {
				if(rs != null) rs.close();
				
				if(pstmt != null) pstmt.close();
				
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}  // closeConn() �޼��� end
		
		// ���� �α��� ������ ��ȸ�ϴ� �޼���
		public int UserSelect(String id) {
			
			int result = 0;
			
			try {
				openConn();
				
				sql = "select * from user_member where user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {	// DB�� ������ ������ ��
					
					if(id.equals(rs.getString("user_id"))) {
						
					result = -1;		
					}
				}else if(!rs.next()) {	// DB�� ������ �������� ���� ��
					
					result = 1;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			return result;
			
		}
		
		// ���� �α��� ������ DB�� �����ϴ� �޼���
		public void snsUserInsert(String id, String name) {
			
			try {
				openConn();
				
				sql = "insert into user_member values(?, ?, sysdate, '', '', '')";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				pstmt.setString(2, name);
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			
			
			
		}	// UserInsert() �޼��� end
		
		// ���� ���̵� �ߺ����� �ƴ��� Ȯ���ϴ� �޼���.
		public int checkUserId(String id) {
			
			int result = 0;
			
			try {
				openConn();
				
				sql = "select * from user_member where user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				System.out.println("rs �� >>> " + rs);
				
				if(rs.next()) {
					
					result = -1;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				
				closeConn(rs, pstmt, con);
				
			}
			
			return result;
			
			
			
		}	// checkUserId() �޼��� end
		
		// ���� �α��� ������ DB�� �����ϴ� �޼���
		public int userInsert(UserDTO dto) {
					
			int result = 0;	
				
			try {
				openConn();
					
				sql = "insert into user_member values(?, ?, sysdate, '', '', ?)";
						
				pstmt = con.prepareStatement(sql);
						
				pstmt.setString(1, dto.getUser_id());
						
				pstmt.setString(2, dto.getUser_name());
					
				pstmt.setString(3, dto.getUser_pwd());
						
				result = pstmt.executeUpdate();
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
				
			return result;
					
		}	// UserInsert() �޼��� end
		
		// ���� ���̵� �˻��� ��й�ȣ�� ã���ִ� �޼���
		public UserDTO userContentSearch(String id) {
			
			UserDTO dto = null;
			
			try {
				openConn();
				
				sql = "select * from user_member where user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);

				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto = new UserDTO();
					
					dto.setUser_id(rs.getString("user_id"));
					
					dto.setUser_name(rs.getString("user_name"));
					
					dto.setUser_date(rs.getString("user_date"));
					
					dto.setUser_profile(rs.getString("user_profile"));
					
					dto.setUser_homepage(rs.getString("user_homepage"));
					
					dto.setUser_pwd(rs.getString("user_pwd"));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				
				closeConn(rs, pstmt, con);
			}
			
			return dto;
			
				
			}
		
		// 유저가 작성한 QnA 게시판 리스트를 가져오는 메서드
		public String getUserQnaList(String id) {
			
			String result = "";
			
			int count = 0;
			
			try {
				openConn();
				
				/*
				 * sql = "select count(qna_writer) from qna where qna_writer = ?";
				 * 
				 * pstmt = con.prepareStatement(sql);
				 * 
				 * pstmt.setString(1, id);
				 * 
				 * rs = pstmt.executeQuery();
				 * 
				 * if(rs.next()) { count = rs.getInt(1); }
				 */
					
				sql = "select * from qna where qna_writer = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				result += "<mains>";
				while(rs.next()) {
					result += "<main>";
					result += "<num>" + rs.getInt("qna_num") + "</num>";
					result += "<tag>" + rs.getString("qna_tag") + "</tag>";
					result += "<hit>" + rs.getString("qna_hit") + "</hit>";
					result += "<reply>" + rs.getString("qna_reply") + "</reply>";
					result += "<title>" + rs.getString("qna_title") + "</title>";
					result += "<writer>" + rs.getString("qna_writer") + "</writer>";
					result += "<date>" + rs.getString("qna_date") + "</date>";
					result += "<count>" + count + "</count>";
					result += "</main>";
				}
				
				result += "</mains>";
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
			
}
