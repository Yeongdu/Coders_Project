package com.comment.action;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.model.QNACommentDAO;
import com.coders.model.QNACommentDTO;

import com.qaboard.action.Action;
import com.qaboard.action.ActionForward;

public class QnaCommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int qna_no = Integer.parseInt(request.getParameter("no").trim());
		
		QNACommentDAO dao = QNACommentDAO.getInstance();
		
		QNACommentDTO dto = dao.getQnaComment(qna_no);
		
		request.setAttribute("Qcomment", dto);
		
		ActionForward forward = new ActionForward();

		forward.setRedirect(false);
		forward.setPath("qna/qna_comment.jsp");
		
		return forward;
	
		
	}

}
