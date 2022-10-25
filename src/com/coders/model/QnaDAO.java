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

public class QnaDAO {
	
	Connection con = null;  // DB�� �����ϴ� ��ü
	PreparedStatement pstmt = null;  // DB�� SQL���� �����ϴ� ��ü 
	ResultSet rs = null;  // SQL���� ������ �Ŀ� ��� ���� ������ �ִ� ��ü
	String sql = null;  // Query���� ������ ����
	
	private static QnaDAO instance;
	
	private QnaDAO() {} // �⺻ ������
	
	// 3�ܰ� : �⺻ ������ ��� �̱��� ��ü�� return ���ִ� getInstance()��� �޼��带 ������
	//		  �ش� getInstance()��� �޼��带 �ܺο��� ������ �� �ֵ��� �����.
	
	public static QnaDAO getInstance() {
		if(instance == null) {
			instance = new QnaDAO();
		}
		
		return instance; // �ּҰ��� ��ȯ
	}
	
	public void openConn() {
	
		try {
			
			// 1�ܰ� : JNDI ���� ��ü ����
			Context ctx = new InitialContext(); //java.naming�� context
			
			// 2�ܰ� : lookup() �޼��带 �̿��Ͽ� ��Ī�Ǵ� Ŀ�ؼ� ã�� 
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle"); 
												// "java:comp.env/context.xml���� ������ name"
			// 3�ܰ� : DataSource ��ü�� �̿��Ͽ� Ŀ�ؼ��� �ϳ� �����´�.
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
	}// openConn()�޼����� end
	
	// DB�� ����� �ڿ��� �����ϴ� �޼���
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // closeConn()�޼����� end
	
	
	
	// ����¡ ó��
		public int getQnaCount() {
		
			int count = 0;
			
			try {
				openConn();
				sql = "select count(*) from qna";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return count;
		} // getBoardCount()�޼����� end

		
	
	// QnA ���������� ���
	public List<QnaDTO> getQnaList(int page, int rowsize) {
		
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		
		// �ش� ���������� ���� ��ȣ
		int startNo = (page * rowsize) - (rowsize -1);
				
		// �ش� ���������� ������ ��ȣ
		int endNo = (page * rowsize);

		try {
			openConn();
			
			sql = "select * from (select row_number() over(order by qna_date desc) qnum, q.* from qna q) where qnum >=? and qnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setQna_num(rs.getInt("qna_num"));
				dto.setQna_writer(rs.getString("qna_writer"));
				dto.setQna_title(rs.getString("qna_title"));
				dto.setQna_cont(rs.getString("qna_cont"));
				dto.setQna_date(rs.getString("qna_date"));
				dto.setQna_update(rs.getString("qna_update"));
				dto.setQna_hit(rs.getInt("qna_hit"));
				dto.setQna_tag(rs.getString("qna_tag"));
				dto.setQna_code(rs.getString("qna_code"));
				dto.setQna_reply(rs.getInt("qna_reply"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	
	
	// ��ȸ�������� �����ϴ� �޼���
	public List<QnaDTO> getQnaViewList(int page, int rowsize) {
		
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		
		// �ش� ���������� ���� ��ȣ
		int startNo = (page * rowsize) - (rowsize -1);
				
		// �ش� ���������� ������ ��ȣ
		int endNo = (page * rowsize);

		try {
			openConn();
			
			sql = "select * from (select row_number() over(order by qna_hit desc) qnum, q.* from qna q) where qnum >=? and qnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setQna_num(rs.getInt("qna_num"));
				dto.setQna_writer(rs.getString("qna_writer"));
				dto.setQna_title(rs.getString("qna_title"));
				dto.setQna_cont(rs.getString("qna_cont"));
				dto.setQna_date(rs.getString("qna_date"));
				dto.setQna_update(rs.getString("qna_update"));
				dto.setQna_hit(rs.getInt("qna_hit"));
				dto.setQna_tag(rs.getString("qna_tag"));
				dto.setQna_code(rs.getString("qna_code"));
				dto.setQna_reply(rs.getInt("qna_reply"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	
	public List<QnaDTO> qnaCList(int page, int rowsize){
		
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		
		// �ش� ���������� ���� ��ȣ
		int startNo = (page * rowsize) - (rowsize -1);
				
		// �ش� ���������� ������ ��ȣ
		int endNo = (page * rowsize);

		try {
			openConn();
			
			sql = "select * from (select row_number() over(order by qna_reply desc) qnum, q.* from qna q) where qnum >=? and qnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setQna_num(rs.getInt("qna_num"));
				dto.setQna_writer(rs.getString("qna_writer"));
				dto.setQna_title(rs.getString("qna_title"));
				dto.setQna_cont(rs.getString("qna_cont"));
				dto.setQna_date(rs.getString("qna_date"));
				dto.setQna_update(rs.getString("qna_update"));
				dto.setQna_hit(rs.getInt("qna_hit"));
				dto.setQna_tag(rs.getString("qna_tag"));
				dto.setQna_code(rs.getString("qna_code"));
				dto.setQna_reply(rs.getInt("qna_reply"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	
	
	public List<QnaDTO> codeSortList(int page, int rowsize, String codeName) {
		
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		
		// �ش� ���������� ���� ��ȣ
		int startNo = (page * rowsize) - (rowsize -1);
				
		// �ش� ���������� ������ ��ȣ
		int endNo = (page * rowsize);
		
		try {
			openConn();
			sql = "select * from (select row_number() over(order by qna_date desc) qnum, q.* from qna q) where qnum >=? and qnum <= ? and qna_tag = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			pstmt.setString(3, codeName);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setQna_num(rs.getInt("qna_num"));
				dto.setQna_writer(rs.getString("qna_writer"));
				dto.setQna_title(rs.getString("qna_title"));
				dto.setQna_cont(rs.getString("qna_cont"));
				dto.setQna_date(rs.getString("qna_date"));
				dto.setQna_update(rs.getString("qna_update"));
				dto.setQna_hit(rs.getInt("qna_hit"));
				dto.setQna_tag(rs.getString("qna_tag"));
				dto.setQna_code(rs.getString("qna_code"));
				dto.setQna_reply(rs.getInt("qna_reply"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	
	
	public int insertQna(QnaDTO dto) {
		
		int result = 0, count = 0;
		
		try {
			openConn();
			
			sql = "select max(qna_num) from qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into qna values(?,?,?,?,sysdate,'',?,0,?,?,default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getQna_writer());
			pstmt.setString(3, dto.getQna_title());
			pstmt.setString(4, dto.getQna_cont());
			pstmt.setString(5, dto.getQna_file());
			pstmt.setString(6, dto.getQna_tag());
			pstmt.setString(7, dto.getQna_code());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	
	
	
	// �˻� �Խù��� ��
	public int searchListCount(String keyword) {
		
		int count = 0;
		
		try {
			openConn();
			
			sql = "select count(*) from qna where qna_title like ? or qna_cont like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}
	
	
	public List<QnaDTO> searchQnaList(String keyword, int page, int rowsize){
		
			List<QnaDTO> list = new ArrayList<QnaDTO>();
			
			// �ش� ���������� ���� ��ȣ
			int startNo = (page * rowsize) - (rowsize -1);
			
			// �ش� ���������� ������ ��ȣ
			int endNo = (page * rowsize);
			
			openConn();
			
				try {
					sql = "select * from "
							+ "(select row_number() over(order by qna_num desc) rnum, "
							+ "q.* from qna q where qna_title like  ? or qna_cont like ?) "
							+ "where rnum >= ? and rnum <= ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setString(2, "%"+keyword+"%");
					pstmt.setInt(3, startNo);
					pstmt.setInt(4, endNo);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						QnaDTO dto = new QnaDTO();
						dto.setQna_num(rs.getInt("qna_num"));
						dto.setQna_writer(rs.getString("qna_writer"));
						dto.setQna_title(rs.getString("qna_title"));
						dto.setQna_cont(rs.getString("qna_cont"));
						dto.setQna_date(rs.getString("qna_date"));
						dto.setQna_update(rs.getString("qna_update"));
						dto.setQna_hit(rs.getInt("qna_hit"));
						dto.setQna_tag(rs.getString("qna_tag"));
						dto.setQna_code(rs.getString("qna_code"));
						dto.setQna_reply(rs.getInt("qna_reply"));
						
						list.add(dto);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				return list;
	}
	
	
	// qna �������� ��ȸ �޼ҵ�
		 public QnaDTO getQnaContent(int no) {
			 
			 QnaDTO dto = null;
			
			 try {
				openConn();
				 
				sql = "select * from qna where qna_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto = new QnaDTO();
					
					dto.setQna_num(rs.getInt("qna_num"));
					dto.setQna_writer(rs.getString("qna_writer"));
					dto.setQna_title(rs.getString("qna_title"));
					dto.setQna_cont(rs.getString("qna_cont"));
					dto.setQna_date(rs.getString("qna_date"));
					dto.setQna_update(rs.getString("qna_update"));
					dto.setQna_hit(rs.getInt("qna_hit"));
					dto.setQna_tag(rs.getString("qna_tag"));
					dto.setQna_code(rs.getString("qna_code"));
					dto.setQna_code(rs.getString("qna_code"));
					dto.setQna_reply(rs.getInt("qna_reply"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			  return dto;
		 } //getqnacontent end

		
		 
		 //qna �Խñ� ������Ʈ �޼ҵ�
		 public int updateQna(QnaDTO dto) {
			 
			 int result = 0;
			 
			 try {
				 
				openConn();
				
				sql = "select * from qna where qna_num = ? ";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, dto.getQna_num());
				rs = pstmt.executeQuery();
				 
				if(rs.next()) {
					
					sql = "update qna set qna_writer = ?, qna_title = ?, qna_cont = ?, qna_update = sysdate, qna_file = ?, qna_tag = ? where qna_num = ?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, dto.getQna_writer());
					pstmt.setString(2, dto.getQna_title());
					pstmt.setString(3, dto.getQna_cont());
					pstmt.setString(4, dto.getQna_file());
					pstmt.setString(5, dto.getQna_tag());
					pstmt.setInt(6, dto.getQna_num());
					
					result = pstmt.executeUpdate();
					
				} else {
					
					result = -1;
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			 	return result;
		 } //updateqna end
	
	
	
	
	
}
