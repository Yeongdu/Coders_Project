package com.studyboard.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardCommentDTO;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;

public class StudyBoardReplyModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 댓글 수정 넘어온 데이터들을 가지고 DB에 저장하는 비지니스 로직.
		
	   int scomment_num = Integer.parseInt(request.getParameter("scomment_num").trim());
		
	  
	   String reply_cont = request.getParameter("content").trim();
	   
	  StudyBoardCommentDTO dto = new StudyBoardCommentDTO();
	  
	 
	  dto.setScomment_num(scomment_num);
	  
	  dto.setScomment_cont(reply_cont);
	  
	   
	  StudyBoardDAO dao = StudyBoardDAO.getInstance();
	   
	   int check = dao.replyModify(dto);
	   
	  PrintWriter out = response.getWriter();
	  
	  out.println(check);
		
		return null;
	}

}
