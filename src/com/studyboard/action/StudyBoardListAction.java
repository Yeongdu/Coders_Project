package com.studyboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;
import com.coders.model.QnaDTO;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;

public class StudyBoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// ���͵� �Խ����� ���� �����ִ� �����Ͻ� ����
		
		// ����¡ ó�� �۾� ����
		
		// �� �������� ������ �Խù��� ��
		int rowsize = 10;
		
		// �Ʒ��� ������ �������� �ִ� �� �� - ��) [1][2][3] / [4][5][6]
		int block = 5;
		
		// DB �Խù��� ��ü �� (count�Լ�) -��ü ������ �� üũ�� ���� üũ
		int totalRecord = 0;
		
		//��ü ������ �� = ���������� ������ �Խù��� �� / ��ü �Խù��� ��
		int allPage = 0;
		
		int page = 0; //���������� ����
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			//ó������ "��ü �Խù� ���" a�±׸� Ŭ���� ���
			page = 1;
		}
		
		//�ش� ���������� ���۹�ȣ
		int startNo = (page * rowsize) - (rowsize - 1);
				
		//�ش� ���������� ����ȣ
		int endNo = (page * rowsize);
				
		//�ش� ���������� ���� ��
		int startBlock = (((page - 1) / block) * block) + 1;
				
		//�ش� ���������� �� ��
		int endBlock = (((page - 1) / block) * block) + block;
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		totalRecord = dao.getStudyCount();
		
		//��ü �Խù��� ���� �� �������� ������ �Խù��� ���� ������ �ָ� ��ü ������ ���� ������ �ȴ�.
		//�������� ������ ������ ������ ���� �÷��־�� �Ѵ�.
		allPage = (int)Math.ceil(totalRecord/(double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		//������������ �ش��ϴ� �Խù��� �������� �޼��� ȣ��
		List<StudyBoardDTO> pageList = dao.getStudyBoardList(page,rowsize);
		
		
		   List<StudyBoardDTO> rankList = dao.getStudyRankList();

		   QnaDAO qdao = QnaDAO.getInstance();
		   List<QnaDTO> qrankList = qdao.getQnaRankList();


		   request.setAttribute("qrList", qrankList);
		  
		
		
		
		//���ݱ��� ����¡ ó�� �� �۾��ߴ� ��� ������ view page�� �̵�
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("List", pageList);
		request.setAttribute("rList", rankList);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("study/study_list.jsp");
		
		
		return forward;
	}

}