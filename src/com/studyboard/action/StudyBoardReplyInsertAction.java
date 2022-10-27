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
		// 답변글 폼에서 넘어온 데이터들을 가지고 DB에 저장하는 비지니스 로직.
		
		int study_num = Integer.parseInt(request.getParameter("study_num").trim());

		

		String reply_cont = request.getParameter("content").trim();
		
		String scomment_writer = request.getParameter("scomment_writer").trim();
		
		
		
		
		System.out.println("reply_cont >>> " + reply_cont);
		System.out.println("scomment_writer >>> " + scomment_writer);
		
		
		StudyBoardCommentDTO dto = new StudyBoardCommentDTO();
		
		
		dto.setStudy_num(study_num);
		
	
		
		dto.setScomment_cont(reply_cont);
		
		dto.setScomment_writer(scomment_writer);
		
	
		
		
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		
		
		
		int check = dao.replyInsert(dto);
		
	    PrintWriter out = response.getWriter();
	    
	    
	    //결과값을 ajax에 보내줌
	    
	    out.println(check);
		
		
		
		
		
		return null;
	}

}

