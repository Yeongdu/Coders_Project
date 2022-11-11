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
				
				sql = "insert into user_member values(?, ?, sysdate, '', '', '', '')";
				
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
					
				sql = "insert into user_member values(?, ?, sysdate, '', '', ?, '')";
						
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
		
		// 유저 ID에 해당하는 상세정보를 확인하는 메서드
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
					
					dto.setUser_file(rs.getString("user_file"));
					
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
		public String getUserQnaBoardList(String id) {
			
			String result = "";
			
			
			try {
				int count = userQnaBoardCount(id);
				
				openConn();
			
				sql = "select * from qna where qna_writer = ? order by qna_date desc";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				result += "<mains>";
				
				while(rs.next()) {
					result += "<main>";
					result += "<num>" + rs.getInt("qna_num") + "</num>";
					result += "<tag>" + rs.getString("qna_tag") + "</tag>";
					result += "<hit>" + rs.getString("qna_hit") + "</hit>";
					result += "<title>" + rs.getString("qna_title") + "</title>";
					result += "<writer>" + rs.getString("qna_writer") + "</writer>";
					result += "<reply>" + rs.getInt("qna_reply") + "</reply>";
					result += "<date>" + rs.getString("qna_date") + "</date>";
					result += "<update>" + rs.getString("qna_update") + "</update>";
					result += "</main>";
				}
				
				result += "<maincount>";
				result += "<count>" + count + "</count>";
				result += "</maincount>";
				result += "</mains>";
				
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		
		// // 유저가 작성한 QnA 댓글 리스트를 가져오는 메서드
		public String getUserQnaCommentList(String id) {
			
			String result = "";
			
			try {
				int count = userQnaCommentCount(id);
				
				openConn();
			
				sql = "select * from qna where qna_num in (select qna_num from qna_comment where qcomment_writer = ?) order by qna_date desc";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				result += "<mains>";
				
				while(rs.next()) {
					result += "<main>";
					result += "<num>" + rs.getInt("qna_num") + "</num>";
					result += "<tag>" + rs.getString("qna_tag") + "</tag>";
					result += "<hit>" + rs.getString("qna_hit") + "</hit>";
					result += "<title>" + rs.getString("qna_title") + "</title>";
					result += "<writer>" + rs.getString("qna_writer") + "</writer>";
					result += "<reply>" + rs.getInt("qna_reply") + "</reply>";
					result += "<date>" + rs.getString("qna_date") + "</date>";
					result += "<update>" + rs.getString("qna_update") + "</update>";
					result += "</main>";
				}
				
				result += "<maincount>";
				result += "<count>" + count + "</count>";
				result += "</maincount>";
				result += "</mains>";
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			return result;
			
		}
		
		// 유저가 작성한 QnA 게시글 개수를 조회하는 메서드
		public int userQnaBoardCount(String id) {
					
			int result = 0;
					
			try {
				openConn();
						
				sql = "select count(qna_writer) from qna where qna_writer = ?";
						
				pstmt = con.prepareStatement(sql);
						
				pstmt.setString(1, id);

				rs = pstmt.executeQuery();
						
				if(rs.next()) {
							
					result = rs.getInt(1);		
				}else {
					
					result = 0;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
						
				closeConn(rs, pstmt, con);
			}
					
			return result;
					
						
			}
		
		// 유저가 작성한 QnA 댓글 개수를 조회하는 메서드
		public int userQnaCommentCount(String id) {
							
			int result = 0;
							
			try {
				openConn();
								
				sql = "select count(qcomment_writer) from qna_comment where qcomment_writer = ?";
								
				pstmt = con.prepareStatement(sql);
								
				pstmt.setString(1, id);

				rs = pstmt.executeQuery();
								
				if(rs.next()) {
									
					result = rs.getInt(1);		
				}else {
					
					result = 0;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
								
				closeConn(rs, pstmt, con);
			}
							
			return result;
							
								
			}
		
		// 유저가 작성한 Study 게시글 개수를 조회하는 메서드
		public int userStudyBoardCount(String id) {
					
			int result = 0;
					
			try {
				openConn();
						
				sql = "select count(study_writer) from study_group where study_writer = ?";
						
				pstmt = con.prepareStatement(sql);
						
				pstmt.setString(1, id);

				rs = pstmt.executeQuery();
						
				if(rs.next()) {
							
					result = rs.getInt(1);
					
				}else {
					
					result = 0;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
						
				closeConn(rs, pstmt, con);
			}
					
			return result;
					
						
			}	// userStudyBoardCount 메서드 end
		
		// 유저가 작성한 Study 댓글 개수를 조회하는 메서드
		public int userStudyCommentCount(String id) {
							
			int result = 0;
							
			try {
				openConn();
								
				sql = "select count(scomment_writer) from study_comment where scomment_writer = ?";
								
				pstmt = con.prepareStatement(sql);
								
				pstmt.setString(1, id);

				rs = pstmt.executeQuery();
								
				if(rs.next()) {
									
					result = rs.getInt(1);		
				}else {
					
					result = 0;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
								
				closeConn(rs, pstmt, con);
			}
							
			return result;
							
								
		}	// userStudyCommentCount 메서드 end

		// 유저가 작성한 Study 게시판 리스트를 가져오는 메서드		
		public String getUserStudyBoardList(String id) {
			
			String result = "";
			
			try {
				
				int count = userStudyBoardCount(id);
				
				openConn();
			
				sql = "select study_group.*, (select count(*) from study_comment where study_group.study_num = study_comment.study_num) "
						+ "as commentCnt from study_group where study_writer = ? order by study_date desc";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				result += "<mains>";
				
				while(rs.next()) {
					result += "<main>";
					result += "<people>" + rs.getInt("study_people") + "</people>";
					result += "<num>" + rs.getInt("study_num") + "</num>";
					result += "<hit>" + rs.getString("study_hit") + "</hit>";
					result += "<title>" + rs.getString("study_title") + "</title>";
					result += "<writer>" + rs.getString("study_writer") + "</writer>";
					result += "<reply>" + rs.getInt("commentCnt") + "</reply>";
					result += "<date>" + rs.getString("study_end") + "</date>";
					result += "<type>" + rs.getString("study_status") + "</date>";
					result += "</main>";
				}
				result += "<maincount>";
				result += "<count>" + count + "</count>";
				result += "</maincount>";
				result += "</mains>";
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}	// getUserStudyBoardList 메서드 end
		
		// 유저가 작성한 Study 댓글 리스트를 가져오는 메서드		
		public String getUserStudyCommentList(String id) {
			
			String result = "";
			
			
			try {
				int count = userStudyCommentCount(id);
				
				openConn();
			
				sql = "select study_group.*, (select count(*) from study_comment where study_group.study_num = study_comment.study_num) "
						+ "as commentCnt from study_group where study_num in(select study_num from study_comment where scomment_writer = ?)";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				result += "<mains>";
				
				while(rs.next()) {
					result += "<main>";
					result += "<people>" + rs.getInt("study_people") + "</people>";
					result += "<num>" + rs.getInt("study_num") + "</num>";
					result += "<hit>" + rs.getString("study_hit") + "</hit>";
					result += "<title>" + rs.getString("study_title") + "</title>";
					result += "<writer>" + rs.getString("study_writer") + "</writer>";
					result += "<reply>" + rs.getInt("commentCnt") + "</reply>";
					result += "<date>" + rs.getString("study_end") + "</date>";
					result += "<type>" + rs.getString("study_status") + "</date>";
					result += "</main>";
				}
				
				result += "<maincount>";
				result += "<count>" + count + "</count>";
				result += "</maincount>";
				result += "</mains>";
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}	// getUserStudyCommentList 메서드 end		
		
		// 유저 ID에 해당하는 name의 정보를 변경하는 메서드.
		public int userNameModify(String id, String name) {
			int result = 0;
			
			try {
				openConn();
				
				sql = "update user_member set user_name = ? where user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, name);
				
				pstmt.setString(2, id);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				
				closeConn(rs, pstmt, con);
				
			}
			
			return result;
			
		}	// userNameModify 메서드 end
		
		// 유저 ID에 해당하는 profile의 정보를 변경하는 메서드.
		public int userProfileModify(String id, String profile) {
			int result = 0;
			
			try {
				openConn();
				
				sql = "update user_member set user_profile = ? where user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, profile);
				
				pstmt.setString(2, id);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				
				closeConn(rs, pstmt, con);
				
			}
			
			return result;
			
		}	// userNameModify 메서드 end
		
		// 유저 ID에 해당하는 homepage의 정보를 변경하는 메서드.
		public int userHomepageModify(String id, String homepage) {
			int result = 0;
			
			try {
				openConn();
				
				sql = "update user_member set user_homepage = ? where user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, homepage);
				
				pstmt.setString(2, id);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				
				closeConn(rs, pstmt, con);
				
			}
			
			return result;
			
		}	// userNameModify 메서드 end
		
		// 유저 ID에 해당하는 file의 정보를 변경하는 메서드.
		public int userFileUpload(String id, String file) {
			int result = 0;
			
			try {
				openConn();
				
				sql = "update user_member set user_file = ? where user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, file);
				
				pstmt.setString(2, id);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				
				closeConn(rs, pstmt, con);
				
			}
			
			return result;
			
		}	// userNameModify 메서드 end
			
}
