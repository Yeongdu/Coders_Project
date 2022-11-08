package com.comment.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;

public class QnaCommentDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int qcomment_no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("commant no >>> " + qcomment_no);
		
		QnaDAO dao = QnaDAO.getInstance();
		
		int check = dao.deleteQnaComment(qcomment_no);
		
		PrintWriter out = response.getWriter();

		out.println(check);
		
		return null;
		
	}

}
