package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.UserDAO;
import com.coders.model.UserDTO;

public class CodersUserContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("userId");
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = dao.userContentSearch(userId);
		
		int qnaboardcount = dao.userQnaBoardCount(userId);
		
		int qnacommentcount = dao.userQnaCommentCount(userId);
		
		int studyboardcount = dao.userStudyBoardCount(userId);
		
		int studycomment = dao.userStudyCommentCount(userId);
		
		request.setAttribute("content", dto);
		
		request.setAttribute("qnaboardcount", qnaboardcount);
		
		request.setAttribute("qnacommentcount", qnacommentcount);
		
		request.setAttribute("studyboardcount", studyboardcount);
		
		request.setAttribute("studycomment", studycomment);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("Login/profile.jsp");
		
		return forward;
	}

}
