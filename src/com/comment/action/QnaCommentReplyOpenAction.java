package com.comment.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;

public class QnaCommentReplyOpenAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		int qcomment_no = Integer.parseInt(request.getParameter("no"));
		String userId = (String) session.getAttribute("userId");
		
		System.out.println("open action no>>> " + qcomment_no);
		System.out.println("open action id>>> " + userId);
		
		QnaDAO dao = QnaDAO.getInstance();
		PrintWriter out = response.getWriter();
		
				
		out.println(qcomment_no);
		
		return null;
	}

}
