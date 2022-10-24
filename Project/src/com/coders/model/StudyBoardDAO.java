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

public class StudyBoardDAO {
	// DB와 연동하는 객체.
	Connection con = null;

	// DB에 SQL문을 전송하는 객체
	PreparedStatement pstmt = null;

	// SQL문을 실행한 후에 결과 값을 가지고 있는 객체.
	ResultSet rs = null;

	// 쿼리문을 저장할 변수
	String sql = null;

	// StudyBoardDAO 객체를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글턴 방식으로 객체를 만들기 위해서는 우선적으로
	// 기본생성자의 접근제어자를 public이 아닌 private
	// 으로 바꾸어 주어야 한다.
	// 즉, 외부에서 직접적으로 기본생성자를 호출하지
	// 못하게 하는 방법이다.

	// 2단계 : StudyBoardDAO 객체를 정적(static) 멤버로 선언을
	// 해 주어야 한다.
	private static StudyBoardDAO instance;

	private StudyBoardDAO() {
	} // 기본 생성자

	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
	// getInstance() 라는 메서드를 만들어서 해당
	// getInstance() 라는 메서드를 외부에서 접근할 수
	// 있도록 해 주면 됨.
	public static StudyBoardDAO getInstance() {

		if (instance == null) {
			instance = new StudyBoardDAO();
		}

		return instance;
	}

	public void openConn() {

		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();

			// 2단계 : lookup() 메서드를 이용하여 매칭되는
			// 커넥션을 찾는다.
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

			// 3단계 : DataSource 객체를 이용하여
			// 커넥션을 하나 가져온다.
			con = ds.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} // openConn() 메서드 end

	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try {
			if (rs != null)
				rs.close();

			if (pstmt != null)
				pstmt.close();

			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	} // closeConn() 메서드 end

