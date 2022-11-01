package com.studyboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;

public class StudyBoardStatusViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
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
		totalRecord = dao.getStudyIngCount();
		
allPage = (int)Math.ceil(totalRecord/(double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		List<StudyBoardDTO> pageList = dao.getStudyStatusList(page,rowsize);
		
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
				
				
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("study/study_status_view.jsp");
				
				
				return forward;
	}

}