package com.studyboard.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardCommentDTO;
import com.coders.model.StudyBoardDAO;

public class StudyBoardReplyInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// �亯�� ������ �Ѿ�� �����͵��� ������ DB�� �����ϴ� �����Ͻ� ����.
		
		int study_num = Integer.parseInt(request.getParameter("study_num").trim());

		

		String reply_cont = request.getParameter("content").trim();
		
		
		System.out.println("reply_cont >>> " + reply_cont);
		// System.out.println("reply_num >>> " + reply_num);
		
		
		StudyBoardCommentDTO dto = new StudyBoardCommentDTO();
		
		
		dto.setStudy_num(study_num);
		
	
		
		dto.setScomment_cont(reply_cont);
		
		
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		
		
		
		int check = dao.replyInsert(dto);
		
	    PrintWriter out = response.getWriter();
	    
	    
	    //������� ajax�� ������
	    
	    out.println(check);
		
		
		
		
		
		return null;
	}

}

