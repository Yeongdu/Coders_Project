package com.coders.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	
		// DB와 연동하는 객체.
		Connection con = null;
		
		// DB에 SQL문을 전송하는 객체
		PreparedStatement pstmt = null;
		
		// SQL문을 실행한 후에 결과 값을 가지고 있는 객체.
		ResultSet rs = null;
		
		// 쿼리문을 저장할 변수
		String sql = null;
		
		// UserDAO 객체를 싱글턴 방식으로 만들어 보자.
		// 1단계 : 싱글턴 방식으로 객체를 만들기 위해서는 우선적으로
		//        기본생성자의 접근제어자를 public이 아닌 private
		//        으로 바꾸어 주어야 한다.
		//        즉, 외부에서 직접적으로 기본생성자를 호출하지
		//        못하게 하는 방법이다.
		
		// 2단계 : UserDAO 객체를 정적(static) 멤버로 선언을 
		//        해 주어야 한다.
		private static UserDAO instance;
		
		private UserDAO() {  }  // 기본 생성자
		
		
		// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
		//        getInstance() 라는 메서드를 만들어서 해당
		//        getInstance() 라는 메서드를 외부에서 접근할 수
		//        있도록 해 주면 됨.
		public static UserDAO getInstance() {
			
			if(instance == null) {
				instance = new UserDAO();
			}
			
			return instance;
		}
		
		
		// DB를 연동하는 작업을 진행하는 메서드.
		public void openConn() {
			
			try {
				// 1단계 : JNDI 서버 객체 생성
				Context ctx = new InitialContext();
				
				// 2단계 : lookup() 메서드를 이용하여 매칭되는
				//        커넥션을 찾는다.
				DataSource ds =
					(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
				
				// 3단계 : DataSource 객체를 이용하여
				//        커넥션을 하나 가져온다.
				con = ds.getConnection();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}  // openConn() 메서드 end
		
		
		// DB에 연결된 자원 종료하는 메서드.
		public void closeConn(ResultSet rs,
				PreparedStatement pstmt, Connection con) {
			
			try {
				if(rs != null) rs.close();
				
				if(pstmt != null) pstmt.close();
				
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}  // closeConn() 메서드 end
		
		// 유저 로그인 정보를 조회하는 메서드
		public int UserSelect(String id) {
			
			int result = 0;
			
			try {
				openConn();
				
				sql = "select * from user_member where user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {	// DB에 정보가 존재할 때
					
					if(id.equals(rs.getString("user_id"))) {
						
					result = -1;		
					}
				}else if(!rs.next()) {	// DB에 정보가 존재하지 않을 때
					
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
		
		// 유저 로그인 정보를 DB에 저장하는 메서드
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
			
			
			
		}	// UserInsert() 메서드 end
		
		// 유저 아이디가 중복인지 아닌지 확인하는 메서드.
		public int checkUserId(String id) {
			
			int result = 0;
			
			try {
				openConn();
				
				sql = "select * from user_member where user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				System.out.println("rs 값 >>> " + rs);
				
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
			
			
			
		}	// checkUserId() 메서드 end
		
		// 유저 로그인 정보를 DB에 저장하는 메서드
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
					
		}	// UserInsert() 메서드 end
		
		// 유저 아이디를 검색해 비밀번호를 찾아주는 메서드
		public UserDTO userPwdSearch(String id, String name) {
			
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
}
