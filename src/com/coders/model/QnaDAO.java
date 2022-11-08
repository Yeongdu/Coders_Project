
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
	
	
	// qna�Խ����� �亯����� �����ϴ� �޼���
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
	
	// ������ �ڵ� ����� ��ü �Խù� ������ ã�� �޼���
	public int getQnaCodeSortCount(String code) {
		
		int count = 0;
		
		try {
			openConn();
			
			sql = "select count(*) from qna where qna_tag = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
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
	}
	
	
	// qna�Խ��ǿ��� ������ �ڵ� �� ���� �±׸� ����ϴ� �޼���
	public List<QnaDTO> codeSortList(int page, int rowsize, String codeName) {
		
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		
		// �ش� ���������� ���� ��ȣ
		int startNo = (page * rowsize) - (rowsize -1);
				
		// �ش� ���������� ������ ��ȣ
		int endNo = (page * rowsize);
		
		try {
			openConn();
			sql = "select * from (select row_number() over(order by qna_date desc) qnum, "
					+ "q.* from qna q where qna_tag=?) where qnum >=? and qnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, codeName);
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
			
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
	
	
	// qna �Խ��ǿ� �� ���� �ϴ� �޼���
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
	
	
	
	
	// qna�Խ��ǿ��� �˻��� �Խù��� ��
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
	
	
	// qna �Խ��ǿ��� �˻��� �Խñ��� ����ϴ� �޼���
	public List<QnaDTO> searchQnaList(String keyword, int page, int rowsize){
		
			List<QnaDTO> list = new ArrayList<QnaDTO>();
			
			// �ش� ���������� ���� ��ȣ
			int startNo = (page * rowsize) - (rowsize -1);
			
			// �ش� ���������� ������ ��ȣ
			int endNo = (page * rowsize);
			
			openConn();
			
				try {
					sql = "select * from (select row_number() over(order by qna_date desc) qnum, q.* from qna q where qna_title like ? or qna_cont like ?) where qnum >= ? and qnum <= ?";
					
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
	
	// ��ȸ�� ���� �޼���
	public void updateHit(int no) {
	
		try {
			openConn();
			
			sql = "update qna set qna_hit = qna_hit + 1 where qna_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
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
					dto.setQna_file(rs.getString("qna_file"));
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
					
					sql = "update qna set qna_writer = ?, qna_title = ?, qna_cont = ?, qna_update = sysdate, qna_file = ?, qna_tag = ?, qna_code = ? where qna_num = ?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, dto.getQna_writer());
					pstmt.setString(2, dto.getQna_title());
					pstmt.setString(3, dto.getQna_cont());
					pstmt.setString(4, dto.getQna_file());
					pstmt.setString(5, dto.getQna_tag());
					pstmt.setString(6, dto.getQna_code());
					pstmt.setInt(7, dto.getQna_num());
					
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
		 
		 
		//qna�Խñ� ���� �޼ҵ�
		 public int deleteQna(int no){
			  
			 int result = 0;
				
				try {
					openConn();
					
					sql = "delete from qna where qna_num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, no);
					result = pstmt.executeUpdate();
					
					sql = "update qna set qna_num = qna_num -1 where qna_num > ?";
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
			 
		 }//delete end
		 

		//�Խñ� ������ ��ȣ ���۾�
			
			 public void updateQnaNum(int no){
				
				 try {
					 
						openConn();
						 
						sql = "update qna set qna_num = qna_num - 1 where qna_num > ?";
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
		 
		 
		 
	//--------------------------------------------------------------------------------------------------------------------------------------------------
		 
	
		 //�������� �ش��ϴ� ��� ����Ʈ�� ��ȸ�ϴ� �޼ҵ�
		 public String getQnacommentList (int no){
			 
			 String result = "";
			 
			 try {
				 
				openConn();
				 
				sql = "select * from qna_comment where qna_num = ? order by qcomment_date desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				
				result += "<comments>";
				
				while (rs.next()) {
					result += "<comment>";
					result += "<qcomment_num>" + rs.getInt("qcomment_num") + "</qcomment_num>";
					result += "<qna_num>" + rs.getInt("qna_num") + "</qna_num>";
					result += "<qcomment_writer>" + rs.getString("qcomment_writer") + "</qcomment_writer>";
					result += "<qcomment_cont>" + rs.getString("qcomment_cont") + "</qcomment_cont>";
					result += "<qcomment_date>" + rs.getString("qcomment_date") + "</qcomment_date>";
					result += "<qcomment_update>" + rs.getString("qcomment_update") + "</qcomment_update>";
					result += "<qcomment_good>" + rs.getInt("qcomment_good") + "</qcomment_good>";
					result += "<qcomment_bad>" + rs.getInt("qcomment_bad") + "</qcomment_bad>";
					result += "<qcomment_code>" + rs.getString("qcomment_code") + "</qcomment_code>";
					result += "</comment>";
				}
				
				result += "</comments>";
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			 	return result;
		 } //getqnacomment end
		 
		 

		 //��� ��� �޼ҵ�
		 public int commentInsert(QnaCommentDTO dto) {
			 
			 int result = 0, count = 0; 
			 
				try {
					
					openConn();
				
					sql = "select max(qcomment_num) from qna_comment";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						count = rs.getInt(1) + 1;
					}
					
					sql = "insert into qna_comment values(?, ?, ?, ?, sysdate, '', 0, 0, 0, ?)";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, count);
					pstmt.setInt(2, dto.getQna_num());
					pstmt.setString(3, dto.getQcomment_writer());
					pstmt.setString(4, dto.getQcomment_cont());
					pstmt.setString(5, dto.getQcomment_code());

					result = pstmt.executeUpdate();
					
					// qna 테이블에 게시판 댓글 총 갯수 추가
					sql = "update qna set qna_reply = qna_reply + 1 where qna_num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, dto.getQna_num());
					pstmt.executeUpdate();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return result;
		 } //commentinsert end
		 
		 
		 //댓글 수정 메소드 
		 public int modifyQnaComment(QnaCommentDTO dto) {

				int result = 0;

				try {

					openConn();

					sql = "update qna_comment set qcomment_cont = ?, qcomment_update = sysdate, qcomment_code = ? where qcomment_num = ?";

					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, dto.getQcomment_cont());

					pstmt.setString(2, dto.getQcomment_code());
					
					pstmt.setInt(3, dto.getQcomment_num());

					result = pstmt.executeUpdate();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {

					closeConn(rs, pstmt, con);
				}

				return result;
			 
		 }
		 
		 
		 
		 
		 public int deleteQnaComment(int no) {
			 
			 
			 int result = 0;
				
				try {
					openConn();
					
					sql = "update qna set qna_reply = qna_reply-1 where qna_num =(select qna_num from qna_comment where qcomment_num = ?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.executeUpdate();
					
					sql = "delete from qna_comment where qcomment_num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, no);
					result = pstmt.executeUpdate();
					
					sql = "update qna_comment set qcomment_num = qcomment_num-1 where qcomment_num > ?";
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
		 }
		 
		 
		//���ƿ� ��ư 
		 public int goodQnaComment(int no, String id) {
			 
			 int result = 0;
			 
			 try {
		
				openConn();
				 
				sql = "update qna_comment set qcomment_good = qcomment_good + 1, user_id = ? where qcomment_num = ?";
				 
				pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, no);
				pstmt.setString(2, id);
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			 return result;
		 }//good comment end
		 
		 
		 
		// QnA ���������� ���
			public String getMainQnaList(int page, int rowsize) {
					
				String result = "";
					
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
						result += "<update>" + rs.getString("qna_update") + "</update>";
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
		 
			
//-----------------------------------------------------��õ ���� �޼ҵ� ----------------------------------------------------------------
			
			//���� ���̵� ���� ���̵� ��ȸ �޼ҵ�
			public int userIdSessionIdGood(String id, int no) {
				
				int result = 0;
				
				try {
					openConn();
					
					sql = "select user_id from good where user_id = ? and qcomment_num = ?"; 
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					pstmt.setInt(2, no);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) { //���� ���� ���
						result = 1;
						
						System.out.println("no result >>> " + result);
						
					}else { //���� �ִ� ���
						result = -1;
						
						System.out.println("yes result >>> " + result);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
					return result;
			}//compare end
			
				
			//���ƿ� ���� �޼ҵ�
			 public int upGoodQnaComment(int no, String id) {
				 
				 int result = 0, count = 0;
				 
				 try {
			
					openConn();					
					 //qcomment ���̺��� ���ƿ� �÷� ���� sql =
					 sql = "update qna_comment set qcomment_good = qcomment_good + 1 where qcomment_num = ?";
					  
					  pstmt = con.prepareStatement(sql);
					  pstmt.setInt(1, no);
					  result = pstmt.executeUpdate();
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				 return result;
			 }//good comment end			
			
			 
			 
			//good_num ���̺� ������Ʈ �޼ҵ� (���ƿ� �߰� ��)
			public int updatePlusGood (int no, String id) {
				
				int result = 0, count = 0;
				 
				 try {
			
					openConn();
					
					//good_num ���� �޼ҵ�
					sql = "select max(good_num) from good";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						count = rs.getInt(1) + 1;
					}
					
					//good ���̺� ���� ������Ʈ 
					sql = "insert into good values(?, ?, ?)";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, count);
					pstmt.setInt(2, no);
					pstmt.setString(3, id);

					result = pstmt.executeUpdate();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				 return result;
				
			} //good update end
			
			 	
			
			//���ƿ� ��� �޼ҵ� 
			public int downGoodQnaComment(int no, String id) {
				
				int result = 0, count = 0;
				 
				 try {
			
					openConn();					
					 //qcomment ���̺��� ���ƿ� �÷� ���� sql =
					 sql = "update qna_comment set qcomment_good = qcomment_good - 1 where qcomment_num = ?";
					  
					  pstmt = con.prepareStatement(sql);
					  pstmt.setInt(1, no);
					  result = pstmt.executeUpdate();
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				 return result;
				
			}//down end
			
			
			
			//good���̺� ���� ���� �޼ҵ� (���ƿ� ��� ��)
			public int updateMinusGood (int no, String id) {
				
				int result = 0;
				
				try {
					openConn();
					
					sql = "delete from good where user_id = ? and qcomment_num = ?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					pstmt.setInt(2, no);
					
					result = pstmt.executeUpdate();
					
					/*
					 * sql = "update good set good_num = good_num - 1 where good_num > ?";
					 * pstmt = con.prepareStatement(sql);
					 * pstmt.setInt(1, no);
					 * pstmt.executeUpdate();
					 */
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				
				return result;
				
			}//minus end
			
			
//-----------------------------------------------------����õ ���� �޼ҵ� ----------------------------------------------------------------
			
			//���� ���̵� ���� ���̵� ��ȸ �޼ҵ�
			public int userIdSessionIdBad(String id, int no) {
				
				int result = 0;
				
				try {
					openConn();
					
					sql = "select user_id from bad where user_id = ? and qcomment_num = ?"; 
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					pstmt.setInt(2, no);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) { //���� ���� ���
						result = 1;
						
						System.out.println("no result >>> " + result);
						
					}else { //���� �ִ� ���
						result = -1;
						
						System.out.println("yes result >>> " + result);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
					return result;
			}//compare end
			
				
			//�Ⱦ�� ���� �޼ҵ�
			 public int upBadQnaComment(int no, String id) {
				 
				 int result = 0, count = 0;
				 
				 try {
			
					openConn();					
					 //qcomment ���̺��� �Ⱦ�� �÷� ���� 
					 sql = "update qna_comment set qcomment_bad = qcomment_bad - 1 where qcomment_num = ?";
					  
					  pstmt = con.prepareStatement(sql);
					  pstmt.setInt(1, no);
					  result = pstmt.executeUpdate();
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				 return result;
			 }//good comment end			
			
			 
			 
			//bad ���̺� ������Ʈ �޼ҵ� (����õ �߰� ��)
			public int updatePlusBad (int no, String id) {
				
				int result = 0, count = 0;
				 
				 try {
			
					openConn();
					
					//bad_num ���� �޼ҵ�
					sql = "select max(bad_num) from bad";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						count = rs.getInt(1) + 1;
					}
					
					//bad ���̺� ���� ������Ʈ 
					sql = "insert into bad values(?, ?, ?)";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, count);
					pstmt.setInt(2, no);
					pstmt.setString(3, id);

					result = pstmt.executeUpdate();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				 return result;
				
			} //good update end
			
			 	
			
			//����õ ��� �޼ҵ� 
			public int downBadQnaComment(int no, String id) {
				
				int result = 0, count = 0;
				 
				 try {
			
					openConn();					
					 //qcomment ���̺��� bad �÷� ���� 
					 sql = "update qna_comment set qcomment_bad = qcomment_bad + 1 where qcomment_num = ?";
					  
					  pstmt = con.prepareStatement(sql);
					  pstmt.setInt(1, no);
					  result = pstmt.executeUpdate();
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				 return result;
				
			}//down end
			
			
			
			//good���̺� ���� ���� �޼ҵ� (���ƿ� ��� ��)
			public int updateMinusBad (int no, String id) {
				
				int result = 0;
				
				try {
					openConn();
					
					sql = "delete from bad where user_id = ? and qcomment_num = ?";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					pstmt.setInt(2, no);
					
					result = pstmt.executeUpdate();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				
				return result;
				
			}//minus end

}
