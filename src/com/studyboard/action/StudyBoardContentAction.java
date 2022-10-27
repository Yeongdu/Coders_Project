package com.studyboard.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;

public class StudyBoardContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get방식으로 넘어온 글번호에 해당하는 게시글의 상세내역을 DB에서 조회하는 로직.
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int studyBoard_no = Integer.parseInt(request.getParameter("no").trim());
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		
		//게시글 조회수를 증가시키는 메서드 호출.
		dao.StudyBoardHit(studyBoard_no);
		
		
		//글번호에 해당하는 상세내역을 조회하는 메서드
	   StudyBoardDTO content = dao.StudyboardContent(studyBoard_no);
	   
	   request.setAttribute("Cont", content);
	   
	   ActionForward forward = new ActionForward();
	   
	   forward.setRedirect(false);
	   
	   forward.setPath("study/studyboard_content.jsp");
	   
		
		
		return forward;
	}

}