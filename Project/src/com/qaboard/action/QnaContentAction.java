package com.qaboard.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;
import com.coders.model.QnaDTO;


public class QnaContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int qna_no = Integer.parseInt(request.getParameter("no").trim());
		
		QnaDAO dao = QnaDAO.getInstance();
		
		QnaDTO dto = dao.getQnaContent(qna_no);
		
		System.out.println("qna_no >>> " + qna_no);
		
		request.setAttribute("Cont", dto);
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("qna/qna_content.jsp");
		
		return forward;
		
	}

}