	// 스터디 게시판의 전체 글을 조회하는 메서드
	public List<StudyBoardDTO> getStudyBoardList() {
		List<StudyBoardDTO> list = new ArrayList<StudyBoardDTO>();
		try {
			openConn();
			sql = "select * from study_group order by study_num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StudyBoardDTO dto = new StudyBoardDTO();
				dto.setStudy_num(rs.getInt("study_num"));
				dto.setStudy_writer(rs.getString("study_writer"));
				dto.setStudy_title(rs.getString("study_title"));
				dto.setStudy_cont(rs.getString("study_cont"));
				dto.setStudy_date(rs.getString("study_date"));
				dto.setStudy_update(rs.getString("study_update"));
				dto.setStudy_people(rs.getInt("study_people"));
				dto.setStudy_status(rs.getString("study_status"));
				dto.setStudy_start(rs.getString("study_start"));
				dto.setStudy_end(rs.getString("study_end"));
				dto.setStudy_file(rs.getString("study_file"));
				dto.setStudy_hit(rs.getInt("study_hit"));

				list.add(dto);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	//Study 게시판 글쓰기 메서드
	public int insertStudy(StudyBoardDTO dto) {

		int result = 0, count = 0;
		try {
			openConn();
			sql = "select max(study_num) from study_group";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}
			sql = "insert into study_group values(?,?,?,?,sysdate,'',?,'모집중',?,?,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getStudy_writer());
			pstmt.setString(3, dto.getStudy_title());
			pstmt.setString(4, dto.getStudy_cont());
			pstmt.setInt(5, dto.getStudy_people());
			pstmt.setString(6, dto.getStudy_start());
			pstmt.setString(7, dto.getStudy_end());
			pstmt.setString(8, dto.getStudy_file());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	
	
	// 게시글의 조회수를 증가시키는 메서드
	public void StudyBoardHit(int no) {
		try {
			openConn();
			sql = "update study_group set study_hit = study_hit + 1 where study_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
	}
	
	
	// 글번호에 해당하는 스터디게시판 게시물의 상세내용을 조회하는 메서드.
	public StudyBoardDTO StudyboardContent(int no) {

		StudyBoardDTO dto = null;

		try {

			openConn();

			sql = "select * from study_group where study_num = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto = new StudyBoardDTO();

				dto.setStudy_num(rs.getInt("study_num"));
				dto.setStudy_writer(rs.getString("study_writer"));
				dto.setStudy_title(rs.getString("study_title"));
				dto.setStudy_cont(rs.getString("study_cont"));
				dto.setStudy_date(rs.getString("study_date"));
				dto.setStudy_update(rs.getString("study_update"));
				dto.setStudy_people(rs.getInt("study_people"));
				dto.setStudy_status(rs.getString("study_status"));
				dto.setStudy_start(rs.getString("study_start"));
				dto.setStudy_end(rs.getString("study_end"));
				dto.setStudy_file(rs.getString("study_file"));
				dto.setStudy_hit(rs.getInt("study_hit"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}// StudyboardContent() 메서드 end
	
	// studyboard 테이블의 게시글을 수정하는 메서드.
	public int modifyStudyboard(StudyBoardDTO dto) {
		int result = 0;
		try {
			openConn();
			sql = "select * from study_group where study_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getStudy_num());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (dto.getStudy_file() == null) { // 첨부파일을 새로 추가하지 않고 넣은 경우
					sql = "update study_group set study_title = ?, study_cont = ?, study_update = sysdate where study_num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getStudy_title());
					pstmt.setString(2, dto.getStudy_cont());
					pstmt.setInt(3, dto.getStudy_num());
					result = pstmt.executeUpdate();
				} else {// 수정 폼 창에서 첨부파일이 있는(선택한) 경우

					sql = "update study_group set study_title = ?, study_cont = ?, study_file = ?, "
							+ "study_update = sysdate where study_num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getStudy_title());
					pstmt.setString(2, dto.getStudy_cont());
					pstmt.setString(3, dto.getStudy_file());
					pstmt.setInt(4, dto.getStudy_num());
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}// modifyStudyboard()메서드 end

	// 글번호에 해당하는 studyboard 게시글을 삭제하는 메서드.
	public int deleteStudyboard(int no) {
		int result = 0;
		try {

			openConn();
			sql = "delete from study_group where study_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
			sql = "update study_group set study_num = study_num - 1 where study_num > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}// deleteStudyboard()메서드 end
	
	
	
	
	// 글번호에 해당하는 댓글리스트를 조회하는 메서드.
	public String getReplyList(int no) {

		String result = "";

		try {

			openConn();

			sql = "select * from study_comment where study_num = ? order by scomment_date desc";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			result += "<replys>";

			while (rs.next()) {

				result += "<reply>";
				result += "<scomment_num>" + rs.getInt("scomment_num") + "</scomment_num>";
				result += "<study_num>" + rs.getInt("study_num") + "</study_num>";
				result += "<scomment_writer>" + rs.getString("scomment_writer") + "</scomment_writer>";
				result += "<scomment_cont>" + rs.getString("scomment_cont") + "</scomment_cont>";
				result += "<scomment_date>" + rs.getString("scomment_date") + "</scomment_date>";
				result += "<scomment_update>" + rs.getString("scomment_update") + "</scomment_update>";
				result += "</reply>";

			}

			result += "</replys>";

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			closeConn(rs, pstmt, con);
		}

		return result;
	}// getReplyList() 메서드 end

	// 답변글을 study_comment 테이블에 저장하는 메서드
	public int replyInsert(StudyBoardCommentDTO dto) {

		int result = 0, count = 0;

		try {

			openConn();

			sql = "select max(scomment_num) from study_comment";

			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1) + 1;
			}

			sql = "insert into study_comment values(?, ?, ?, ?, sysdate, '')";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, count);

			pstmt.setInt(2, dto.getStudy_num()); // 원글번호반영

			pstmt.setString(3, dto.getScomment_writer());

			pstmt.setString(4, dto.getScomment_cont());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}

		return result;

	}// replyInsert() 메서드 end

}