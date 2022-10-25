package com.qaboard.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;

public class QnaCommentCountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int qna_num = Integer.parseInt(request.getParameter("no").trim());
		System.out.println("qna_num >>> " + qna_num);
		
		QnaDAO dao = QnaDAO.getInstance();
		int count = dao.getQcommentCount(qna_num);
		System.out.println("count >>> " + count);
		
		PrintWriter out = response.getWriter();
		
		out.println(count);
		
		return null;
	}

}
