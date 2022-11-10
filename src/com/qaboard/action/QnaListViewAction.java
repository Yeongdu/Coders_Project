package com.qaboard.action;

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

public class QnaListViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		// ����¡ ó�� �۾� ����
		// �� �������� ������ �Խù��� ��
		int rowsize = 10;
		// �Ʒ��� ������ �������� �ִ� �� �� - ��) [1][2][3] / [4][5][6] / [7][8][9] / ....
		int block = 3;
		
		// DB���� �Խù��� ��ü ��
		int totalRecord = 0;
		// ��ü ������ �� - ��ü �Խù��� �� / �� ������ �� ������ �Խù��� ��
		int allPage = 0;
		
		int page = 0;		// ���� ������ ����
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}else {
			// ó������ "��ü �Խù� ���" a �±׸� Ŭ���� ���
			page = 1;
		}
		
		// �ش� ���������� ���� ��ȣ
		int startNo = (page * rowsize) - (rowsize -1);
		
		// �ش� ���������� ������ ��ȣ
		int endNo = (page * rowsize);
		
		// �ش� ���������� ���� ��
		int startBlock = (((page - 1) / block) * block) + 1;
		
		// �ش� ���������� �� ��
		int endBlock = (((page - 1) / block) * block) + block;
		
		
		QnaDAO dao = QnaDAO.getInstance();
		// Qna �Խ����� ��ü �� ����
		totalRecord = dao.getQnaCount();
		
		// ��ü �������� �� : ��ü �Խù��� ���� �� �������� ������ �Խù��� ���� ������
		// ��ü ������ ���� ���� �� �������� ������ ������ ������ �� + 1(������ ���� ���� �κ�)
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		// ���� �������� �ش��ϴ� �Խù��� �������� �޼��� ȣ��(�ֽż�)
		List<QnaDTO> qnaViewList = dao.getQnaViewList(page, rowsize);
		
		//랭킹 배너
		StudyBoardDAO sdao = StudyBoardDAO.getInstance(); 
		List<StudyBoardDTO> rankList = sdao.getStudyRankList();
		List<QnaDTO> qrankList = dao.getQnaRankList();
		
		// ++++++++++ �亯�� �޾ƿ��� �޼��� ++++++
		
		// ����¡ ó�� �� �۾��ߴ� ��� ������ viewpage�� �̵�
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("List", qnaViewList);
		//랭킹 배너
		request.setAttribute("rList", rankList);
		request.setAttribute("qrList", qrankList);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("qna/qna_main_view.jsp");
		
		return forward;
	}

}
