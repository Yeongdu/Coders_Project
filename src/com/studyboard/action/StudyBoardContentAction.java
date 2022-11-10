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

public class StudyBoardContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int studyBoard_no = Integer.parseInt(request.getParameter("no").trim());
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		
		dao.StudyBoardHit(studyBoard_no);
		
		List<StudyBoardDTO> rankList = dao.getStudyRankList();
		 
		QnaDAO qdao = QnaDAO.getInstance();
		
		List<QnaDTO> qrankList = qdao.getQnaRankList();
		
		request.setAttribute("qrList", qrankList);
		
		StudyBoardDTO content = dao.StudyboardContent(studyBoard_no);
			   
		request.setAttribute("Cont", content);
		
		request.setAttribute("rList", rankList);
			   
		ActionForward forward = new ActionForward();
			   
		forward.setRedirect(false);
	   
		forward.setPath("study/studyboard_content.jsp");
	   
		return forward;
	}

}