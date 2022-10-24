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
	// DB�� �����ϴ� ��ü.
	Connection con = null;

	// DB�� SQL���� �����ϴ� ��ü
	PreparedStatement pstmt = null;

	// SQL���� ������ �Ŀ� ��� ���� ������ �ִ� ��ü.
	ResultSet rs = null;

	// �������� ������ ����
	String sql = null;

	// StudyBoardDAO ��ü�� �̱��� ������� ����� ����.
	// 1�ܰ� : �̱��� ������� ��ü�� ����� ���ؼ��� �켱������
	// �⺻�������� ���������ڸ� public�� �ƴ� private
	// ���� �ٲپ� �־�� �Ѵ�.
	// ��, �ܺο��� ���������� �⺻�����ڸ� ȣ������
	// ���ϰ� �ϴ� ����̴�.

	// 2�ܰ� : StudyBoardDAO ��ü�� ����(static) ����� ������
	// �� �־�� �Ѵ�.
	private static StudyBoardDAO instance;

	private StudyBoardDAO() {
	} // �⺻ ������

	// 3�ܰ� : �⺻ ������ ��ſ� �̱��� ��ü�� return �� �ִ�
	// getInstance() ��� �޼��带 ���� �ش�
	// getInstance() ��� �޼��带 �ܺο��� ������ ��
	// �ֵ��� �� �ָ� ��.
	public static StudyBoardDAO getInstance() {

		if (instance == null) {
			instance = new StudyBoardDAO();
		}

		return instance;
	}

	public void openConn() {

		try {
			// 1�ܰ� : JNDI ���� ��ü ����
			Context ctx = new InitialContext();

			// 2�ܰ� : lookup() �޼��带 �̿��Ͽ� ��Ī�Ǵ�
			// Ŀ�ؼ��� ã�´�.
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

			// 3�ܰ� : DataSource ��ü�� �̿��Ͽ�
			// Ŀ�ؼ��� �ϳ� �����´�.
			con = ds.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} // openConn() �޼��� end

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

	} // closeConn() �޼��� end

	// ���͵� �Խ����� ��ü ���� ��ȸ�ϴ� �޼���
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
	
	//Study �Խ��� �۾��� �޼���
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
			sql = "insert into study_group values(?,?,?,?,sysdate,'',?,'������',?,?,?,0)";
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

	
	
	// �Խñ��� ��ȸ���� ������Ű�� �޼���
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
	
	
	// �۹�ȣ�� �ش��ϴ� ���͵�Խ��� �Խù��� �󼼳����� ��ȸ�ϴ� �޼���.
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
	}// StudyboardContent() �޼��� end
	
	// studyboard ���̺��� �Խñ��� �����ϴ� �޼���.
	public int modifyStudyboard(StudyBoardDTO dto) {
		int result = 0;
		try {
			openConn();
			sql = "select * from study_group where study_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getStudy_num());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (dto.getStudy_file() == null) { // ÷�������� ���� �߰����� �ʰ� ���� ���
					sql = "update study_group set study_title = ?, study_cont = ?, study_update = sysdate where study_num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getStudy_title());
					pstmt.setString(2, dto.getStudy_cont());
					pstmt.setInt(3, dto.getStudy_num());
					result = pstmt.executeUpdate();
				} else {// ���� �� â���� ÷�������� �ִ�(������) ���

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
	}// modifyStudyboard()�޼��� end

	// �۹�ȣ�� �ش��ϴ� studyboard �Խñ��� �����ϴ� �޼���.
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
	}// deleteStudyboard()�޼��� end
	
	
	
	
	// �۹�ȣ�� �ش��ϴ� ��۸���Ʈ�� ��ȸ�ϴ� �޼���.
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
	}// getReplyList() �޼��� end

	// �亯���� study_comment ���̺� �����ϴ� �޼���
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

			pstmt.setInt(2, dto.getStudy_num()); // ���۹�ȣ�ݿ�

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

	}// replyInsert() �޼��� end

}