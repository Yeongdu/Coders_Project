package com.studyboard.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardDAO;

public class StudyBoardReplyDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 댓글 삭제
		
		
		int scomment_num = Integer.parseInt(request.getParameter("scomment_num").trim());
		
		System.out.println("scomment_num >>> " + scomment_num);
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		
	    int check = dao.replyDelete(scomment_num);
	    
	    PrintWriter out = response.getWriter();
	    
	    out.println(check);
		
		return null;
	}

}
